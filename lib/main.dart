import 'package:flutter/material.dart';
//import 'package:flutter_app/core/constants.dart';
import 'package:flutter_app/core/themes.dart';

import 'core/routes.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App',
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: router,   
      debugShowCheckedModeBanner: false,  
    );
  }

  static of(BuildContext context) {}
}