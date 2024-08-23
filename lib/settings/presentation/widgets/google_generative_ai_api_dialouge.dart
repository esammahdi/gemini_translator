import 'package:fluent_ui/fluent_ui.dart';
import '../../../shared/data/models/google_generative_ai_model_config.dart';

class GoogleGenerativeAIAPIDialog extends StatefulWidget {
  const GoogleGenerativeAIAPIDialog({super.key, required this.onSaveModel});

  final Function(String displayName, GoogleGenerativeAIConfig config) onSaveModel;

  @override
  State<GoogleGenerativeAIAPIDialog> createState() =>
      _GoogleGenerativeAIAPIDialogState();
}

class _GoogleGenerativeAIAPIDialogState
    extends State<GoogleGenerativeAIAPIDialog> {
  final _formKey = GlobalKey<FormState>();

  // Controllers and Values
  final _apiKeyController = TextEditingController();
  final _displayNameController = TextEditingController();
  GeminiModel _selectedModel = GeminiModel.pro; // Default model
  double _temperature = 1.0; // Default temperature
  int _maxOutputTokens = 8192; // Default max output tokens

  @override
  void dispose() {
    _apiKeyController.dispose();
    _displayNameController.dispose();
    super.dispose();
  }

  void _saveModel() {
    if (_formKey.currentState!.validate()) {
      final googleConfig = GoogleGenerativeAIConfig(
        model: _selectedModel,
        temperature: _temperature,
        maxOutputTokens: _maxOutputTokens,
      );
      widget.onSaveModel(_displayNameController.text, googleConfig);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display Name
          _buildTextField('Display Name', _displayNameController,
              isRequired: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Display Name';
                }
                return null;
              }),

          // API Key
          _buildTextField('API Key', _apiKeyController,
              isRequired: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an API Key';
                }
                return null;
              }),

        Row(
          children: [
            const Text('Model', style: TextStyle(fontWeight: FontWeight.bold)),

              Padding(
                padding: const EdgeInsetsDirectional.only(start: 4.0),
                child: Icon(
                  FluentIcons.starburst_solid,
                  size: 10,
                  color: Colors.red,
                ),
              ),
          ],
        ),

        const SizedBox(height: 8.0),

        ComboBox<GeminiModel>(
          value: _selectedModel,
          items: GeminiModel.values.toList().map<ComboBoxItem<GeminiModel>>((GeminiModel item) {
            return ComboBoxItem<GeminiModel>(
              value: item,
              child: Text(item.displayName),
            );
          }).toList(),
          onChanged: (GeminiModel? newValue) {
            if (newValue != null) {
              _selectedModel = newValue;
            }
          },
        ),

        const SizedBox(height: 16.0),

          // Temperature Slider
          _buildSlider('Temperature', _temperature, (value) => setState(() {
                _temperature = value;
              }),
              min: 0.0, max: 2.0),

          // Max Output Tokens Slider
          _buildSlider('Max Output Tokens', _maxOutputTokens.toDouble(), (value) => setState(() {
                _maxOutputTokens = value.round();
              }),
              min: 1024, max: 8192),

        ],
      ),
    );
  }

   // Helper function to build a text field
  Widget _buildTextField(String label, TextEditingController controller,
      {required bool isRequired, FormFieldValidator<String>? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            if (isRequired)
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 4.0),
                child: Icon(
                  FluentIcons.starburst_solid,
                  size: 10,
                  color: Colors.red,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8.0),
        TextFormBox(
          controller: controller,
          placeholder: 'Enter $label',
          validator: validator,
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  // Helper function to build a slider
  Widget _buildSlider(
      String label, double value, ValueChanged<double> onChanged,
      {double min = 0.0, double max = 1.0}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Text(min.toStringAsFixed(2)),
            Expanded(
              child: Slider(
                value: value,
                onChanged: onChanged,
                min: min,
                max: max,
                divisions: 10, // Adjust divisions for finer control
                label: value.toStringAsFixed(2), // Display slider value
              ),
            ),
            Text(max.toStringAsFixed(2)),
          ],
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}


































 