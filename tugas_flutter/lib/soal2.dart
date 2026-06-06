import 'package:flutter/material.dart';

class Soal2 extends StatefulWidget {
    const Soal2({super.key});
    @override
    State<Soal2> createState() => _Soal2State();
}

class _Soal2State extends State<Soal2> {
    final _formKey = GlobalKey<FormState>();
    final _emailCtrl = TextEditingController();
    final _passCtrl = TextEditingController();
    final _confirmCtrl = TextEditingController();
    bool _sukses = false;

    @override
    void dispose() {
        _emailCtrl.dispose();
        _passCtrl.dispose();
        _confirmCtrl.dispose();
        super.dispose();
    }

    void _daftar() {
        setState(() => _sukses = false);
        if (_formKey.currentState!.validate()) {
            setState(() => _sukses = true);
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('Soal 2 - Pendaftaran')),
            body: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                    key: _formKey,
                    child: Column(
                        children: [
                            TextFormField(
                                controller: _emailCtrl,
                                decoration: const InputDecoration(labelText: 'Email'),
                                validator: (val) {
                                    if (val == null || val.isEmpty) return 'Email wajib diisi';
                                    if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+$')
                                    .hasMatch(val)) {
                                        return 'Format email tidak valid';
                                    }
                                    return null;
                                },
                            ),
                            TextFormField(
                                controller: _passCtrl,
                                obscureText: true,
                                decoration: const InputDecoration(labelText: 'Kata Sandi'),
                                validator: (val) {
                                    if (val == null || val.isEmpty) return 'Kata sandi wajib diisi';
                                    if (val.length < 8) return 'Minimal 8 karakter';
                                    if (!RegExp(r'(?=.*[A-Z])(?=.*[a-z])(?=.*\d)')
                                            .hasMatch(val)) {
                                        return 'Kata sandi harus mengandung huruf besar, huruf kecil, dan angka';
                                    }
                                    return null;
                                },
                            ),
                            TextFormField(
                                controller: _confirmCtrl,
                                obscureText: true,
                                decoration:
                                        const InputDecoration(labelText: 'Konfirmasi Kata Sandi'),
                                validator: (val) {
                                    if (val == null || val.isEmpty) return 'Konfirmasi wajib diisi';
                                    if (val != _passCtrl.text) return 'Kata sandi tidak cocok';
                                    return null;
                                },
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                                onPressed: _daftar,
                                child: const Text('Daftar')
                            ),
                            if (_sukses)
                                const Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                        'Pendaftaran berhasil!',
                                        style: TextStyle(color: Colors.green),
                                    ),
                                ),
                        ],
                    ),
                ),
            ),
        );
    }
}