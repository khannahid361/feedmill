<?php

namespace Modules\HRM\Http\Requests;

use App\Http\Requests\FormRequest;

class SalaryFormRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules['employee_id']                   = ['required','string','unique:employees,name'];
        $rules['basic_salary']                  = ['required'];
        $rules['employee_type']                 = ['required'];

//        if(request()->update_id)
//        {
//            $rules['name']          = 'unique:departments,name,'.request()->update_id;
//            $rules['depart_code']  = 'unique:departments,depart_code,'.request()->update_id;
//        }
        return $rules;
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
