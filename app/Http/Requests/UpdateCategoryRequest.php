<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateCategoryRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    protected function prepareForValidation()
    {
        $input = $this->all();

        array_walk($input, function (&$val) {
            if (is_string($val)) {
                $val = trim(strip_tags($val));
            }
        });

        $this->merge($input);
    }

    public function rules(): array
    {
        // Mengabaikan id kategori saat ini agar validasi unique tidak error ketika update data yang sama
        $categoryId = $this->route('category');

        return [
            "name" => "required|string|max:255|unique:categories,name," . $categoryId,
        ];
    }
}