import 'package:flutter/material.dart';
import 'package:gemini_translator/shared/data/models/language.dart';

class LanguageDropdown extends StatelessWidget {
  final Language selectedLanguage;
  final Function(Language) onLanguageSelected;

  const LanguageDropdown({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.language,
          size: 38,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(width: 8),
        DropdownMenu<Language>(
          initialSelection: selectedLanguage,
          onSelected: (Language? newValue) {
            if (newValue != null) {
              onLanguageSelected(newValue);
            }
          },
          dropdownMenuEntries: Language.values.map((Language language) {
            return DropdownMenuEntry<Language>(
              value: language,
              label: language.name,
            );
          }).toList(),
        ),
      ],
    );
  }
}