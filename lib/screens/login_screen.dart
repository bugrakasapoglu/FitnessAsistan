import 'package:flutter/material.dart';
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
    String? savedEmail = prefs.getString("email");
    String? savedPassword = prefs.getString("password");

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      _showMessage("Bilgilerinizi giriniz.");
      return;
    }

    if (emailController.text == savedEmail && passwordController.text == savedPassword) {
      _showMessage("Giriş başarılı!", isSuccess: true);
      Future.delayed(const Duration(seconds: 1), () {
        context.go("/home");
      });
    } else {
      _showMessage("E-Posta veya şifre yanlış.");
    }
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
