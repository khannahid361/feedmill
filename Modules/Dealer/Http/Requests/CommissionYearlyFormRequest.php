<?php

namespace Modules\Dealer\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CommissionYearlyFormRequest extends FormRequest
{
    protected $rules = [];
    protected $messages = [];
    public function rules()
    {
        $this->rules['from_date']                  = ['required', 'string'];
        $this->rules['to_date']                    = ['required', 'string'];
        $collection = collect(request());
        if ($collection->has('commission')) {
            foreach (request()->commission as $key => $value) {
                $this->rules['commission.' . $key . '.dealer_id']              = ['required', 'integer'];
                $this->messages['commission.' . $key . '.dealer_id']           = 'This Field is required';
                $this->rules['commission.' . $key . '.qty']                    = ['required', 'integer'];
                $this->messages['commission.' . $key . '.qty']                 = 'This Field is required';
                $this->rules['commission.' . $key . '.commission_amount']      = ['required', 'integer'];
                $this->messages['commission.' . $key . '.commission_amount']   = 'This Field is required';
            }
        }
        return $this->rules;
    }

    public function messages()
    {
        return $this->messages;
    }


    public function authorize()
    {
        return true;
    }
}
