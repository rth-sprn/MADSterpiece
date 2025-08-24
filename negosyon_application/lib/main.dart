import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'business_form_start.dart'; // import the first screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NegosyOn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFB11116),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const LoanReadyScreen(), // the starting screen
    );
  }
}