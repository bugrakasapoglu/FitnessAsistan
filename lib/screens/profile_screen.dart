import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); 

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: theme.brightness == Brightness.dark
              ? null 
              : const LinearGradient(
                  colors: [Colors.green, Colors.teal],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          color: theme.brightness == Brightness.dark ? Colors.green.shade800 : null,
        ),
        child: Center( 
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            children: [
             
              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white, 
                child: CircleAvatar(
                radius: 55, 
                backgroundColor: Colors.grey, 
                
               ),
              ),
              const SizedBox(height: 15),
              
              const Text(
                "Hoş Geldin, Kullanıcı!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
             
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
