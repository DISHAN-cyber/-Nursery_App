import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _clusterController;
  late AnimationController _textController;
  
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // 1. Bubbles scale up animation
    _clusterController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _clusterController,
      curve: Curves.easeOutBack, // Gives it a nice "pop" effect
    ));

    // 2. Text fade in animation (starts slightly after bubbles)
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: Curves.easeIn,
    ));

    // Start animations
    _clusterController.forward();
    
    // Delay text appearance to match Splash 1 -> Splash 2
    Future.delayed(const Duration(milliseconds: 400), () {
      _textController.forward();
    });

    // Navigate to Onboarding after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    });
  }

  @override
  void dispose() {
    _clusterController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5F9), // Exact light pink background
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // --- LEFT SIDE: Text ---
            FadeTransition(
              opacity: _fadeAnimation,
              child: const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Text(
                  'Nursery\nConnect',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800, // Extra bold
                    color: Color(0xFF2D2D2D), // Dark gray/black
                    height: 1.1,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ),

            // --- RIGHT SIDE: Bubbles ---
            ScaleTransition(
              scale: _scaleAnimation,
              child: SizedBox(
                width: 140,
                height: 120,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // 1. Large Gradient Bubble (Top Right)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 65,
                        height: 65,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFE8B4D9), // Pink
                              Color(0xFFB8D4E8), // Blue
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ),
                    
                    // 2. Purple Bubble (Left)
                    Positioned(
                      left: 0,
                      top: 45,
                      child: Container(
                        width: 22,
                        height: 22,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFC9A0DC),
                        ),
                      ),
                    ),

                    // 3. Pink Bubble (Bottom Center)
                    Positioned(
                      left: 35,
                      bottom: 0,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF0C4D9),
                        ),
                      ),
                    ),

                    // 4. Blue Bubble (Bottom Right)
                    Positioned(
                      right: 15,
                      bottom: 15,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFB4D9E8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}