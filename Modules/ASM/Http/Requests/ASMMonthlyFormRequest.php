<?php

namespace Modules\ASM\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ASMMonthlyFormRequest extends FormRequest{
    protected $rules     = [];
    protected $messages  = [];
    public function rules(){
        if(request()->type == 'store'){
            $this->rules['month']        = ['required', 'numeric'];
            $this->rules['warehouse_id'] = ['required'];
            if(request()->has('asm')) {
                foreach (request()->asm as $key => $value) {
                    $this->rules ['asm.'.$key.'.id']                         = ['required'];
                    $this->rules ['asm.'.$key.'.target_value']               = ['required','numeric','gt:0'];
                    $this->messages['asm.'.$key.'.id.required']              = 'This field is required';
                    $this->messages['asm.'.$key.'.target_value.required']    = 'This field is required';
                    $this->messages['asm.'.$key.'.target_value.numeric']     = 'The value must be numeric';
                    $this->messages['asm.'.$key.'.target_value.gt']          = 'The value must be greater than 0';
                }
            }
        }else{
            $this->rules['target_value']    = ['required','numeric','gt:0'];
        }
        return $this->rules;
    }
    public function messages(){
        return $this->messages;
    }
    public function authorize(){
        return true;
    }
}
