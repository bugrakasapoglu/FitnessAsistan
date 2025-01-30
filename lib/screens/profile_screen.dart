import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Tema kontrolü

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: theme.brightness == Brightness.dark
              ? null // Koyu modda gradient kaldırıldı
              : const LinearGradient(
                  colors: [Colors.green, Colors.teal],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          color: theme.brightness == Brightness.dark ? Colors.green.shade800 : null,
        ),
        child: Center( // Tüm içeriği ortaladık
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ortaya almak için min boyutta tut
            children: [
              // Profil Resmi
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/profile_pic.png"),
              ),
              const SizedBox(height: 15),
              // Kullanıcı Adı
              const Text(
                "Hoş Geldin, Kullanıcı!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              // Giriş Yap Butonu
              ElevatedButton(
                onPressed: () {
                  context.push("/login");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  "Giriş Yapınız",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
