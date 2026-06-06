import 'package:flutter/material.dart';

class Soal1 extends StatefulWidget {
  const Soal1({super.key});
  @override
  State<Soal1> createState() => _Soal1State();
}

class _Soal1State extends State<Soal1> {
    final _formkey = GlobalKey<FormState>();
    final _controller = TextEditingController();

    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    void _cekNama() {
        if (_formkey.currentState!.validate()) {
            print('Nama Produk: ${_controller.text}');
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('Soal 1 - Nama Produk')),
            body: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                    key: _formkey,
                    child: Column(
                        children: [
                        TextFormField(
                            controller: _controller,
                            decoration: const InputDecoration(labelText: 'Nama Produk'),
                            validator: (value) {
                                if (value == null || value.isEmpty) {
                                    return 'Field tidak boleh kosong';
                                }
                                if (value.length < 5 || value.length > 30) {
                                    return 'Nama produk harus antara 5-30 karakter';
                                }
                                if (!RegExp(r'\d').hasMatch(value)) {
                                    return 'Harus mengandung setidaknya satu angka';
                                }
                                if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                    return 'Harus mengandung setidaknya satu huruf kapital';
                                }
                                return null;
                            },
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                            onPressed: _cekNama,
                            child: const Text('Cek Nama')
                        ),
                        ],
                    ),
                ),
            ),
        );
    }
} 