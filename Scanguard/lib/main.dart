import 'package:flutter/material.dart';
import 'package:scanguard/constants/theme.dart';
import 'package:scanguard/screens/splash_screen.dart';

void main() {
  runApp(const ScanguardApp());
}

class ScanguardApp extends StatelessWidget {
  const ScanguardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scanguard',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
