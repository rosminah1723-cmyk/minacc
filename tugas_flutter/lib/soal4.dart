import 'package:flutter/material.dart';

class Soal4 extends StatefulWidget {
    const Soal4({super.key});
    @override
    State<Soal4> createState() => _Soal4State();
}

class _Soal4State extends State<Soal4> {
    final _formKey = GlobalKey<FormState>();
    final _tglCtrl = TextEditingController();
    String? _hasilTanggal;

    @override
    void dispose() {
        _tglCtrl.dispose();
        super.dispose();
    }

    String? _validateTanggal(String? val) {
      if (val == null || val.isEmpty) return 'Tanggal wajib diisi';
      if (!RegExp(r'^\d{2}-\d{2}-\d{4}$').hasMatch(val)) {
        return 'Format harus DD-MM-YYYY';
      }
      final parts = val.split('-');
      final tgl = DateTime.tryParse('${parts[2]}-${parts[1]}-${parts[0]}');
      if (tgl == null) return 'Tanggal tidak valid';
      if (tgl.isAfter(DateTime.now())) return 'Tanggal tidak boleh di masa depan';
      return null;
    }

    void _proses() {
      if (_formKey.currentState!.validate()) {
        final parts = _tglCtrl.text.split('-');
        setState(() {
          _hasilTanggal = '${parts[2]}-${parts[1]}-${parts[0]}';
        });
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Soal 4 - Tanggal Lahir')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _tglCtrl,
                  decoration: const InputDecoration(
                      labelText: 'Tanggal Lahir (DD-MM-YYYY)'),
                  validator: _validateTanggal,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _proses,
                    child: const Text('Proses'),
                  ),
                  if  (_hasilTanggal != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        'Tanggal: $_hasilTanggal',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
              ],
            ),
          ),
        ),
      );
    }
}