import 'package:flutter/material.dart';
import 'themes/app_theme.dart';
import 'utils/app_router.dart';

void main() {
  runApp(const NurseryConnectApp());
}

class NurseryConnectApp extends StatelessWidget {
  const NurseryConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Nursery Connect',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}
