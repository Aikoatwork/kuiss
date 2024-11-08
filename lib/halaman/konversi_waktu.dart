import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KonversiWaktu extends StatefulWidget {
  const KonversiWaktu({super.key});

  @override
  _KonversiWaktuState createState() => _KonversiWaktuState();
}

class _KonversiWaktuState extends State<KonversiWaktu> {
  final _controller = TextEditingController();
  String? _wib;
  String? _wita;
  String? _wit;
  String _selectedPeriod = 'AM'; // Default to AM
  String _selectedFormat = '12'; // Default to 12 jam

  void konversiWaktu() {
    // Validasi input dengan format 12 jam (HH:mm) atau 24 jam (HH:mm) sesuai pilihan
    final input = _controller.text;
    final regex12Jam = RegExp(r'^(0?[1-9]|1[0-2]):[0-5][0-9]$');
    final regex24Jam = RegExp(r'^(0?[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$');

    if ((_selectedFormat == '12' && !regex12Jam.hasMatch(input)) ||
        (_selectedFormat == '24' && !regex24Jam.hasMatch(input))) {
      setState(() {
        _wib = "Format waktu tidak valid";
        _wita = "";
        _wit = "";
      });
      return;
    }

    try {
      // Parsing input waktu berdasarkan format jam yang dipilih
      DateTime waktu;
      if (_selectedFormat == '12') {
        final inputFormat = DateFormat("hh:mm a");
        waktu = inputFormat.parse("$input $_selectedPeriod");
      } else {
        final inputFormat = DateFormat("HH:mm");
        waktu = inputFormat.parse(input);
      }

      // Menghitung perbedaan waktu dalam zona waktu Indonesia
      final wib = waktu;
      final wita = wib.add(const Duration(hours: 1));
      final wit = wib.add(const Duration(hours: 2));

      // Format keluaran sesuai dengan format jam yang dipilih
      final outputFormat = _selectedFormat == '12' ? DateFormat("hh:mm a") : DateFormat("HH:mm");
      setState(() {
        _wib = "${outputFormat.format(wib)} WIB";
        _wita = "${outputFormat.format(wita)} WITA";
        _wit = "${outputFormat.format(wit)} WIT";
      });
    } catch (e) {
      setState(() {
        _wib = "Format waktu tidak valid";
        _wita = "";
        _wit = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Konversi Waktu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown untuk memilih format waktu 12/24 jam
            Row(
              children: [
                const Text("Pilih format jam: "),
                DropdownButton<String>(
                  value: _selectedFormat,
                  items: ['12', '24'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text('$value Jam'),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedFormat = newValue!;
                      _selectedPeriod = 'AM'; // Reset ke AM jika format diubah
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Input waktu dan dropdown AM/PM jika format 12 jam
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Masukkan waktu (hh:mm)',
                      hintText: _selectedFormat == '12' ? 'Contoh: 11:10' : 'Contoh: 23:10',
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                if (_selectedFormat == '12') ...[
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: _selectedPeriod,
                    items: ['AM', 'PM'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedPeriod = newValue!;
                      });
                    },
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: konversiWaktu,
              child: const Text('Konversi Waktu'),
            ),
            const SizedBox(height: 24),
            if (_wib != null) Text('WIB: $_wib'),
            if (_wita != null) Text('WITA: $_wita'),
            if (_wit != null) Text('WIT: $_wit'),
          ],
        ),
      ),
    );
  }
}
