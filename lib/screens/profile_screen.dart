import 'package:flutter/material.dart';

import 'home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Profil',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black),
            onPressed: () {
              // Profil düzenleme işlemi burada yapılabilir.
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Üst tarafa hizalar
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0), // Yukarı taşıma miktarı
              child: CircleAvatar(
                radius: 100, // Yuvarlak çerçeve boyutu
                backgroundImage: AssetImage('assets/images/pp.jpg'), // Resim yolu
                backgroundColor: Colors.black, // Arka plan rengi
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Buğra Kasapoğlu',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sporcu Numarası',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              '541526492492',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ana Şube',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Cevizlibağ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Boy',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              '1.89cm',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Kilo',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              '76',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Yağ Oranı',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              '%15',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}