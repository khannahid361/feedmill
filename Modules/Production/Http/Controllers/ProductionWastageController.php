<?php

namespace Modules\Production\Http\Controllers;

use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Modules\Product\Entities\Product;
use Modules\Production\Entities\ProductionWastage;

class ProductionWastageController extends BaseController
{
    public function __construct(ProductionWastage $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        $this->setPageData('Transfer Product', 'Transfer Product', 'fas fa-dolly-flatbed', [['name' => 'Transfer Product']]);
        $wastage = ProductionWastage::with('product')->get();
        $products = Product::all();
        $data = [
            'products' => $products,
            'wastage' => $wastage
        ];
        return view('production::production-wastage.index', $data);
    }
    public function datatableData(Request $request)
    {
        if ($request->ajax()) {

            if (!empty($request->product_id)) {
                $this->model->setProduct($request->product_id);
            }

            $this->set_datatable_default_properties($request); //set datatable default properties
            $list = $this->model->getDatatableList(); //get table data
            $data = [];
            $no = $request->input('start');
            foreach ($list as $value) {
                $no++;
                $row = [];
                $row[] = $no;
                $row[] = $value->product->name;
                $row[] = $value->recyclable_wastage;
                $row[] = $value->permanent_wastage;
                $data[] = $row;
            }
            return $this->datatable_draw(
                $request->input('draw'),
                $this->model->count_all(),
                $this->model->count_filtered(),
                $data
            );
        }
    }
}
