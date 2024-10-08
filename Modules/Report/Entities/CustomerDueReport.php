<?php

namespace Modules\Report\Entities;

use Illuminate\Support\Facades\DB;
use App\Models\BaseModel;
use Modules\Account\Entities\ChartOfAccount;
use Modules\Account\Entities\Transaction;
use Modules\Location\Entities\Area;
use Modules\Location\Entities\District;
use Modules\Location\Entities\Upazila;
use Modules\Setting\Entities\CustomerGroup;
use Modules\Setting\Entities\Warehouse;

class CustomerDueReport extends BaseModel
{
    protected $table = 'customers';
    public function customer_group()
    {
        return $this->belongsTo(CustomerGroup::class, 'customer_group_id', 'id');
    }
    public function warehouse()
    {
        return $this->belongsTo(Warehouse::class, 'warehouse_id', 'id');
    }
    public function district()
    {
        return $this->belongsTo(District::class, 'district_id', 'id');
    }
    public function upazila()
    {
        return $this->belongsTo(Upazila::class, 'upazila_id', 'id');
    }

    public function area()
    {
        return $this->belongsTo(Area::class, 'area_id', 'id');
    }
    public function coa()
    {
        return $this->hasOne(ChartOfAccount::class, 'customer_id', 'id');
    }

    public function previous_balance()
    {
        return $this->hasOneThrough(Transaction::class, ChartOfAccount::class, 'customer_id', 'chart_of_account_id', 'id', 'id')
            ->where('voucher_type', 'PR Balance')->withDefault(['debit' => '']);
    }

    public function customer_balance(int $id)
    {
        $data = DB::table('customers as c')
            ->selectRaw('c.id,b.id as coaid,b.code,((select ifnull(sum(debit),0) from transactions where chart_of_account_id= b.id AND approve = 1)-(select ifnull(sum(credit),0) from transactions where chart_of_account_id= b.id AND approve = 1)) as balance')
            ->leftjoin('chart_of_accounts as b', 'c.id', '=', 'b.customer_id')
            ->where('c.id', $id)->first();
        $balance = 0;
        if ($data) {
            $balance = $data->balance ? $data->balance : 0;
        }
        return $balance;
    }

    //custom search column property
    protected $_name;
    protected $_shop_name;
    protected $_mobile;
    protected $_email;
    protected $_customer_group_id;
    protected $_area_id;
    protected $_district_id;
    protected $_warehouse_id;
    protected $_upazila_id;
    protected $_status;

    //methods to set custom search property value
    public function setName($name)
    {
        $this->_name = $name;
    }
    public function setShopName($shop_name)
    {
        $this->_shop_name = $shop_name;
    }
    public function setMobile($mobile)
    {
        $this->_mobile = $mobile;
    }
    public function setEmail($email)
    {
        $this->_email = $email;
    }
    public function setCustomerGroupID($customer_group_id)
    {
        $this->_customer_group_id = $customer_group_id;
    }
    public function setWarehouseID($warehouse_id)
    {
        $this->_warehouse_id = $warehouse_id;
    }
    public function setDistrictID($district_id)
    {
        $this->_district_id = $district_id;
    }
    public function setUpazilaID($upazila_id)
    {
        $this->_upazila_id = $upazila_id;
    }
    public function setAreaID($area_id)
    {
        $this->_area_id = $area_id;
    }

    public function setStatus($status)
    {
        $this->_status = $status;
    }


    private function get_datatable_query()
    {
        //set column sorting index table column name wise (should match with frontend table header)

        $this->column_order = ['id', 'id', 'name', 'customer_group_id', 'warehouse_id', 'district_id', 'upazila_id', 'area_id', 'status', null, null];


        $query = self::with('customer_group', 'district', 'upazila', 'area', 'warehouse');
        if (auth()->user()->warehouse_id) {
            $query->where('warehouse_id',  auth()->user()->warehouse_id);
        }

        //search query
        if (!empty($this->_name)) {
            $query->where('name', 'like', '%' . $this->_name . '%');
        }
        if (!empty($this->_shop_name)) {
            $query->where('shop_name', 'like', '%' . $this->_shop_name . '%');
        }
        if (!empty($this->_mobile)) {
            $query->where('mobile', 'like', '%' . $this->_mobile . '%');
        }
        if (!empty($this->_email)) {
            $query->where('email', 'like', '%' . $this->_email . '%');
        }
        if (!empty($this->_customer_group_id)) {
            $query->where('customer_group_id',  $this->_customer_group_id);
        }
        if (!empty($this->_warehouse_id)) {
            $query->where('warehouse_id',  $this->_warehouse_id);
        }
        if (!empty($this->_district_id)) {
            $query->where('district_id',  $this->_district_id);
        }
        if (!empty($this->_area_id)) {
            $query->where('area_id',  $this->_area_id);
        }
        if (!empty($this->_upazila_id)) {
            $query->where('upazila_id',  $this->_upazila_id);
        }

        if (!empty($this->_status)) {
            $query->where('status', $this->_status);
        }

        //order by data fetching code
        if (isset($this->orderValue) && isset($this->dirValue)) { //orderValue is the index number of table header and dirValue is asc or desc
            $query->orderBy($this->column_order[$this->orderValue], $this->dirValue); //fetch data order by matching column
        } else if (isset($this->order)) {
            $query->orderBy(key($this->order), $this->order[key($this->order)]);
        }
        return $query;
    }

    public function getDatatableList()
    {
        $query = $this->get_datatable_query();
        if ($this->lengthVlaue != -1) {
            $query->offset($this->startVlaue)->limit($this->lengthVlaue);
        }
        return $query->get();
    }

    public function count_filtered()
    {
        $query = $this->get_datatable_query();
        return $query->get()->count();
    }

    public function count_all()
    {
        $query = self::toBase();
        if (auth()->user()->warehouse_id) {
            $query->where('warehouse_id',  auth()->user()->warehouse_id);
        }
        return $query->get()->count();
    }

    public function scopeActive($query)
    {
        return $query->where(['status' => 1]);
    }

    public function scopeInactive($query)
    {
        return $query->where(['status' => 2]);
    }
}
