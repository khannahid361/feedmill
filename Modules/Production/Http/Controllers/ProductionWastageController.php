<?php

namespace Modules\Production\Http\Controllers;

use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Modules\Production\Entities\ProductionWastage;

class ProductionWastageController extends BaseController
{
    public function __construct(ProductionWastage $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        $this->setPageData('Transfer Product','Transfer Product','fas fa-dolly-flatbed',[['name' => 'Transfer Product']]);
        $wastage = ProductionWastage::with('product')->get();
        dd($wastage);
        return view('production::production-wastage.index');
    }
    public function datatableData(Request $request)
    {
        // return view('production::create');
    }

}
