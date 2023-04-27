<?php

namespace Modules\Account\Entities;

use App\Models\BaseModel;
use Illuminate\Support\Facades\DB;


class DealerRecieve extends BaseModel
{
    protected const VOUCHER_PREFIX = 'DR';
    protected $fillable = ['chart_of_account_id','warehouse_id','voucher_no','voucher_type','voucher_date','description','debit','credit','created_by'];
    protected $table    = 'transactions';
    protected $order    = ['t.id' => 'desc'];
    protected $_start_date;
    protected $_end_date;
    protected $_dealer_coa_id;
    public function coa(){
        return $this->belongsTo(ChartOfAccount::class,'chart_of_account_id','id');
    }
    public function setStartDate($start_date){
        $this->_start_date = $start_date;
    }
    public function setEndDate($end_date){
        $this->_end_date = $end_date;
    }
    // public function setDealerCOAID($customer_coa_id){
    //     $this->_dealer_coa_id = $customer_coa_id;
    // }
    private function getDataTableQuery(){
        $this->column_order = ['t.id','t.voucher_date', 't.voucher_no','t.chart_of_account_id','t.description','t.credit','t.created_by',null];
        $query = DB::table('transactions as t')
            ->join('chart_of_accounts as coa','t.chart_of_account_id','=','coa.id')
            ->leftJoin('dealers as c','coa.dealer_id','=','c.id')
            ->selectRaw("t.*,coa.id as coa_id,coa.dealer_id,coa.name,c.name as customer_name")
            ->where('t.voucher_type',self::VOUCHER_PREFIX)
            ->whereNotNull('coa.dealer_id');
        if (!empty($this->_start_date)) {
            $query->where('t.voucher_date', '>=',$this->_start_date);
        }
        if (!empty($this->_end_date)) {
            $query->where('t.voucher_date', '<=',$this->_end_date);
        }
        // if (!empty($this->_dealer_coa_id)) {
        //     $query->where('t.chart_of_account_id', $this->_dealer_coa_id);
        // }
        if (isset($this->orderValue) && isset($this->dirValue)) {
            $query->orderBy($this->column_order[$this->orderValue], $this->dirValue);
        } else if (isset($this->order)) {
            $query->orderBy(key($this->order), $this->order[key($this->order)]);
        }
        return $query;
    }
    public function getDatatableList(){
        $query = $this->getDataTableQuery();
        if ($this->lengthVlaue != -1) {
            $query->offset($this->startVlaue)->limit($this->lengthVlaue);
        }
        return $query->get();
    }
    public function count_filtered(){
        $query = $this->getDataTableQuery();
        return $query->get()->count();
    }
    public function count_all(){
        $query =  DB::table('transactions as t')
            ->join('chart_of_accounts as coa','t.chart_of_account_id','=','coa.id')
            ->selectRaw("t.*,coa.id as coa_id,coa.dealer_id,coa.name")
            ->where('t.voucher_type',self::VOUCHER_PREFIX)
            ->whereNotNull('coa.dealer_id');
        return $query->count();
    }
}
