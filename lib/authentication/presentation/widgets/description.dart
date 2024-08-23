import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String text;

  const Description({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500, 
        color: Theme.of(context).colorScheme.secondary, // Using the theme's secondary color
      ),
    );
  }
}