<?php

namespace Modules\SalesMen\Entities;

use App\Models\BaseModel;

class SalesmenProductTarget extends BaseModel{
    protected $fillable = [ 'ptcode','salesmen_id','product_commission_id','achieved_value','pcs','start_date','end_date','created_by'  ];
    protected $table = 'salesmen_product_targets';
    protected $_salesmen_id;
    public function setSalesMen($salesmen_id){
        $this->_salesmen_id = $salesmen_id;
    }
    public function salesMen(){
        return $this->belongsTo(Salesmen::class,'salesmen_id','id');
    }
    public function commission(){
        return $this->belongsTo(SalesmenProductCommission::class,'product_commission_id','id');
    }
    private function getDataTableQuery(){
        $this->column_order = ['id','salesmen_id','product_commission_id','achieved_value','start_date','end_date','created_by',null];
        $query = self::toBase();
        if (!empty($this->_salesmen_id)) {
            $query->where('salesmen_id', $this->_salesmen_id );
        }
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
        return self::toBase()->get()->count();
    }
}
