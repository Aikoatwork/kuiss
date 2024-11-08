import 'package:flutter/material.dart';

class CekHari extends StatefulWidget {
  const CekHari({super.key});

  @override
  _CekHariState createState() => _CekHariState();
}

class _CekHariState extends State<CekHari> {
  final _controller = TextEditingController();
  String _hari = '';

  void cekHari() {
    int nomor = int.parse(_controller.text);
    List<String> hari = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu'
    ];
    setState(() {
      _hari =
          (nomor >= 1 && nomor <= 7) ? hari[nomor - 1] : 'Nomor tidak valid';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cek Hari')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration:
                  const InputDecoration(labelText: 'Masukkan nomor (1-7)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: cekHari, child: const Text('Cek Hari')),
            const SizedBox(height: 16),
            Text('Hari: $_hari'),
          ],
        ),
      ),
    );
  }
}
