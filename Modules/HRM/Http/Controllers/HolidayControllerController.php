<?php

namespace Modules\HRM\Http\Controllers;

use App\Http\Controllers\BaseController;
use Modules\HRM\Entities\Holiday;

class HolidayControllerController extends BaseController
{
    public function __construct(Holiday $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if (permission('holiday-access')) {
            $this->setPageData('Manage Holiday', 'Manage Holiday', 'fab fa-opencart', [['name' => 'Manage Holiday']]);

            return view('sale::index');
        } else {
            return $this->access_blocked();
        }
    }
}
