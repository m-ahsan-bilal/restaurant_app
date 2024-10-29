import 'package:flutter/material.dart';
import 'dart:async';

import 'package:food_delivery_app/firebase_services/auth/auth_gate.dart';
import 'package:food_delivery_app/log_register/loginuser.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool showLoginPage = true;
  // void togglePages() {
  //   setState(() {
  //     showLoginPage = !showLoginPage;
  //   });
  // }

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Fade animation from 0 to 1
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Start the animation
    _controller.forward();

    // Navigate to home after 3 seconds
    Timer(const Duration(seconds: 3), () {
      // context.go('home_dash');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AuthGate()),
        // MaterialPageRoute(
        //     builder: (context) => LoginUser(onTap: togglePages))
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/splash1.jpeg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          // Overlay with fading logo and text
          FadeTransition(
            opacity: _fadeAnimation,
            child: const Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 200),
                  // App Name or slogan
                  Text(
                    'R E S T A U R A N T  A P P',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  Text(
                    "Developed by: M.Ahsan Bilal",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
