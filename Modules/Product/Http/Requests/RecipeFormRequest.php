<?php

namespace Modules\Product\Http\Requests;

use App\Http\Requests\FormRequest;

class RecipeFormRequest extends FormRequest
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
        $this->rules['recipe_name']              = ['required', 'string', 'unique:recipes,recipe_name'];
        $this->rules['recipe_code']              = ['required', 'string', 'unique:recipes,recipe_code'];
        $this->rules['product_id']       = ['required', 'numeric'];
        $this->rules['recipe_date'] = ['required', 'date'];

        if (request()->update_id) {
            $this->rules['recipe_name'][2] = 'unique:recipes,recipe_name,' . request()->update_id;
            $this->rules['recipe_code'][2] = ['required', 'string', 'unique:recipes,recipe_code,' . request()->update_id];
        }

        $collection = collect(request());
        if ($collection->has('materials')) {
            foreach (request()->materials as $key => $value) {
                $this->rules['materials.' . $key . '.id']           = ['required', 'integer'];

                $this->messages['materials.' . $key . '.id.required']  = 'The material name field is required';
                $this->messages['materials.' . $key . '.id.integer']   = 'The material name field value must be integer';
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
