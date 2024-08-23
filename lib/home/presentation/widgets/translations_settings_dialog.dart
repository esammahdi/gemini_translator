import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;

class TranslationSettingsDialog extends StatefulWidget {
  const TranslationSettingsDialog({super.key});

  @override
  State<TranslationSettingsDialog> createState() =>
      _TranslationSettingsDialogState();
}

class _TranslationSettingsDialogState extends State<TranslationSettingsDialog> {
  final _models = ['Gemini Pro', 'Gemini Lite', 'ChatGPT', 'DeepL'];
  final _speechStyles = ['None', 'Formal', 'Casual', 'Technical', 'Literary'];
  final _dictionaryItems = ['Dictionary 1', 'Dictionary 2', 'Dictionary 3', 'Dictionary 4', 'Dictionary 5'];

  String _selectedModel = 'Gemini Pro';
  final List<String> _selectedDictionaries = [];
  int _selectedSpeechStyleIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ContentDialog(
      title: const Row(
        children: [
          Icon(FluentIcons.translate, size: 28), // Icon for Dictionary
          SizedBox(width: 8.0),
          Text(
            'Translation Settings',
          ),
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),

          // Model Selection (Dropdown)
          const Row(
            children: [
              Icon(
                FluentIcons.settings,
                size: 20,
              ), // Icon for Model
              SizedBox(width: 8.0),
              Text(
                'Model',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          ComboBox<String>(
            value: _selectedModel,
            items: _models.map<ComboBoxItem<String>>((String model) {
              return ComboBoxItem<String>(
                value: model,
                child: Text(model),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedModel = newValue!;
              });
            },
          ),
          const SizedBox(height: 16.0),

          // Speech Style (Chip Group)
          const Row(
            children: [
              Icon(
                FluentIcons.speech,
                size: 20,
              ), // Icon for Speech Style
              SizedBox(width: 8.0),
              Text(
                'Speech Style',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 12.0),

          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: List.generate(_speechStyles.length, (index) {
              return material.Material(
                child: material.ChoiceChip(
                  selected: _selectedSpeechStyleIndex == index,
                  onSelected: (checked) {
                    setState(() {
                      _selectedSpeechStyleIndex = checked ? index : -1;
                    });
                  },
                  label: Text(_speechStyles[index]),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    side: BorderSide(
                      color: _selectedSpeechStyleIndex == index
                          ? Colors.transparent
                          : const Color.fromARGB(255, 195, 193, 189),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 16.0),

          const Row(
            children: [
              Icon(
                FluentIcons.book_answers,
                size: 20,
              ), // Icon for Dictionary
              SizedBox(width: 8.0),
              Text(
                'Dictionaries',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),

          const SizedBox(height: 10.0),

          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              border:
                  Border.all(color: const Color.fromARGB(255, 185, 178, 170)),
              borderRadius: BorderRadius.circular(4.0),
            ),
            padding: const EdgeInsets.all(0.0),
            child: SizedBox(
              height: 150, // Adjust height as needed
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _dictionaryItems.length,
                itemBuilder: (context, index) {
                  final dictItem = _dictionaryItems[index];
                  return ListTile.selectable(
                    title: Text(dictItem),
                    selected: _selectedDictionaries.contains(dictItem),
                    selectionMode: ListTileSelectionMode.multiple,
                    shape: const Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 221, 218, 215), // Set the border color
                        width: 1.0, // Set the border width
                      ),
                    ),
                    onSelectionChange: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedDictionaries.add(dictItem);
                        } else {
                          _selectedDictionaries.remove(dictItem);
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      actions: [
        Button(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        FilledButton(
          child: const Text('Apply'),
          onPressed: () {
            // Apply settings logic here
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
