<?php

namespace Modules\ASM\Http\Requests;

use App\Http\Requests\FormRequest;

class ASMFormRequest extends FormRequest{
    protected $rules    = [];
    protected $messages = [];
    public function rules(){
        $this->rules['name']                  = ['required', 'string'];
        $this->rules['username']              = ['required', 'string', 'max:30','unique:a_s_ms,username'];
        $this->rules['phone']                 = ['required', 'string', 'max:15', 'unique:a_s_ms,phone'];
        $this->rules['additional_phone']      = ['nullable', 'string', 'max:15', 'unique:a_s_ms,additional_phone'];
        $this->rules['email']                 = ['nullable', 'string', 'email', 'unique:a_s_ms,email'];
        $this->rules['salary']                = ['required'];
        $this->rules['password']              = ['required', 'string', 'min:8', 'confirmed'];
        $this->rules['password_confirmation'] = ['required', 'string', 'min:8'];
        $this->rules['avatar']                = ['nullable','image', 'mimes:png,jpg,jpeg,svg'];
        $this->rules['warehouse_id']          = ['required'];
        $this->rules['district_name']         = ['required'];
        $this->rules['district_id']           = ['required'];
        $this->rules['upazila_id']            = ['required'];
        if(request()->update_id){
            $this->rules['username'][3]              = 'unique:a_s_ms,username,'.request()->update_id;
            $this->rules['phone'][3]                 = 'unique:a_s_ms,phone,'.request()->update_id;
            $this->rules['additional_phone'][3]      = 'unique:a_s_ms,additional_phone,'.request()->update_id;
            $this->rules['email'][3]                 = 'unique:a_s_ms,email,'.request()->update_id;
            $this->rules['password'][0]              = 'nullable';
            $this->rules['password_confirmation'][0] = 'nullable';
        }
        if(request()->has('areas')) {
            foreach (request()->areas as $key => $value) {
                $this->rules   ['areas.'.$key.'.id']          = ['required'];
                $this->messages['areas.'.$key.'.id.required'] = 'This field is required';
            }
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
