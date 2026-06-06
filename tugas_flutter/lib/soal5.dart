import 'package:flutter/material.dart';

class Soal5 extends StatefulWidget {
    const Soal5({super.key});
    @override
    State<Soal5> createState() => _Soal5State();
}

class _Soal5State extends State<Soal5> {
  final _formKey = GlobalKey<FormState>();
  final _jalanCtrl = TextEditingController();
  final _posCtrl = TextEditingController();
  final _kotaCtrl = TextEditingController();
  String? _globalError;

  @override
  void dispose() {
    _jalanCtrl.dispose();
    _posCtrl.dispose();
    _kotaCtrl.dispose();
    super.dispose();
  }

  void _kirim() {
    setState(() => _globalError = null);
    if (_formKey.currentState!.validate()) {
      final gabungan =
           '${_jalanCtrl.text} ${_posCtrl.text} ${_kotaCtrl.text}';
      if (gabungan.length >= 200) {
        setState(() {
          _globalError = 'Alamat terlalu panjang, ringkas!';
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Alamat terlalu panjang, ringkas!')),
          );
          return;
      }
      print({
        'jalan': _jalanCtrl.text,
        'pos': _posCtrl.text,
        'kota': _kotaCtrl.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Soal 5 -  Formulir Alamat')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _jalanCtrl,
                decoration: const InputDecoration(labelText: 'Alamat Jalan'),
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Alamat wajib diisi';
                  if (val.length < 10) return 'Minimal 10 karakter';
                  if (!RegExp(r'^(Jl.\Jalan)\s').hasMatch(val)) {
                    return "Alamat harus diawali dengan 'Jl.' atau 'Jalan'";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _posCtrl,
                decoration: const InputDecoration(labelText: 'Kode Pos'),
                keyboardType: TextInputType.number,
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Kode pos wajib diisi';
                  if (!RegExp(r'^\d{5}$').hasMatch(val)) {
                    return 'KodePos harus 5 digit angka';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _kotaCtrl,
                decoration: const InputDecoration(labelText: 'Kota'),
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Kota wajib diisi';
                  if (val.length < 3) return 'Minimal 3 karakter';
                  if (!RegExp(r'^\[a-zA-Z\s]+$').hasMatch(val)) {
                    return 'Kota hanya boleh huruf dan spasi';
                  }
                  return null;
                },
              ),
              if (_globalError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    _globalError!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _kirim,
                child: const Text('Kirim'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}