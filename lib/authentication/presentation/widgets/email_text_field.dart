import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final String email;
  final String emailErrorMessage;
  final ValueChanged<String> onValueChange;
  final String label;

  const EmailTextField({
    super.key,
    required this.email,
    required this.emailErrorMessage,
    required this.onValueChange,
    this.label = 'Email',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: email), // Initialize with email
      onChanged: onValueChange,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: label,
        hintText: label,
        prefixIcon: const Icon(Icons.email),
        errorText: emailErrorMessage.isNotEmpty ? emailErrorMessage : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Matching Compose shape
        ),
      ),
    );
  }
}