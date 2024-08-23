import 'package:fluent_ui/fluent_ui.dart';
import 'package:gemini_translator/settings/presentation/widgets/add_model_dialogue.dart';
import '../../../shared/data/models/llm_model.dart';
import '../../../shared/data/models/api_provider.dart';

class ModelsPage extends StatefulWidget {
  const ModelsPage({super.key});

  @override
  State<ModelsPage> createState() => _ModelsPageState();
}

class _ModelsPageState extends State<ModelsPage> {
  static List<Provider> providers = [
    Provider(
      displayName: "OpenAI",
      baseUrl: "https://api.openai.com/v1",
      apiType: "OpenAI",
    ),
    Provider(
      displayName: "Google AI",
      baseUrl: "https://api.openai.com/v1",
      apiType: "OpenAI",
    ),
    Provider(
      displayName: "Vertex",
      baseUrl: "https://api.openai.com/v1",
      apiType: "OpenAI",
    ),
    Provider(
      displayName: "Claude",
      baseUrl: "https://api.openai.com/v1",
      apiType: "OpenAI",
    ),
  ];

  static List<LLMModel> llmModels = [
    LLMModel(
      provider: providers[0],
      apiKey: "YOUR_API_KEY",
      displayName: "GPT4",
      modelName: "gpt-3.5-turbo",
      requestsPerMinute: 30,
      tokensPerMinute: 4000,
    ),
    LLMModel(
      provider: providers[3],
      apiKey: "YOUR_API_KEY",
      displayName: "Claude 3.5 Sonnet",
      modelName: "gpt-3.5-turbo",
      requestsPerMinute: 30,
      tokensPerMinute: 4000,
    ),
    LLMModel(
      provider: providers[1],
      apiKey: "YOUR_API_KEY",
      displayName: "Gemini 1.5 Pro",
      modelName: "gpt-3.5-turbo",
      requestsPerMinute: 30,
      tokensPerMinute: 4000,
    ),
    LLMModel(
      provider: providers[0],
      apiKey: "YOUR_API_KEY",
      displayName: "GPT-3.5 Turbo",
      modelName: "gpt-3.5-turbo",
      requestsPerMinute: 30,
      tokensPerMinute: 4000,
    ),
    LLMModel(
      provider: providers[2],
      apiKey: "YOUR_API_KEY",
      displayName: "Gemini Flash",
      modelName: "gpt-3.5-turbo",
      requestsPerMinute: 30,
      tokensPerMinute: 4000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add Model Button
          const Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              'Models',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
          ),

          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: FilledButton(
              onPressed: () => {
                    showDialog(context: context, builder: (context) => const AddModelDialogue())
              },
              child: const Text('Add a Model'),
            ),
          ),

          const SizedBox(height: 16.0),

          // Models Table
          Expanded(
            // Use Expanded to allow table to fill available space
            child: SingleChildScrollView(
              // Add SingleChildScrollView to handle overflow
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: const {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(3),
                      2: FlexColumnWidth(2),
                      3: IntrinsicColumnWidth(),
                      4: IntrinsicColumnWidth(),
                    },
                    border: TableBorder.all(
                      color: const Color.fromARGB(244, 237, 229, 229),
                      // borderRadius: BorderRadius.circular(16.0),
                    ),
                    children: [
                      // Table Header
                      TableRow(
                        decoration: BoxDecoration(
                            color: FluentTheme.of(context)
                                .accentColor // Accent color background
                            ),
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Display Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Model Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Provider',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),

                      // Table Rows (LLM Models)
                      ...llmModels.asMap().entries.map((entry) {
                        final index = entry.key;
                        final model = entry.value;
                        return TableRow(
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? const Color.fromARGB(255, 223, 234, 243)
                                : const Color.fromARGB(
                                    0, 255, 255, 255), // Alternating row colors
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(model.displayName),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(model.modelName),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(model.provider.displayName),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: const Icon(FluentIcons.edit),
                                onPressed: () {
                                  // Handle edit model logic here
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: const Icon(FluentIcons.delete),
                                onPressed: () {
                                  // Handle delete model logic here
                                },
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
