<?php

namespace Modules\SalesMen\Http\Requests;

use App\Http\Requests\FormRequest;

class SalesMenFormRequest extends FormRequest
{
    protected $rules = [];
    protected $messages = [];
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $this->rules['name']                  = ['required', 'string'];
        $this->rules['username']              = ['required', 'string', 'max:30','unique:salesmen,username'];
        $this->rules['phone']                 = ['required', 'string', 'max:15', 'unique:salesmen,phone'];
        $this->rules['additional_phone']      = ['nullable', 'string', 'max:15', 'unique:salesmen,additional_phone'];
        $this->rules['email']                 = ['nullable', 'string', 'email', 'unique:salesmen,email'];
        $this->rules['salary']                = ['required'];
        $this->rules['password']              = ['required', 'string', 'min:8', 'confirmed'];
        $this->rules['password_confirmation'] = ['required', 'string', 'min:8'];
        $this->rules['avatar']                = ['nullable','image', 'mimes:png,jpg,jpeg,svg'];
        $this->rules['warehouse_id']          = ['required'];
        $this->rules['asm_id']                = ['required'];
        $this->rules['district_name']         = ['required'];
        $this->rules['district_id']           = ['required'];
        $this->rules['upazila_id']            = ['required'];

        if(request()->update_id){
            $this->rules['username'][3]              = 'unique:salesmen,username,'.request()->update_id;
            $this->rules['phone'][3]                 = 'unique:salesmen,phone,'.request()->update_id;
            $this->rules['additional_phone'][3]      = 'unique:salesmen,additional_phone,'.request()->update_id;
            $this->rules['email'][3]                 = 'unique:salesmen,email,'.request()->update_id;
            $this->rules['password'][0]              = 'nullable';
            $this->rules['password_confirmation'][0] = 'nullable';
        }

        if(request()->has('areas'))
        {
            foreach (request()->areas as $key => $value) {
                $this->rules   ['areas.'.$key.'.id']          = ['required'];
                $this->messages['areas.'.$key.'.id.required'] = 'This field is required';
            }
        }

        return $this->rules;
    }

    public function messages()
    {
        return $this->messages;
    }

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }
}
