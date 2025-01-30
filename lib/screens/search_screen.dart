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
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 4), // Çerçeve kalınlığı artırıldı
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                 ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: index == 0
                    ? const Image(
                        image: AssetImage("assets/images/barfiks.jpg"),
                        fit: BoxFit.cover,
                      )

                    : index == 1
                              ? const Image(
                                  image: AssetImage("assets/images/hh1.jpg"),
                                  fit: BoxFit.cover,
                      )


                    : const Icon(
                        Icons.image,
                        size: 50,
                        color: Colors.black,
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
