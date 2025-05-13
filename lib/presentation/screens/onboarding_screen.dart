import 'package:flutter/material.dart';
import '../../core/routes/app_routes.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Direct Pay',
      'subtitle': 'Pay with crypto across Africa effortlessly',
      'icon': Icons.credit_card,
    },
    {
      'title': 'Accept Payments',
      'subtitle': 'Accept stablecoin payments hassle-free',
      'icon': Icons.account_balance_wallet,
    },
    {
      'title': 'Pay Bills',
      'subtitle': 'Pay for utility services and earn rewards',
      'icon': Icons.receipt_long,
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToLogin() {
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: _pages.length,
      onPageChanged: (index) {
        setState(() {
          _currentPageIndex = index;
        });
      },
      itemBuilder: (context, index) {
        return OnboardingPage(
          title: _pages[index]['title'],
          subtitle: _pages[index]['subtitle'],
          icon: _pages[index]['icon'],
          isLastPage: index == _pages.length - 1,
          currentDot: _currentPageIndex,
          onNext: () {
            if (index < _pages.length - 1) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              _navigateToLogin();
            }
          },
          onSkip: _navigateToLogin,
        );
      },
    );
  }
}