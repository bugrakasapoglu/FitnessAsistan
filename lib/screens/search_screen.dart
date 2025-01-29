import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';

import 'home_screen.dart';

class VoiceScreen extends StatelessWidget {
  const VoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Tamamlanmış Egzersizler"),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0, 
            childAspectRatio: 1, 
          ),
          itemCount: 6, 
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 254, 255, 255),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 2),
              ),
              child: const Center(
                child: Icon(
                  Icons.image, 
                  size: 50,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
