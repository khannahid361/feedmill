<?php

namespace Modules\Dealer\Entities;

use App\Models\BaseModel;

class YearlyTarget extends BaseModel
{
    protected $table = 'yearly_target';
    protected $fillable = ['dealer_id', 'qty', 'commission_amount', 'year', 'month', 'status', 'created_by', 'modified_by', 'paid_amount', 'due_amount', 'is_paid', 'acheived_qty','is_generated'];

    protected $column_order;
    protected $orderValue;
    protected $dirValue;
    protected $startVlaue;
    protected $lengthVlaue;

    public function setOrderValue($orderValue)
    {
        $this->orderValue = $orderValue;
    }
    public function setDirValue($dirValue)
    {
        $this->dirValue = $dirValue;
    }
    public function setStartValue($startVlaue)
    {
        $this->startVlaue = $startVlaue;
    }
    public function setLengthValue($lengthVlaue)
    {
        $this->lengthVlaue = $lengthVlaue;
    }


    public function dealer()
    {
        return $this->belongsTo(Dealer::class, 'dealer_id', 'id');
    }
    protected $order = ['id' => 'desc'];

    protected $_dealer_id;
    protected $_year;

    public function setDealer($dealer_id)
    {
        $this->_dealer_id = $dealer_id;
    }

    public function year($year)
    {
        return $this->_year = $year;
    }

    private function get_datatable_query()
    {

        $this->column_order = ['dealer_id', 'qty', 'commission_amount', 'year', 'status', 'created_by', 'modified_by', 'paid_amount', 'due_amount', 'is_paid', 'acheived_qty', null, null];

        $query = self::with('dealer:id,name');

        //search query
        if (!empty($this->_dealer_id)) {
            $query->where('dealer_id', $this->_dealer_id);
        }

        if (!empty($this->_year)) {
            $query->where('year', $this->_year);
        }

        //order by data fetching code
        if (isset($this->order)) {
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
        return $query->get()->count();
    }
}
