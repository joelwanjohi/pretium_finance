import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }
  
  _navigateToOnboarding() async {
    // Ensuring the navigation happens correctly
    await Future.delayed(const Duration(seconds: 6));
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Image.asset(
              'assets/landing.jpeg',
              height: 100,
              width: 100,
            
            ),
          ],
        ),
      ),
    );
  }
}