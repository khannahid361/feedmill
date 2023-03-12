<?php

namespace Modules\HRM\Http\Requests;

use App\Http\Requests\FormRequest;

class DeductionFormRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules['employee_id']          = ['required'];
        $rules['deduction_name']       = ['required'];
        $rules['deduction_month']      = ['required'];
        $rules['deduction_amount']     = ['required'];
        $rules['deduction_description']= ['required'];
        $rules['status']               = ['required'];
        if(request()->update_id)
        {
            $rules['employee_id']          = ['required'];
            $rules['deduction_name']       = ['required'];
            $rules['deduction_month']      = ['required'];
            $rules['deduction_amount']     = ['required'];
            $rules['deduction_description']= ['required'];
            $rules['status']               = ['required'];
        }
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
