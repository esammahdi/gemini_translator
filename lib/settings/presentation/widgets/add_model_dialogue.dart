import 'package:fluent_ui/fluent_ui.dart';
import 'package:gemini_translator/shared/presentation/widgets/coming_soon.dart';
import '../../../shared/data/models/api_provider.dart';
import 'google_generative_ai_api_dialouge.dart';
import 'openai_api_dialouge.dart'; // For numeric input formatters

class AddModelDialogue extends StatefulWidget {
  const AddModelDialogue({super.key});

  @override
  State<AddModelDialogue> createState() => _AddModelDialogueState();
}

class _AddModelDialogueState extends State<AddModelDialogue> {
  APIProvider selectedAPIType = APIProvider.openAI;

  @override
  Widget build(BuildContext context) {
    return ContentDialog(
      constraints: const BoxConstraints(maxWidth: 600),
      title: const Text('Add a New Model'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ComboBox<APIProvider>(
              placeholder: const Text('API Type'),
              value: selectedAPIType,
              items: APIProvider.values.map((provider) {
                return ComboBoxItem<APIProvider>(
                  value: provider,
                  child: Text(provider.displayName),
                );
              }).toList(),
              onChanged: (APIProvider? newValue) {
                setState(() {
                  selectedAPIType = newValue!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            selectedAPIType == APIProvider.openAI
                ? OpenAIAPIDialog(onModelConfigSaved: (config) {})
                : selectedAPIType == APIProvider.googleGenerativeAI
                    ? GoogleGenerativeAIAPIDialog(onSaveModel: (displayName, config) => {})
                    : selectedAPIType == APIProvider.googleVertex
                        ? ComingSoon
                        : selectedAPIType == APIProvider.claude
                            ? ComingSoon
                            : ComingSoon
                            
          ],
        ),
      ),
      actions: [
        Button(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        FilledButton(
          child: const Text('Add'),
          onPressed: () {
            // Add model logic here
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  // Helper function to build a text field
}
