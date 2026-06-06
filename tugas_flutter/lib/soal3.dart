import 'package:flutter/material.dart';

class Soal3 extends StatefulWidget {
    const Soal3({super.key});
    @override
    State<Soal3> createState() => _Soal3State();
}

class _Soal3State extends State<Soal3> {
    final _formKey = GlobalKey<FormState>();
    final _phoneCtrl = TextEditingController();

    @override
    void dispose() {
        _phoneCtrl.dispose();
        super.dispose();
    }

    void _simpan() {
        if (_formKey.currentState!.validate()) {
            print('Nomor: ${_phoneCtrl.text}');
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('Soal 3 - Nomor Telepon')),
            body: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                    key: _formKey,
                    child: Column(
                        children: [
                            TextFormField(
                                controller: _phoneCtrl,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(labelText: 'Nomor Telepon'),
                                validator: (val) {
                                    if (val == null || val.isEmpty) {
                                        return 'Nomor wajib diisi';
                                    }
                                    if (!RegExp(r'^\+(?:62|1)\d{8,13}$').hasMatch(val)) {
                                        return 'Format nomor tidak valid';
                                    }
                                    return null;
                                },
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                                onPressed: _simpan,
                                child: const Text('Simpan')
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}