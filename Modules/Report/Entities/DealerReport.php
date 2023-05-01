<?php

namespace Modules\Report\Entities;

use App\Models\BaseModel;
use Illuminate\Support\Facades\DB;

class DealerReport extends BaseModel
{
    protected $order = ['d.id' => 'asc'];
    public function coa()
    {
        return $this->belongsTo(ChartOfAccount::class, 'chart_of_account_id', 'id');
    }
    public function dealer()
    {
        return $this->hasOneThrough(Dealer::class, ChartOfAccount::class, 'dealer_id', 'chart_of_account_id', 'id', 'id');
    }
    //custom search column property
    protected $_dealer_id;
    protected $_start_date;
    protected $_end_date;

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
        $this->column_order = ['d.id'];
        $query = DB::table('dealers as d')
            ->leftjoin('chart_of_accounts as coa', 'd.id', '=', 'coa.dealer_id')
            ->leftjoin('transactions as t', 'coa.id', '=', 't.chart_of_account_id')->where('t.approve', 1)->select('d.*',DB::raw("SUM(t.debit) as delaerDebit"),DB::raw("SUM(t.credit) as delaerCredit"))->groupBy('d.id');
        // dd($query);

        if (!empty($this->_dealer_id)) {
            $query->where('d.id', $this->_dealer_id);
        }
        if (!empty($this->_start_date)) {
            $query->where('t.voucher_date', '>=', $this->_start_date);
        }
        if (!empty($this->_end_date)) {
            $query->where('t.voucher_date', '<=', $this->_end_date);
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
        $query = DB::table('dealers as d')
        ->leftjoin('chart_of_accounts as coa', 'd.id', '=', 'coa.dealer_id')
        ->leftjoin('transactions as t', 'coa.id', '=', 't.chart_of_account_id')->where('t.approve', 1)->select('d.*')
            ->where('t.approve', 1)->groupBy('d.id');
        if (auth()->user()->warehouse_id) {
            $query->where('t.warehouse_id',  auth()->user()->warehouse_id);
        }
        return $query->get()->count();
    }
}
