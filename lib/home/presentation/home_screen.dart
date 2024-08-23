import 'package:fluent_ui/fluent_ui.dart';
import 'widgets/translations_settings_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _languages = ['English', 'Arabic', 'Malaysian'];
  String _selectedSourceLanguage = 'English';
  String _selectedTargetLanguage = 'Arabic';


  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(
        title: Text('Gemini Translator'),
      ),
      content: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLanguageDropdown(_selectedSourceLanguage, true),
                            const SizedBox(height: 8.0),
                            _buildInputField(),
                            const SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(FluentIcons.microphone, size: 20),
                                  onPressed: () {
                                    // Handle microphone input here
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(FluentIcons.paste, size: 20),
                                  onPressed: () {
                                    // Handle paste action here
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLanguageDropdown(_selectedTargetLanguage, false),
                            const SizedBox(height: 8.0),
                            _buildTranslatedField(),
                            const SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(FluentIcons.copy, size: 20),
                                  onPressed: () {
                                    // Handle copy action here
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  SizedBox(
                    width: 200,
                    child: FilledButton(
                      child: const Text('Translate'),
                      onPressed: () {
                        // Handle translation logic here
                      },
                    ),
                  ),

                  // Button to Open Settings Dialog
                  const SizedBox(height: 16.0),
                  FilledButton(
                    child: const Text('Translation Settings'),
                    onPressed: () async {
                      await showDialog<String>(
                        context: context,
                        builder: (context) => const TranslationSettingsDialog(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageDropdown(String selectedLanguage, bool isSource) {
    return ComboBox<String>(
      placeholder: const Text('Select Language'),
      value: selectedLanguage,
      items: _languages.map<ComboBoxItem<String>>((String language) {
        return ComboBoxItem<String>(
          value: language,
          child: Text(language),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          if (isSource) {
            _selectedSourceLanguage = newValue!;
          } else {
            _selectedTargetLanguage = newValue!;
          }
        });
      },
    );
  }

  Widget _buildInputField() {
    return const TextBox(
      maxLines: 10,
      placeholder: 'Enter text to translate',
      padding: EdgeInsets.symmetric(horizontal: 16.0),
    );
  }

  Widget _buildTranslatedField() {
    return const TextBox(
      maxLines: 10,
      placeholder: 'Translated text will appear here',
      readOnly: true,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
    );
  }
}

