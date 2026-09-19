import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:scanguard/constants/colors.dart';
import 'package:scanguard/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'scanguard',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: AppColors.primary,
                letterSpacing: -1.5,
              ),
            ),
            const SizedBox(height: 24),
            SpinKitThreeBounce(
              color: AppColors.primary,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
