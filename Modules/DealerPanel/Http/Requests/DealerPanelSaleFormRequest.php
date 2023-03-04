<?php

namespace Modules\DealerPanel\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DealerPanelSaleFormRequest extends FormRequest{
 protected $rules;
    protected $messages;
    public function rules(){
    $this->rules['memo_no']                                   = ['required','unique:dealer_sales,memo_no'];
    if(request()->dealer_sale_id) {
        $this->rules['memo_no'][1]                            = 'unique:dealer_sales,memo_no,'.request()->dealer_sale_id;
    }
    $this->rules['sale_date']                                 = ['required','date','date_format:Y-m-d'];
    if(empty(request()->dealer_sale_id)){
        $this->rules['dealer_id']                             = ['required'];
    }
    $this->rules['order_discount']                            = ['nullable','numeric','gte:0'];
    $this->rules['shipping_cost']                             = ['nullable','numeric','gte:0'];
    $this->rules['labor_cost']                                = ['nullable','numeric','gte:0'];
    if(request()->has('products')) {
        foreach (request()->products as $key => $value) {
            $this->rules['products.'.$key.'.qty']             = ['required','numeric','gt:0','lte:'.$value['stock_qty']];
            $this->messages['products.'.$key.'.qty.required'] = 'This field is required';
            $this->messages['products.'.$key.'.qty.numeric']  = 'The value must be numeric';
            $this->messages['products.'.$key.'.qty.gt']       = 'The value must be greater than 0';
            $this->messages['products.'.$key.'.qty.lte']      = 'The value must be less than or equal to stock quantity';
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
