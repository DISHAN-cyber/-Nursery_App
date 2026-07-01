import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5F9),
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                ),
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            // Illustration Area
                       // Illustration Area
            Expanded(
              flex: 5,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  Image.asset(
                    'assets/images/onboarding1.png.png',
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    'assets/images/onboarding2.png.png',
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    'assets/images/onboarding3.png.png',
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Text Content
                        // Text Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _currentPage == 0 ? 'Never miss the' :
                    _currentPage == 1 ? 'Stay Updated in' :
                    'Safe & Secure for',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Color(0xFF4A4A4A),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _currentPage == 0 ? 'Nursery Magic' :
                    _currentPage == 1 ? 'Real Time' :
                    'Every Family',
                    style: const TextStyle(
                      fontSize: 28,
                      color: Color(0xFF1A1A1A),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _currentPage == 0 
                        ? 'From first steps to finger-paint masterpieces—it\'s all here, just for you.'
                        : _currentPage == 1
                        ? 'Get instant notifications about meals, naps, and daily activities.'
                        : 'Your data is protected with enterprise-level security and encryption.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Bottom Controls
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Dots
                  Row(
                    children: List.generate(_totalPages, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(right: 6),
                        height: 8,
                        width: index == _currentPage ? 24 : 8,
                        decoration: BoxDecoration(
                          color: index == _currentPage
                              ? const Color(0xFF6B4C7A)
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                  
                  // Next Button
                  GestureDetector(
                    onTap: _nextPage,
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6B4C7A),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6B4C7A).withOpacity(0.4),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}