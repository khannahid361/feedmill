<?php

namespace Modules\ASM\Entities;

use App\Models\BaseModel;
use Modules\Location\Entities\Area;

class ASMArea extends BaseModel {
    protected $fillable = ['asm_id','area_id'];
    protected $table    = 'a_s_m_areas';
    public function asm(){
        return $this->belongsTo(ASM::class);
    }
    public function area(){
        return $this->belongsTo(Area::class);
    }
}
