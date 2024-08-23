import 'package:flutter/material.dart';
import 'package:gemini_translator/authentication/presentation/widgets/language_dropdown.dart';
import 'package:gemini_translator/shared/data/models/language.dart';

class AuthenticationLayout extends StatelessWidget {
  final Language selectedLanguage;
  final Function(Language) onLanguageSelected;
  final Widget child;

  const AuthenticationLayout({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageSelected,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: LanguageDropdown(
                  selectedLanguage: selectedLanguage,
                  onLanguageSelected: onLanguageSelected,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}