import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({
    super.key,
    this.color = Colors.white,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 26,
        width: 26,
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
