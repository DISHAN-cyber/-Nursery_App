import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'themes/app_theme.dart';

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
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
