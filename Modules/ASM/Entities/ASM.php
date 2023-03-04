<?php

namespace Modules\ASM\Entities;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Modules\Account\Entities\ChartOfAccount;
use Modules\Account\Entities\Transaction;
use Modules\Location\Entities\Area;
use Modules\Location\Entities\District;
use Modules\Location\Entities\Upazila;
use Modules\Setting\Entities\Warehouse;
use Tymon\JWTAuth\Contracts\JWTSubject;

class ASM extends Authenticatable implements JWTSubject {
    protected $fillable = ['warehouse_id','district_id','upazila_id','avatar','name','username','email','phone','password','salary','status','created_by','modified_by'];
    protected $table    = 'a_s_ms';
    protected $order    = ['id' => 'desc'];
    protected $column_order;
    protected $orderValue;
    protected $dirValue;
    protected $startValue;
    protected $lengthValue;
    protected $_name;
    protected $_phone;
    protected $_warehouse_id;
    protected $_district_id;
    protected $_upazila_id;
    protected $hidden = [
        'password',
        'remember_token',
    ];
    public function coa(){
        return $this->hasOne(ChartOfAccount::class,'asm_id','id');
    }
    public function previous_balance(){
        return $this->hasOneThrough(Transaction::class,ChartOfAccount::class,'asm_id','chart_of_account_id','id','id')
            ->where('voucher_type','PR Balance')->withDefault(['debit' => '']);
    }
    public function warehouse(){
        return $this->belongsTo(Warehouse::class,'warehouse_id','id');
    }
    public function district(){
        return $this->belongsTo(District::class,'district_id','id');
    }
    public function upazila(){
        return $this->belongsTo(Upazila::class,'upazila_id','id');
    }
    public function areas(){
        return $this->belongsToMany(Area::class,'a_s_m_areas','asm_id','area_id','id','id')
            ->withPivot('id')
            ->withTimestamps();
    }
    public function areasList(){
        return $this->hasMany(ASMArea::class,'asm_id','id');
    }
    public function asm_balance(int $id){
        $data   = DB::table('a_s_ms as asm')
                ->selectRaw('asm.id,b.id as coaid,b.code,((select ifnull(sum(debit),0) from transactions where chart_of_account_id= b.id AND approve = 1)-(select ifnull(sum(credit),0) from transactions where chart_of_account_id= b.id AND approve = 1)) as balance')
                ->leftjoin('chart_of_accounts as b', 'asm.id', '=', 'b.asm_id')
                ->where('asm.id',$id)->first();
        $balance = 0;
        if($data) {
            $balance = $data->balance ? $data->balance : 0;
        }
        return $balance;
    }
    public function getJWTIdentifier(){
        return $this->getKey();
    }
    public function getJWTCustomClaims(){
        return [];
    }
    public function setPasswordAttribute($value){
        $this->attributes['password'] = Hash::make($value);
    }
    public function setOrderValue($orderValue)
    {
        $this->orderValue = $orderValue;
    }
    public function setDirValue($dirValue)
    {
        $this->dirValue = $dirValue;
    }
    public function setStartValue($startValue)
    {
        $this->startValue = $startValue;
    }
    public function setLengthValue($lengthValue)
    {
        $this->lengthValue = $lengthValue;
    }
    public function setName($name){
        $this->_name = $name;
    }
    public function setPhone($phone){
        $this->_phone = $phone;
    }
    public function setWarehouseID($warehouse_id){
        $this->_warehouse_id = $warehouse_id;
    }
    public function setDistrictID($district_id){
        $this->_district_id = $district_id;
    }
    public function setUpazilaID($upazila_id){
        $this->_upazila_id = $upazila_id;
    }
    public function getDatatableQuery(){
        $this->column_order = ['id','id','name','username','warehouse_id','district_id','upazila_id','status',null];
        $query = self::with('warehouse','district','upazila');
        if (!empty($this->name)) {
            $query->where('name', 'like', '%' . $this->name . '%');
        }
        if (!empty($this->phone)) {
            $query->where('phone', 'like', '%' . $this->phone . '%');
        }
        if (!empty($this->_warehouse_id)) {
            $query->where('warehouse_id', $this->_warehouse_id );
        }
        if (!empty($this->_district_id)) {
            $query->where('district_id', $this->_district_id );
        }
        if (!empty($this->_upazila_id)) {
            $query->where('upazila_id', $this->_upazila_id );
        }
        if (isset($this->orderValue) && isset($this->dirValue)) {
            $query->orderBy($this->column_order[$this->orderValue], $this->dirValue);
        } else if (isset($this->order)) {
            $query->orderBy(key($this->order), $this->order[key($this->order)]);
        }
        return $query;
    }
    public function getDatatableList(){
        $query = $this->getDatatableQuery();
        if ($this->lengthValue != -1) {
            $query->offset($this->startValue)->limit($this->lengthValue);
        }
        return $query->get();
    }
    public function count_filtered(){
        $query = $this->getDatatableQuery();
        return $query->get()->count();
    }
    public function count_all(){
        return self::toBase()->get()->count();
    }
}
