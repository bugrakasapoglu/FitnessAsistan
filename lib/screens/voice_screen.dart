import 'package:flutter/material.dart';
//import 'package:flutter_app/core/constants.dart';

import 'home_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        title: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6, 
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 8, 144, 235),
              borderRadius: BorderRadius.circular(99),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Arama yap...',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
        ),
      ),
     
      bottomNavigationBar: const BottomMenu(),
    );
  }
}