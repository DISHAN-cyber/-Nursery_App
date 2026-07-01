import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const NurseryConnectApp());
}

class NurseryConnectApp extends StatelessWidget {
  const NurseryConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nursery Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6B4C7A), // Purple
        scaffoldBackgroundColor: const Color(0xFFFDF5F9), // Light pink bg
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),
    );
  }
}