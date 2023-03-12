<?php

namespace Modules\HRM\Entities;

use App\Models\BaseModel;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Modules\Designation\Entities\Designation;

class Salary extends BaseModel
{
    protected $table = 'salarys';
    protected $fillable = ['employee_id','employee_type','basic_salary','house_rent_allowance','medical_allowance','transport_allowance','mobile_allowance','other_allowance','provident_fund_contribution','total_provident_fund','tax_deduction','provident_fund_deduction','other_deduction','gross_salary','total_deduction','net_salary','date','month','joining_month','status','retired_date','created_by'];

    public function allowances()
    {
        return $this->hasMany(Allowances::class,'employee_id','employee_id');
    }
    public function employee()
    {
        return $this->belongsTo(Employee::class,'employee_id','id');
    }

    /******************************************
     * * * Begin :: Custom Datatable Code * * *
     *******************************************/
    //custom search column property
    protected $employee_id;

    //methods to set custom search property value
    public function setName($employee_id) {
        $this->employee_id = $employee_id;
    }

    private function get_datatable_query(){
        $query = self::with('employee');

        if (!empty($this->employee_id)) {
            $query->where('employee_id', $this->employee_id );
        }
        //order by data fetching code
        if (isset($this->orderValue) && isset($this->dirValue)) { //orderValue is the index number of table header and dirValue is asc or desc
            $query->orderBy($this->column_order[$this->orderValue], $this->dirValue); //fetch data order by matching column
        } else if (isset($this->order)) {
            $query->orderBy(key($this->order), $this->order[key($this->order)]);
        }
        return $query;
    }

    public function getDatatableList(){
        $query = $this->get_datatable_query();
        if ($this->lengthVlaue != -1) {
            $query->offset($this->startVlaue)->limit($this->lengthVlaue);
        }
        return $query->get();
    }

    public function count_filtered(){
        $query = $this->get_datatable_query();
        return $query->get()->count();
    }

    public function count_all(){
        return self::toBase()->get()->count();
    }
    /******************************************
     * * * End :: Custom Datatable Code * * *
     *******************************************/
}
