import 'package:flutter/material.dart';

class Redirection extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const Redirection({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell( // Use InkWell for tap functionality
          onTap: onClick,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}