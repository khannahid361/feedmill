<?php

namespace Modules\Dealer\Entities;

use App\Models\BaseModel;
use Illuminate\Support\Facades\DB;
use Modules\Dealer\Entities\Dealer;
use Modules\Account\Entities\ChartOfAccount;


class DealerLedger extends BaseModel{
    protected $fillable = ['chart_of_account_id', 'warehouse_id', 'voucher_no', 'voucher_type', 'voucher_date',
    'description', 'debit', 'credit', 'is_opening', 'posted', 'approve', 'created_by', 'modified_by'];
    protected $table = 'transactions';
    protected $order = ['t.voucher_date' => 'asc'];
    public function coa() {
        return $this->belongsTo(ChartOfAccount::class,'chart_of_account_id','id');
    }
    public function dealer(){
        return $this->hasOneThrough(Dealer::class,ChartOfAccount::class,'dealer_id','chart_of_account_id','id','id');
    }
    //custom search column property
    protected $_dealer_id;
    protected $_start_date;
    protected $_end_date;

    //methods to set custom search property value
    public function setDealerID($dealer_id)
    {
        $this->_dealer_id = $dealer_id;
    }
    public function setStartDate($start_date)
    {
        $this->_start_date = $start_date;
    }
    public function setEndDate($end_date)
    {
        $this->_end_date = $end_date;
    }

    private function get_datatable_query()
    {
        $this->column_order = ['t.voucher_date','t.description', 't.voucher_no','t.debit','t.credit',null];
        $this->column_order = ['d.id'];
        $query = DB::table('dealers as d')
                 ->join('chart_of_accounts as coa','d.id','=','coa.dealer_id')
                 ->join('transactions as t','coa.id','=','t.chart_of_account_id')->whereNotIn('coa.parent_name', ['Commission Yearly Payable','Commission Monthly Payable'])->where('t.approve',1)->select('t.*','coa.id as coa_id','coa.code','coa.name','coa.parent_name','d.id as dealer_id','d.shop_name','d.name','d.mobile');

        // if(auth()->user()->warehouse_id)
        // {
        //     $query->where('transactions.warehouse_id',  auth()->user()->warehouse_id);
        // }
        // search query
        if (!empty($this->_dealer_id)) {
            $query->where('d.id', $this->_dealer_id);
        }
        if (!empty($this->_start_date)) {
            $query->where('t.voucher_date', '>=',$this->_start_date);
        }
        if (!empty($this->_end_date)) {
            $query->where('t.voucher_date', '<=',$this->_end_date);
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
        $query = self::select('transactions.*','coa.id as coa_id','coa.code','coa.name','coa.parent_name','c.id as dealer_id','c.shop_name','c.name','c.mobile')
        ->join('chart_of_accounts as coa','transactions.chart_of_account_id','=','coa.id')
        ->join('dealers as c','coa.dealer_id','c.id')
        ->whereNotIn('coa.parent_name', ['Commission Yearly Payable','Commission Monthly Payable'])
        ->where('transactions.approve',1);
        if(auth()->user()->warehouse_id)
        {
            $query->where('transactions.warehouse_id',  auth()->user()->warehouse_id);
        }
        return $query->get()->count();
    }
    /******************************************
     * * * End :: Custom Datatable Code * * *
    *******************************************/
}
