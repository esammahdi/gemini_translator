import 'package:fluent_ui/fluent_ui.dart';
import '../../../shared/data/models/openai_model_config.dart';

class OpenAIAPIDialog extends StatefulWidget {
  const OpenAIAPIDialog({super.key, required this.onModelConfigSaved});

  final Function(OpenAIModelConfig) onModelConfigSaved;

  @override
  State<OpenAIAPIDialog> createState() => _OpenAIAPIDialogState();
}

class _OpenAIAPIDialogState extends State<OpenAIAPIDialog> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for Text Fields
  final _baseUrlController = TextEditingController();
  final _apiKeyController = TextEditingController();
  final _modelNameController = TextEditingController();
  final _organizationIdController = TextEditingController();
  final _proxyUrlController = TextEditingController();
  final _proxyUsernameController = TextEditingController();
  final _proxyPasswordController = TextEditingController();

  // Values for Numeric Inputs and Sliders
  int _requestsPerMinute = 60;
  int _tokensPerMinute = 1000;
  int _maxTokens = 150;
  double _temperature = 0.7;
  double _topP = 0.9;
  double _frequencyPenalty = 0.0;
  double _presencePenalty = 0.0;
  int _retryCount = 3;

  @override
  void dispose() {
    // Dispose all controllers here
    _baseUrlController.dispose();
    _apiKeyController.dispose();
    _modelNameController.dispose();
    _organizationIdController.dispose();
    _proxyUrlController.dispose();
    _proxyUsernameController.dispose();
    _proxyPasswordController.dispose();
    super.dispose();
  }

  void _saveModelConfig() {
    if (_formKey.currentState!.validate()) {
      final openAIConfig = OpenAIModelConfig(
        baseUrl: _baseUrlController.text,
        apiKey: _apiKeyController.text,
        modelName: _modelNameController.text,
        requestsPerMinute: _requestsPerMinute,
        tokensPerMinute: _tokensPerMinute,
        organizationId: _organizationIdController.text.isNotEmpty
            ? _organizationIdController.text
            : null,
        temperature: _temperature,
        topP: _topP,
        maxTokens: _maxTokens,
        frequencyPenalty: _frequencyPenalty,
        presencePenalty: _presencePenalty,
        // ... other parameters ...
        proxyUrl:
            _proxyUrlController.text.isNotEmpty ? _proxyUrlController.text : null,
        proxyUsername: _proxyUsernameController.text.isNotEmpty
            ? _proxyUsernameController.text
            : null,
        proxyPassword: _proxyPasswordController.text.isNotEmpty
            ? _proxyPasswordController.text
            : null,
        retryCount: _retryCount,
      );
      widget.onModelConfigSaved(openAIConfig);
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
          // Required Parameters
          _buildTextField('Base URL', _baseUrlController, isRequired: true, validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a Base URL';
            }
            // Add URL validation logic here
            return null;
          }),
          _buildPasswordField('API Key', _apiKeyController, isRequired: true, validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an API Key';
            }
            return null;
          }),
          _buildTextField('Model Name', _modelNameController, isRequired: true, validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a Model Name';
            }
            return null;
          }),
          _buildNumericField('Requests Per Minute', _requestsPerMinute,
              (value) {
            setState(() {
              _requestsPerMinute = value;
            });
          }, isRequired: true, defaultValue: 60, minValue: 1),
          _buildNumericField('Tokens Per Minute', _tokensPerMinute, (value) {
            setState(() {
              _tokensPerMinute = value;
            });
          }, isRequired: true, defaultValue: 1000, minValue: 1),

          // Optional Parameters Section
          const SizedBox(height: 16.0),

          // Advanced Optional Parameters
          const Text(
            'Advanced Options',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),

          const SizedBox(height: 8.0),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              _buildTextField('Organization ID', _organizationIdController),
              _buildSlider(
                  'Temperature',
                  _temperature,
                  (value) => setState(() {
                        _temperature = value;
                      }),
                  min: 0.0,
                  max: 2.0),
              _buildSlider(
                  'Top P',
                  _topP,
                  (value) => setState(() {
                        _topP = value;
                      }),
                  min: 0.0,
                  max: 1.0),
              _buildNumericField('Max Tokens', _maxTokens, (value) {
                setState(() {
                  _maxTokens = value;
                });
              }, defaultValue: 150, minValue: 1, maxValue: null),
              _buildSlider(
                  'Frequency Penalty',
                  _frequencyPenalty,
                  (value) => setState(() {
                        _frequencyPenalty = value;
                      }),
                  min: -2.0,
                  max: 2.0),
              _buildSlider(
                  'Presence Penalty',
                  _presencePenalty,
                  (value) => setState(() {
                        _presencePenalty = value;
                      }),
                  min: -2.0,
                  max: 2.0),
              // ... Add widgets for other optional parameters ...
              _buildTextField('Proxy URL', _proxyUrlController,
                  validator: (value) {
                // Add URL validation logic here (if needed)
                return null;
              }),
              _buildTextField('Proxy Username', _proxyUsernameController),
              _buildPasswordField('Proxy Password', _proxyPasswordController),
              _buildNumericField('Retry Count', _retryCount, (value) {
                setState(() {
                  _retryCount = value;
                });
              }, defaultValue: 3, minValue: 1),
            ],
          ),
        ],
      ),
    );
  }

  // Helper function to build a text field
  Widget _buildTextField(String label, TextEditingController controller,
      {bool isRequired = false, FormFieldValidator<String>? validator}) {
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

  // Helper function to build a password field
  Widget _buildPasswordField(String label, TextEditingController controller,
      {bool isRequired = false, FormFieldValidator<String>? validator}) {
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
          obscureText: true, // Mask the input for passwords
          validator: validator,
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  // Helper function to build a numeric field
  Widget _buildNumericField(
      String label, int value, ValueChanged<int> onChanged,
      {bool isRequired = false, int defaultValue = 0, int minValue = 0, int? maxValue}) {
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
        NumberFormBox(
          value: value,
          onChanged: (value) => onChanged(value!),
          placeholder: 'Enter $label',
          min: minValue,
          max: maxValue,
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