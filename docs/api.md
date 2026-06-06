# Inventory System API v1
Base URL: http://localhost:8000/api/v1

## Autentikasi
* **POST /register** - Mendaftarkan akun pengguna baru.
* **POST /login** - Masuk ke sistem dan mendapatkan token akses API.

## Kategori Barang
* **GET /categories** - Menarik semua daftar kategori.
* **POST /categories** - Menambahkan kategori baru.
* **GET /categories/{id}** - Melihat detail satu kategori.
* **PUT /categories/{id}** - Memperbarui nama kategori.
* **DELETE /categories/{id}** - Menghapus kategori (Khusus Admin).

## Item Barang
* **GET /items** - Menarik semua daftar item barang.
* **POST /items** - Menambahkan item barang baru.
* **GET /items/{id}** - Melihat detail satu item barang.
* **PUT /items/{id}** - Memperbarui data spesifik item.
* **DELETE /items/{id}** - Menghapus item barang (Khusus Admin). 
# Inventory System API v1
Base URL: http://localhost:8000/api/v1

## Auth
### 1. POST /register
* **Body:** `{ name, email, password, password_confirmation }`
* **Response:** 201 Created

### 2. POST /login
* **Body:** `{ email, password }`
* **Response:** 200 OK

## Categories
### 1. GET /categories
* **Header:** `Authorization: Bearer {token}`
* **Response:** 200 OK

### 2. POST /categories
* **Header:** `Authorization: Bearer {token}`
* **Body:** `{ name }`
* **Response:** 201 Created

### 3. GET /categories/{id}
* **Header:** `Authorization: Bearer {token}`
* **Response:** 200 OK

### 4. PUT /categories/{id}
* **Header:** `Authorization: Bearer {token}`
* **Body:** `{ name }`
* **Response:** 200 OK

### 5. DELETE /categories/{id} (Admin Only)
* **Header:** `Authorization: Bearer {token}`
* **Response:** 204 No Content

## Items
### 1. GET /items
* **Header:** `Authorization: Bearer {token}`
* **Response:** 200 OK

### 2. POST /items
* **Header:** `Authorization: Bearer {token}`
* **Body:** `{ name, quantity, price, category_id }`
* **Response:** 201 Created

### 3. GET /items/{id}
* **Header:** `Authorization: Bearer {token}`
* **Response:** 200 OK

### 4. PUT /items/{id}
* **Header:** `Authorization: Bearer {token}`
* **Body:** `{ name, quantity, price, category_id }`
* **Response:** 200 OK

### 5. DELETE /items/{id} (Admin Only)
* **Header:** `Authorization: Bearer {token}`
* **Response:** 204 No Content