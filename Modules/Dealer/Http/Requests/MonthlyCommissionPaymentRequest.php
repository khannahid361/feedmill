<?php

namespace Modules\Dealer\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class MonthlyCommissionPaymentRequest extends FormRequest
{
    public function rules()
    {
        return [
            'voucher_no'   => 'required',
            'voucher_date' => 'required',
            'dealer_id'  => 'required',
            'payment_type' => 'required',
            'account_id'   => 'required',
            'amount'       => 'required|numeric|gt:0',
        ];
    }

    public function messages()
    {
        return [
            'dealer_id.required'        => 'The dealer field is required',
            'account_id.required' => 'The account field is required'
        ];
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
