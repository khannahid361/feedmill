<?php

namespace Modules\Product\Http\Controllers;

use App\Http\Controllers\BaseController;
use App\Models\Category;
use App\Models\Tax;
use App\Models\Unit;
use App\Traits\UploadAble;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Material\Entities\Material;
use Modules\Product\Entities\Product;
use Modules\Product\Entities\Recipe;
use Modules\Product\Http\Requests\ProductFormRequest;
use Modules\Sale\Entities\SaleProduct;

class RecipeController extends BaseController
{
    use UploadAble;
    public function __construct(Recipe $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if (permission('product-access')) {
            $this->setPageData('Product Manage', 'Product Manage', 'fas fa-box', [['name' => 'Product Manage']]);
            $data = [
                'categories' => Category::allProductCategories(),
            ];
            return view('product::index', $data);
        } else {
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if ($request->ajax()) {
            if (permission('product-access')) {

                if (!empty($request->name)) {
                    $this->model->setName($request->name);
                }
                if (!empty($request->category_id)) {
                    $this->model->setCategoryID($request->category_id);
                }
                if (!empty($request->status)) {
                    $this->model->setStatus($request->status);
                }
                if (!empty($request->product_type)) {
                    $this->model->setProductType($request->product_type);
                }
                if (!empty($request->type)) {
                    $this->model->setType($request->type);
                }

                $this->set_datatable_default_properties($request); //set datatable default properties
                $list = $this->model->getDatatableList(); //get table data
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    if (permission('product-edit')) {
                        $action .= ' <a class="dropdown-item" href="' . route("product.edit", $value->id) . '">' . self::ACTION_BUTTON['Edit'] . '</a>';
                    }
                    if (permission('product-view')) {
                        $action .= ' <a class="dropdown-item" href="' . url("product/view/" . $value->id) . '">' . self::ACTION_BUTTON['View'] . '</a>';
                    }
                    if (permission('product-delete')) {
                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->name . '">' . self::ACTION_BUTTON['Delete'] . '</a>';
                    }

                    $row = [];
                    if (permission('product-bulk-delete')) {
                        $row[] = row_checkbox($value->id); //custom helper function to show the table each row checkbox
                    }

                    $row[] = $no;
                    $row[] = $this->table_image(PRODUCT_IMAGE_PATH, $value->image, $value->name);
                    $row[] = $value->name;
                    $row[] = $value->category->name;
                    $row[] = number_format($value->cost, 2, '.', '');
                    $row[] = $value->base_unit->unit_name . ' (' . $value->base_unit->unit_code . ')';
                    // $row[] = $value->unit->unit_name.' ('.$value->unit->unit_code.')';
                    // $row[] = number_format($value->unit_price,2,'.','');
                    $row[] = number_format($value->base_unit_price, 2, '.', '');
                    // $row[] = $value->unit_qty ?? 0;
                    $row[] = (!$value->warehouse_product->isEmpty()) ? number_format($value->warehouse_product[0]->qty, 2, '.', '') : 0;
                    $row[] = $value->alert_quantity ?? 0;
                    $row[] = permission('product-edit') ? change_status($value->id, $value->status, $value->name) : STATUS_LABEL[$value->status];
                    $row[] = action_button($action); //custom helper function for action button
                    $data[] = $row;
                }
                return $this->datatable_draw(
                    $request->input('draw'),
                    $this->model->count_all(),
                    $this->model->count_filtered(),
                    $data
                );
            }
        } else {
            return response()->json($this->unauthorized());
        }
    }

    public function create()
    {
        if (permission('product-add')) {
            $this->setPageData('Add Product', 'Add Product', 'fab fa-product-hunt', [['name' => 'Product', 'link' => route('product')], ['name' => 'Add Product']]);
            $data = [
                'materials'  => Material::where('status', 1)->get(),
                'categories' => Category::allProductCategories(),
                'units'      => Unit::all(),
                'taxes'      => Tax::activeTaxes(),
            ];
            return view('product::create', $data);
        } else {
            return $this->access_blocked();
        }
    }


