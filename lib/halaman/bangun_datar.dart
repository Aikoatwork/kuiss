import 'package:flutter/material.dart';

class BangunDatar extends StatefulWidget {
  const BangunDatar({super.key});

  @override
  _BangunDatarState createState() => _BangunDatarState();
}

class _BangunDatarState extends State<BangunDatar> {
  double _volume = 0;
  double _keliling = 0;
  final _controllerAlas = TextEditingController();
  final _controllerTinggi = TextEditingController();

  void hitungVolume() {
    double alas = double.parse(_controllerAlas.text);
    double tinggi = double.parse(_controllerTinggi.text);
    setState(() {
      _volume = (1 / 3) * alas * alas * tinggi;
    });
  }

  void hitungKeliling() {
    double alas = double.parse(_controllerAlas.text);
    setState(() {
      _keliling = 4 * alas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hitung Piramida')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controllerAlas,
              decoration: const InputDecoration(labelText: 'Masukkan alas piramida'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _controllerTinggi,
              decoration: const InputDecoration(labelText: 'Masukkan tinggi piramida'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: hitungVolume, child: const Text('Hitung Volume')),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: hitungKeliling, child: const Text('Hitung Keliling')),
            const SizedBox(height: 16),
            Text('Volume Piramida: $_volume'),
            const SizedBox(height: 16),
            Text('Keliling Piramida: $_keliling'),
          ],
        ),
      ),
    );
  }
}
