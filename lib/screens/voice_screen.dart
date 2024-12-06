import 'package:flutter/material.dart';

import 'home_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
        child: Text("Ses Ekranım"),
      ),

bottomNavigationBar: BottomMenu(),

    );
  }
}