    public function store_or_update(ProductFormRequest $request)
    {
        if ($request->ajax()) {
            if (permission('product-add')) {
                DB::beginTransaction();
                try {
                    $collection = collect($request->except(['materials', 'image', 'product_id']));
                    $collection = $this->track_data($collection, $request->update_id);

                    $image = $request->old_image;
                    if ($request->hasFile('image')) {
                        $image = $this->upload_file($request->file('image'), PRODUCT_IMAGE_PATH);
                        if (!empty($request->old_image)) {
                            $this->delete_file($request->old_image, PRODUCT_IMAGE_PATH);
                        }
                    }

                    $tax_id = $request->tax_id ?? null;
                    $collection = $collection->merge(compact('tax_id', 'image'));

                    $result = $this->model->updateOrCreate(['id' => $request->update_id], $collection->all());
                    $product = $this->model->with('product_material')->find($result->id);

                    $product_materials = [];
                    if ($request->has('materials')) {
                        foreach ($request->materials as $value) {
                            $product_materials[$value['id']] = ['qty' => $value['qty']];
                        }
                    }

                    $product->product_material()->sync($product_materials);

                    $output = $this->store_message($result, null);
                    DB::commit();
                } catch (\Throwable $th) {
                    DB::rollback();
                    $output = ['status' => 'error', 'message' => $th->getMessage()];
                }
            } else {
                $output     = $this->unauthorized();
            }
            return response()->json($output);
        } else {
            return response()->json($this->unauthorized());
        }
    }

    public function edit(int $id)
    {

        if (permission('product-edit')) {
            $this->setPageData('Edit Product', 'Edit Product', 'fab fa-pencil', [['name' => 'Product', 'link' => route('product')], ['name' => 'Edit Product']]);
            $data = [
                'materials'  => Material::where('status', 1)->get(),
                'categories' => Category::allProductCategories(),
                'units'      => Unit::all(),
                'taxes'      => Tax::activeTaxes(),
                'product' => Product::with('product_materials')->find($id)
            ];
            //            return $data;
            return view('product::edit', $data);
        } else {
            return $this->access_blocked();
        }
    }

    public function update(ProductFormRequest $request)
    {
        if ($request->ajax()) {
            if (permission('product-add')) {
                DB::beginTransaction();
                try {
                    $collection = collect($request->validated())->except(['materials', 'image', 'product_id']);
                    $collection = $this->track_data($collection, $request->update_id);
                    $image      = $request->old_image;
                    if ($request->hasFile('image')) {
                        $image = $this->upload_file($request->file('image'), PRODUCT_IMAGE_PATH);
                        if (!empty($request->old_image)) {
                            $this->delete_file($request->old_image, PRODUCT_IMAGE_PATH);
                        }
                    }
                    $tax_id = $request->tax_id ? $request->tax_id : null;
                    $collection = $collection->merge(compact('tax_id', 'image'));
                    $result       = $this->model->updateOrCreate(['id' => $request->update_id], $collection->all());
                    $product = $this->model->with('product_material')->find($result->id);

                    $output = $this->store_message($result, $request->update_id);
                    DB::commit();
                } catch (\Throwable $th) {
                    DB::rollback();
                    $output = ['status' => 'error', 'message' => $th->getMessage()];
                }
            } else {
                $output     = $this->unauthorized();
            }
            return response()->json($output);
        } else {
            return response()->json($this->unauthorized());
        }
    }

    public function show(int $id)
    {

        if (permission('product-view')) {
            $this->setPageData('Product Details', 'Product Details', 'fas fa-paste', [['name' => 'Product', 'link' => route('product')], ['name' => 'Product Details']]);
            $product = $this->model->with('category', 'tax', 'base_unit', 'product_material','product_materials')->findOrFail($id);
            // return response()->json($product);
            return view('product::details', compact('product'));
        } else {
            return $this->access_blocked();
        }
    }

    public function delete(Request $request)
    {
        if ($request->ajax()) {
            if (permission('product-delete')) {
                DB::beginTransaction();
                try {
                    $sale_product = SaleProduct::where('product_id', $request->id)->get()->count();
                    if ($sale_product > 0) {
                        $output = ['status' => 'error', 'message' => 'Cannot delete because this product is realted with sale and purchase data'];
                    } else {

                        $product  = $this->model->find($request->id);
                        $old_image = $product ? $product->image : '';
                        $result    = $product->delete();
                        if ($result && $old_image != '') {
                            $this->delete_file($old_image, PRODUCT_IMAGE_PATH);
                        }
                        $output   = $this->delete_message($result);
                    }
                    DB::commit();
                } catch (\Throwable $th) {
                    DB::rollback();
                    $output = ['status' => 'error', 'message' => $th->getMessage()];
                }
            } else {
                $output   = $this->unauthorized();
            }
            return response()->json($output);
        } else {
            return response()->json($this->unauthorized());
        }
    }
}
