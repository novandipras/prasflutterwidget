import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotFoundPage extends StatelessWidget {
  static const routeName = "/NotFoundPage";

  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Not Found !",
          style: GoogleFonts.roboto(
              textStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
