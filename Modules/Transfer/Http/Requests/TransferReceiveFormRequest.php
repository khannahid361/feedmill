<?php

namespace Modules\Transfer\Http\Requests;

use App\Http\Requests\FormRequest;


class TransferReceiveFormRequest extends FormRequest
{
    protected $rules;
    protected $messages;

    public function rules()
    {


        $this->rules['from_warehouse_id']     = ['required'];
        if(request()->has('products'))
        {
            foreach (request()->products as $key => $value) {
                $this->rules   ['products.'.$key.'.receive_qty']          = ['required','numeric','gte:0','lte:'.$value['transfer_qty']];
                $this->messages['products.'.$key.'.receive_qty.required'] = 'This field is required';
                $this->messages['products.'.$key.'.receive_qty.numeric']  = 'The value must be numeric';
                $this->messages['products.'.$key.'.receive_qty.gt']       = 'The value must be greater than 0';

                $this->rules['products.'.$key.'.product_condition']     = ['required','numeric'];
                $this->rules['products.'.$key.'.material_id'] = ['nullable','numeric'];
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
