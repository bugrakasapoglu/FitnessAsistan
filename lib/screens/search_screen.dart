import 'package:flutter/material.dart';
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
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 6),
                boxShadow: [
                
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                  
                    Positioned.fill(
                      child: Image.asset(
                        [
                          "assets/images/barfiks.jpg",
                          "assets/images/plank.webp",
                          "assets/images/sprint.webp",
                          "assets/images/halter.jpg",
                          "assets/images/dumbel.jpg",
                          "assets/images/sinav.jpg",
                        ][index],
                        fit: BoxFit.cover,
                      ),
                    ),
                 
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green.withOpacity(0.8), 
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: 30, 
                        ),
                      ),
                    ),
                  ],
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
