import 'package:flutter/material.dart';

import 'home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profil Ekranım"),
      ),

bottomNavigationBar: BottomMenu(),

    );
  }
}