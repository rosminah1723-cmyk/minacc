<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreItemRequest extends FormRequest
{
    /**
     * Tentukan apakah pengguna diizinkan untuk membuat request ini.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Mempersiapkan data sebelum divalidasi (Sanitasi Input)
     */
    protected function prepareForValidation()
    {
        $input = $this->all();

        // Melakukan sanitasi trim dan strip_tags untuk semua input string
        array_walk($input, function (&$val) {
            if (is_string($val)) {
                $val = trim(strip_tags($val));
            }
        });

        $this->merge($input);
    }

    /**
     * Aturan validasi yang berlaku untuk request ini.
     */
    public function rules(): array
    {
        return [
            "name"        => "required|string|max:255",
            "quantity"    => "required|integer|min:0",
            "price"       => "required|numeric|min:0",
            "category_id" => "required|exists:categories,id",
        ];
    }

    /**
     * Pesan kustom untuk kesalahan validasi.
     */
    public function messages(): array
    {
        return [
            "name.required" => "Nama item wajib diisi.",
        ];
    }
}