import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/image.png')),
            SizedBox(height: 20),
            Text('Nama: Bagas Luqman Nur Hakim'),
            Text('NIM: 124220004'),
            Text('TTL: Depok, 27 Mei 2004'),
            Text('Hobi: Bermain game'),
          ],
        ),
      ),
    );
  }
}
