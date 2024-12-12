import 'package:flutter/material.dart';

import 'home_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8, 
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(99),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Arama yap...',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(""),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}