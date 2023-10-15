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
use Modules\Product\Entities\ProductMaterial;
use Modules\Product\Entities\Recipe;
use Modules\Product\Http\Requests\ProductFormRequest;
use Modules\Product\Http\Requests\RecipeFormRequest;
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
        if (permission('recipe-access')) {
            $this->setPageData('Recipe Manage', 'Recipe Manage', 'fas fa-mortar-pestle', [['name' => 'Recipe Manage']]);
            $data = [
                'products' => Product::where('status', 1)->get(),
            ];
            return view('product::recipe.index', $data);
        } else {
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if ($request->ajax()) {
            if (permission('recipe-access')) {

                if (!empty($request->recipe_name)) {
                    $this->model->setName($request->recipe_name);
                }
                if (!empty($request->recipe_code)) {
                    $this->model->setRecipeCode($request->recipe_code);
                }
                if (!empty($request->status)) {
                    $this->model->setStatus($request->status);
                }
                if (!empty($request->product_id)) {
                    $this->model->setProduct($request->product_id);
                }
                $this->set_datatable_default_properties($request); //set datatable default properties
                $list = $this->model->getDatatableList(); //get table data
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    if (permission('recipe-edit')) {
                        $action .= ' <a class="dropdown-item" href="' . route("recipe.edit", $value->id) . '">' . self::ACTION_BUTTON['Edit'] . '</a>';
                    }
                    if (permission('recipe-view')) {
                        $action .= ' <a class="dropdown-item" href="' . url("recipe/view/" . $value->id) . '">' . self::ACTION_BUTTON['View'] . '</a>';
                    }
                    if (permission('recipe-delete')) {
                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->name . '">' . self::ACTION_BUTTON['Delete'] . '</a>';
                    }

                    $row = [];

                    $row[] = $no;
                    $row[] = $value->recipe_code;
                    $row[] = $value->recipe_name;
                    $row[] = $value->product->name;
                    $row[] = date("d-m-Y", strtotime($value->recipe_date));
                    $row[] = $value->created_by;
                    $row[] = $value->modified_by ?? "<span class='label label-rounded label-danger'></span>";
                    $row[] = permission('recipe-edit') ? change_status($value->id, $value->status, $value->recipe_name) : STATUS_LABEL[$value->status];
                    $row[] = action_button($action);
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
        if (permission('recipe-add')) {
            $this->setPageData('Add Product Recipe', 'Add Product Recipe', 'fas fa-mortar-pestle', [['name' => 'Product', 'link' => route('recipe')], ['name' => 'Add Product Recipe']]);
            $data = [
                'materials' => Material::where('status', 1)->get(),
                'products' => Product::where('status', 1)->get(),
                'code' => 'RCP-' . date('ymd') . rand(1, 999)
            ];
            return view('product::recipe.create', $data);
        } else {
            return $this->access_blocked();
        }
    }


    public function store_or_update(RecipeFormRequest $request)
    {
        if ($request->ajax()) {
            if (permission('recipe-add')) {
                DB::beginTransaction();
                try {
                    $collection = collect($request->except(['materials']));
                    $collection = $this->track_data($collection, $request->update_id);

                    $result = $this->model->updateOrCreate(['id' => $request->update_id], $collection->all());
                    $product = $this->model->with('product_material')->find($result->id);

                    $product_materials = [];
                    if ($request->has('materials')) {
                        foreach ($request->materials as $value) {
                            $product_materials[$value['id']] = ['qty' => $value['qty'], 'product_id' => $request->product_id];
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
                $output = $this->unauthorized();
            }
            return response()->json($output);
        } else {
            return response()->json($this->unauthorized());
        }
    }

    public function change_status(Request $request)
    {
        if ($request->ajax()) {
            if (permission('recipe-edit')) {
                $result = $this->model->find($request->id)->update(['status' => $request->status]);
                $output = $result ? ['status' => 'success', 'message' => 'Status Has Been Changed Successfully']
                    : ['status' => 'error', 'message' => 'Failed To Change Status'];
            } else {
                $output = $this->unauthorized();
            }
            return response()->json($output);
        } else {
            return response()->json($this->unauthorized());
        }
    }

    public function edit(int $id)
    {

        if (permission('recipe-edit')) {
            $this->setPageData('Edit Product Recipe', 'Edit Product Recipe', 'fas fa-mortar-pestle', [['name' => 'Recipe', 'link' => route('recipe')], ['name' => 'Edit Product Recipe']]);
            $data = [
                'materials' => Material::where('status', 1)->get(),
                'products'  => Product::where('status', 1)->get(),
                'recipe'    => $this->model->with('product_materials')->findOrFail($id)
            ];
//            return response()->json($data);
            return view('product::recipe.edit', $data);
        } else {
            return $this->access_blocked();
        }
    }

    public function show(int $id)
    {

        if (permission('recipe-view')) {
            $this->setPageData('Product Recipe Details', 'Product Recipe Details', 'fas fa-paste', [['name' => 'Recipe', 'link' => route('recipe')], ['name' => 'Product Recipe Details']]);
            $product = $this->model->with('product', 'product_material', 'product_materials')->findOrFail($id);
            return view('product::recipe.details', compact('product'));
        } else {
            return $this->access_blocked();
        }
    }

    public function delete(Request $request)
    {
        if ($request->ajax()) {
            if (permission('recipe-delete')) {
                DB::beginTransaction();
                try {
                    $recipe = $this->model->find($request->id);
                    $deleteProductMaterials = ProductMaterial::Where('recipe_id', $request->id)->delete();
                    $result = $recipe->delete();
                    $output = $this->delete_message($result);
                    DB::commit();
                } catch (\Throwable $th) {
                    DB::rollback();
                    $output = ['status' => 'error', 'message' => $th->getMessage()];
                }
            } else {
                $output = $this->unauthorized();
            }
            return response()->json($output);
        } else {
            return response()->json($this->unauthorized());
        }
    }
}
