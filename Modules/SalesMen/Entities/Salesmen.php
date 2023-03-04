<?php
namespace Modules\SalesMen\Entities;

use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Modules\ASM\Entities\ASM;
use Modules\Location\Entities\Upazila;
use Modules\Location\Entities\District;
use Modules\Salary\Entities\Salary;
use Modules\Setting\Entities\Warehouse;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Modules\Account\Entities\Transaction;
use Modules\Account\Entities\ChartOfAccount;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Modules\Location\Entities\Area;

class Salesmen extends Authenticatable implements JWTSubject{
    protected $fillable = [ 'name', 'username', 'phone','additional_phone','email', 'avatar', 'password','salary', 'warehouse_id','asm_id', 'district_id', 'upazila_id','status', 'created_by', 'modified_by'];
    protected $table    = 'salesmen';
    protected $hidden   = [ 'password','remember_token' ];
    public function coa(){
        return $this->hasOne(ChartOfAccount::class,'salesmen_id','id');
    }
    public function previous_balance(){
        return $this->hasOneThrough(Transaction::class,ChartOfAccount::class,'salesmen_id','chart_of_account_id','id','id')
        ->where('voucher_type','PR Balance')->withDefault(['debit' => '']);
    }
    public function asm(){
        return $this->belongsTo(ASM::class,'asm_id','id');
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
        return $this->belongsToMany(Area::class,'salesmen_areas','salesmen_id','area_id','id','id')
        ->withPivot('id')
        ->withTimestamps();
    }
    public function areasList(){
        return $this->hasMany(SalesmenArea::class,'salesmen_id','id');
    }
    public function salesmen_balance(int $id){
        $data = DB::table('salesmen as s')
                ->selectRaw('s.id,b.id as coaid,b.code,((select ifnull(sum(debit),0) from transactions where chart_of_account_id= b.id AND approve = 1)-(select ifnull(sum(credit),0) from transactions where chart_of_account_id= b.id AND approve = 1)) as balance')
                ->leftjoin('chart_of_accounts as b', 's.id', '=', 'b.salesmen_id')
                ->where('s.id',$id)->first();
        $balance = 0;
        if($data) {
            $balance = $data->balance ? $data->balance : 0;
        }
        return $balance;
    }
    public function salary(){
        return $this->morphMany(Salary::class,'salarytable');
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
    protected $order = ['id' => 'desc'];
    protected $column_order;
    protected $orderValue;
    protected $dirValue;
    protected $startVlaue;
    protected $lengthVlaue;
    public function setOrderValue($orderValue){
        $this->orderValue = $orderValue;
    }
    public function setDirValue($dirValue){
        $this->dirValue = $dirValue;
    }
    public function setStartValue($startVlaue){
        $this->startVlaue = $startVlaue;
    }
    public function setLengthValue($lengthVlaue){
        $this->lengthVlaue = $lengthVlaue;
    }
    protected $_name;
    protected $_phone;
    protected $_warehouse_id;
    protected $_asm_id;
    protected $_district_id;
    protected $_upazila_id;
    protected $_status;
    public function setName($name){
        $this->_name = $name;
    }
    public function setPhone($phone){
        $this->_phone = $phone;
    }
    public function setASMID($asm_id){
        $this->_asm_id = $asm_id;
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
    public function setStatus($status){
        $this->_status = $status;
    }
    private function get_datatable_query(){
        if (permission('sr-bulk-delete')){
            $this->column_order = [null,'id','id','name','username','warehouse_id','asm_id','district_id','upazila_id','status',null];
        }else{
            $this->column_order = ['id','id','name','username','warehouse_id','asm_id','district_id','upazila_id','status',null];
        }
        $query = self::with('district','upazila','warehouse','asm');
        if(auth()->user()->warehouse_id) {
            $query->where('warehouse_id',  auth()->user()->warehouse_id);
        }
        if (!empty($this->name)) {
            $query->where('name', 'like', '%' . $this->name . '%');
        }
        if (!empty($this->phone)) {
            $query->where('phone', 'like', '%' . $this->phone . '%');
        }
        if (!empty($this->_warehouse_id)) {
            $query->where('warehouse_id', $this->_warehouse_id );
        }
        if (!empty($this->_asm_id)) {
            $query->where('asm_id', $this->_asm_id );
        }
        if (!empty($this->_district_id)) {
            $query->where('district_id', $this->_district_id );
        }
        if (!empty($this->_upazila_id)) {
            $query->where('upazila_id', $this->_upazila_id );
        }
        if (!empty($this->status)) {
            $query->where('status', $this->status );
        }
        if (isset($this->orderValue) && isset($this->dirValue)) {
            $query->orderBy($this->column_order[$this->orderValue], $this->dirValue);
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
}
