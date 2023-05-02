<?php

namespace Modules\Account\Entities;

use App\Models\BaseModel;
use Illuminate\Support\Facades\DB;
use Modules\Customer\Entities\Customer;
use Modules\SalesMen\Entities\Salesmen;
use Modules\Supplier\Entities\Supplier;
use Modules\Account\Entities\Transaction;
use Modules\Dealer\Entities\Dealer;

class ChartOfAccount extends BaseModel
{
    protected $fillable = [ 'code', 'name', 'parent_name', 'level', 'type', 'transaction', 'general_ledger',
    'customer_id', 'supplier_id','asm_id', 'salesmen_id', 'dealer_id','bank_id','mobile_bank_id','budget', 'depreciation', 'depreciation_rate', 'status', 'created_by', 'modified_by'];

    public function transactions()
    {
        return $this->hasMany(Transaction::class,'chart_of_account_id','id');
    }


    public static function bankHeadCode()
    {
        return self::where('level',4)->where('code','like', '1020102%')->max('code');
    }
    public static function mobileBankHeadCode()
    {
        return self::where('level',4)->where('code','like', '1020103%')->max('code');
    }

    public static function account_id_by_name($name)
    {
        $query = self::where('name',$name)->first();
        return $query->id;
    }

    public function supplier()
    {
        return $this->belongsTo(Supplier::class,'supplier_id','id');
    }
    public function customer()
    {
        return $this->belongsTo(Customer::class,'customer_id','id');
    }
    public function salesmen()
    {
        return $this->belongsTo(Salesmen::class,'salesmen_id','id');
    }
    public function dealer()
    {
        return $this->belongsTo(Dealer::class,'dealer_id','id');
    }


    /******************************************
     * * * Begin :: Custom Datatable Code * * *
    *******************************************/
    protected $order = ['id' => 'asc'];
    protected $_name;

    //methods to set custom search property value
    public function setName($name)
    {
        $this->_name = $name;
    }

    private function get_datatable_query()
    {
        //set column sorting index table column name wise (should match with frontend table header)

        $this->column_order = ['id','name', 'code','parent_name','type',null,null,null];


        $query = self::toBase();
        //search query
        if (!empty($this->_name)) {
            $query->where('name', 'like','%'.$this->_name.'%');
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
        return self::toBase()->get()->count();
    }
    /******************************************
     * * * End :: Custom Datatable Code * * *
    *******************************************/
    public static function accounts()
    {
        // $accounts = '<pre><ul>';
        $accounts = '';
        $accounts .= (new self)->coa('COA');
        // $accounts .= '</ul></pre>';
        return $accounts;
    }

    private function coa($parent_name,$level = 0)
    {
        $module = '';

        if($parent_name == 'COA'){
            $modules = self::where(['parent_name' => 'COA'])->orderBy('code','asc')->get(); //get module list whose parent id is 0
        }else{
            $modules = self::where(['parent_name' => $parent_name])->orderBy('code','asc')->get(); //get module list whose parent id is the given id
        }

        if(!$modules->isEmpty()){
            foreach ($modules as $value) {
                $children = self::where(['parent_name' => $value->name])->get();
                $amount = 0;
                if(count($children) > 0)
                {
                    foreach ($children as $item) {
                        $amount += $this->children($item);
                    }
                }else{
                    $balance = DB::table('transactions')
                    ->select(DB::raw("SUM(debit) - SUM(credit) as balance"))
                    ->where([['chart_of_account_id',$value->id],['approve',1]])
                    ->first();
                    $amount += !empty($balance) ? $balance->balance : 0;
                }
                if($value->level == 0 && $value->parent_name = 'COA')
                {
                    $module .= "<option value='$value->id'>$value->name";
                    $module .= $this->coa($value->name,$level+1);
                    $module .= "</option>";
                }else{
                    $module .= "<option value='".$value->id."'>".str_repeat("&#9866;", $level).' '.$value->name."";
                    $module .= $this->coa($value->name,$level+1);
                    $module .= "</option>";
                }


            }
        }
        return $module;
    }

    public function calculation($date,$id){
        $data = Transaction::where('created_at','LIKE','%'.$date.'%')->where('chart_of_account_id',$id)->get();
        $debit = 0 ; $credit = 0;
        foreach ($data as $value){
            if($value->debit == 0){
                $credit = $credit + $value->credit;
            }else{
                $debit  = $debit + $value->debit;
            }
        }
        $netBalance = $debit - $credit;
        return $netBalance;
    }

    private function children($item)
    {
        $amount = 0;

        $children = self::where(['parent_name' => $item->name])->get();
        if(count($children) > 0)
        {
            foreach ($children as $item) {
                $amount += $this->children($item);
            }
        }else{
            $transaction = DB::table('transactions as t')
            ->select(DB::raw("SUM(t.debit) - SUM(t.credit) as balance"))
            ->where([['t.chart_of_account_id',$item->id],['approve',1]])
            ->first();
            $amount += $transaction ? $transaction->balance : 0;
        }
        return $amount;
    }
}
