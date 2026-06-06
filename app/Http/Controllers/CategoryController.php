<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreCategoryRequest;
use App\Http\Requests\UpdateCategoryRequest;
use App\Services\CategoryService;
use App\Http\Controllers\Api\BaseController;

class CategoryController extends BaseController
{
    protected CategoryService $svc;

    public function __construct(CategoryService $svc)
    {
        $this->svc = $svc;
    }

    public function index()
    {
        return $this->success($this->svc->all());
    }

    public function store(StoreCategoryRequest $req)
    {
        $category = $this->svc->create($req->validated());
        return $this->success($category, "Kategori dibuat", 201);
    }

    public function show($id)
    {
        try {
            $category = $this->svc->find($id);
            return $this->success($category);
        } catch (\Exception $e) {
            return $this->error($e->getMessage(), 404);
        }
    }

    public function update(UpdateCategoryRequest $req, $id)
    {
        $category = $this->svc->update($id, $req->validated());
        return $this->success($category, "Kategori diperbarui");
    }

    public function destroy($id)
    {
        $this->svc->delete($id);
        return $this->success(null, "Kategori dihapus", 204);
    }
}