import 'package:flutter/material.dart';
//import 'package:flutter_app/core/storage_helper.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

Future<void> _login() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> users = prefs.getStringList("users") ?? [];

  String email = emailController.text;
  String password = passwordController.text;

  for (String user in users) {
    List<String> userData = user.split(":");

    if (userData.length >= 3 && userData[0] == email && userData[1] == password) {
      await prefs.setString("currentUser", user);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Giriş başarılı! Profil sayfasına yönlendiriliyorsunuz.")),
      );

      Future.delayed(const Duration(seconds: 1), () {
        context.go("/profile");
      });

      return;
    }
  }

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("E-posta veya şifre hatalı!")),
  );
}


 void _showMessage(String message, {bool isSuccess = false}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Giriş Yap")),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "E-Posta",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: "Şifre",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _login,
                child: const Text("Giriş Yap"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  context.pushReplacement("/register");
                },
                child: const Text("Kayıt Ol"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
