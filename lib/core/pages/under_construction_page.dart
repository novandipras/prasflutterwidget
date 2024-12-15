import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnderConstructionPage extends StatelessWidget {
  static const routeName = "/UnderConstructionPage";

  const UnderConstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.construction_rounded,
              color: Colors.amber,
              size: 32,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'This page is under construction',
              style: GoogleFonts.roboto(fontSize: 24),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
