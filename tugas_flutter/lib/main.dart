import 'package:flutter/material.dart';
import 'soal1.dart';
import 'soal2.dart';  
import 'soal3.dart';  
import 'soal4.dart';
import 'soal5.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TGS-723',
      home: const MenuUtama(),
    );
  }
}

class MenuUtama extends StatelessWidget {
  const MenuUtama({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TGS-723 Menu')),
      body: ListView(
        children: [
          _title(context, 'Soal 1 - Nama Produk', const Soal1()),
          _title(context, 'Soal 2 - Pendaftaran', const Soal2()),
          _title(context, 'Soal 3 - Nomor Telepon', const Soal3()),
          _title(context, 'Soal 4 - Tanggal Lahir', const Soal4()),
          _title(context, 'Soal 5 - Alamat', const Soal5()),
        ],
      ),
    );
  }

  ListTile _title(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => Navigator.push(
        context, MaterialPageRoute(builder: (_) => page)),
    );
  }
}