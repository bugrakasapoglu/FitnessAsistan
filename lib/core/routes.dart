import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/screens/register_screen.dart';
import 'package:go_router/go_router.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';
import '../screens/voice_screen.dart';

// Router yapılandırması
final router = GoRouter(
  initialLocation: '/',  // Başlangıç rotası
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(path: '/profile',
    builder: (context, state) => const ProfileScreen(),
    ),

       GoRoute(
      path: '/voice',
      builder: (context, state) => const VoiceScreen(),
    ),

         GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),

    GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),

       GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),

 

  ],
);
