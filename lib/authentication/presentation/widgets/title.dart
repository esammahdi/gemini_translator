import 'package:flutter/material.dart';

class Title extends StatelessWidget {
  final String text;
  final Color? textColor; // Make textColor optional

  const Title({
    super.key,
    required this.text,
    this.textColor, // Allow for custom text color
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center, // Center align the title
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: textColor ?? Theme.of(context).primaryColor, // Use primary color if custom color is not provided
      ),
    );
  }
}