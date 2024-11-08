import 'package:flutter/material.dart';
import 'bangun_datar.dart';
import 'konversi_waktu.dart';
import 'cek_hari.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bangun Datar App')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Hitung Piramida'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BangunDatar()),
              );
            },
          ),
          ListTile(
            title: const Text('Konversi Waktu'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const KonversiWaktu()),
              );
            },
          ),
          ListTile(
            title: const Text('Cek Hari'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CekHari()),
              );
            },
          ),
        ],
      ),
    );
  }
}
