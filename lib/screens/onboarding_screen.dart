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
  final int _totalPages = 4;

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
    }
  }

  void _goToLastPage() {
    _pageController.jumpToPage(_totalPages - 1);
    setState(() {
      _currentPage = _totalPages - 1;
    });
  }

  String _getTitle1(int index) {
    switch (index) {
      case 0: return 'Never miss the';
      case 1: return 'Stay Updated in';
      case 2: return 'Safe & Secure for';
      default: return '';
    }
  }

  String _getTitle2(int index) {
    switch (index) {
      case 0: return 'Nursery Magic';
      case 1: return 'Real Time';
      case 2: return 'Every Family';
      default: return '';
    }
  }

  String _getDescription(int index) {
    switch (index) {
      case 0: return 'From first steps to finger-paint masterpieces—it\'s all here, just for you.';
      case 1: return 'Instant photos, activities, meals, and daily notes – delivered the moment they happen.';
      case 2: return 'Your data is protected. Only trusted guardians and teachers can access your child\'s world.';
      default: return '';
    }
  }

  String _getImage(int index) {
    switch (index) {
      case 0: return 'assets/images/onboarding1.png.png';
      case 1: return 'assets/images/onboarding2.png.png';
      case 2: return 'assets/images/onboarding3.png.png';
      default: return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    // ==========================================
    // LAST PAGE (Screen 4) - FIXED LAYOUT
    // ==========================================
    if (_currentPage == _totalPages - 1) {
      return Scaffold(
        backgroundColor: const Color(0xFFFDF5F9),
        body: SafeArea(
          child: Column(
            children: [
              // 1. Empty space at top (flex: 2)
              const Expanded(flex: 2, child: SizedBox()),
              
              // 2. Buttons in middle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    // Create Account Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2D2D2D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Create Account',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const LoginScreen()),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF2D2D2D)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2D2D2D),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward, color: Color(0xFF2D2D2D), size: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // 3. Space between buttons and image
              const Expanded(flex: 1, child: SizedBox()),
              
              // 4. Children illustration at the very bottom
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/images/onboarding4.png.png',
                  width: double.infinity,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: Text('Children Image', style: TextStyle(fontSize: 16)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }

    // ==========================================
    // STANDARD LAYOUT (Screens 1, 2, 3)
    // ==========================================
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5F9),
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button (ONLY on screens 1 and 2)
            if (_currentPage < 2)
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: _goToLastPage,
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
            Expanded(
              flex: 5,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      _getImage(index),
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Text Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getTitle1(_currentPage),
                    style: const TextStyle(
                      fontSize: 22,
                      color: Color(0xFF4A4A4A),
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _getTitle2(_currentPage),
                    style: const TextStyle(
                      fontSize: 28,
                      color: Color(0xFF1A1A1A),
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _getDescription(_currentPage),
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
                  Row(
                    children: List.generate(3, (index) {
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
                                    GestureDetector(
                    onTap: _currentPage == 2 ? _goToLastPage : _nextPage,
                    child: Container(
                      padding: _currentPage == 2
                          ? const EdgeInsets.symmetric(horizontal: 24, vertical: 16)
                          : null,
                      width: _currentPage == 2 ? null : 56,
                      height: _currentPage == 2 ? null : 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6B4C7A),
                        // FIX: Use BoxShape enum and borderRadius separately
                        shape: _currentPage == 2 ? BoxShape.rectangle : BoxShape.circle,
                        borderRadius: _currentPage == 2 ? BorderRadius.circular(28) : null,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6B4C7A).withOpacity(0.4),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: _currentPage == 2
                          ? const Text(
                              'Start Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 24,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}