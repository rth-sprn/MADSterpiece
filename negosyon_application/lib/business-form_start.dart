import 'package:flutter/material.dart';

class LoanReadyScreen extends StatelessWidget {
  const LoanReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFFB71C1C),
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Back',
          style: TextStyle(
            color: Color(0xFFB71C1C),
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        ),
        titleSpacing: -10,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Illustration Image
              SizedBox(
                height: 280,
                child: Image.asset(
                  'assets/image.jpg',
                  fit: BoxFit.contain,
                ),
              ),
              const Spacer(flex: 1),
              // Title
              const Text(
                "Let's check how loan-ready your business is",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              // Subtitle
              const Text(
                'Answer a few quick questions to see the best loan options and tips for your business.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF666666),
                  height: 1.4,
                ),
              ),
              const Spacer(flex: 2),
              // Apply Now Button
              Container(
                width: double.infinity,
                height: 56,
                margin: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle apply now action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB71C1C),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Apply Now',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}

// Example usage in a MaterialApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loan Ready App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'SF Pro Display',
      ),
      home: const LoanReadyScreen(),
    );
  }
}