import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'loan_recommendation.dart';
import 'no_recommendation.dart';

class LoanEndScreen extends StatelessWidget {
  const LoanEndScreen({super.key});

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
            color: Color(0xFFB11116),
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Back',
          style: GoogleFonts.poppins(
            color: Color(0xFFB11116),
            fontSize: 16,
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
                  'assets/business-form_end.png',
                  fit: BoxFit.contain,
                ),
              ),
              const Spacer(flex: 1),
              // Title
              Text(
                "Loan Readiness Check Done!",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              // Subtitle
              Text(
                'Check your loan matches and tips to grow smarter.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF666666),
                  height: 1.4,
                ),
              ),
              const Spacer(flex: 2),
              // View Recommendation Button
              Container(
                width: double.infinity,
                height: 56,
                margin: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Replace this with your actual logic from form answers
                    bool hasRecommendation = true; // Example: true if a match exists

                    if (hasRecommendation) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoanRecommendationPage(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoRecommendationPage(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB11116),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Text(
                    'View Recommendation',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
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

void main() {
  runApp(MyApp());
}

// Example usage in a MaterialApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loan Ready App',
      theme: ThemeData(
        primaryColor: Color(0xFFB11116),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoanEndScreen(),
    );
  }
}