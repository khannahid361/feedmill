<?php

namespace Modules\Setting\Http\Requests;

use App\Http\Requests\FormRequest;

class WarehouseFormRequest extends FormRequest{
    public function authorize(){
        return true;
    }
    public function rules(){
        $rules['name']              = ['required','string','unique:warehouses,name'];
        $rules['store_manager']     = ['nullable','string'];
        $rules['phone']             = ['nullable','string'];
        $rules['email']             = ['nullable','email','string'];
        $rules['address']           = ['nullable','string'];
        $rules['district_id']       = ['required'];
        $rules['deletable']         = ['required','integer'];
        if(request()->update_id) {
            $rules['name'] = 'unique:warehouses,name,'.request()->update_id;
        }
        return $rules;
    }
    public function messages(){
        return [
            'district_id.required' => 'The district name is required',
            'asm_id.required' => 'The district name is required',
        ];
    }
}
