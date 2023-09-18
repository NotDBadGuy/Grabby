import 'package:flutter/material.dart';
import 'package:grabby/src/views/onboardingscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  Future<void> startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() => animate = true);
    await Future.delayed(const Duration(milliseconds: 3000));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OnboardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2978D1),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            alignment: Alignment.center,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: animate ? 1.0 : 0.0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(seconds: 3),
                    top: animate ? 340 : 360,
                    child: Image.asset(
                      'assets/images/grabby-logo.png',
                      width: animate ? 77.9 : 0,
                      height: animate ? 99.8 : 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 3),
            curve: Curves.easeInOut,
            bottom: animate ? 310 : 280,
            left: 145,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 4),
              opacity: animate ? 1.0 : 0.0,
              child: const Text(
                "Grabby",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 32.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
