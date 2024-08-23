enum GeminiModel {
  pro("Gemini 1.5 Pro", "gemini-1.5-pro"),
  flash("Gemini 1.5 Flash", "gemini-1.5-flash");

  final String displayName;
  final String modelName;

  const GeminiModel(this.displayName, this.modelName);
}

class GoogleGenerativeAIConfig {
  GeminiModel model; // Use the GeminiModel enum
  double temperature;
  int maxOutputTokens;

  GoogleGenerativeAIConfig({
    required this.model,
    required this.temperature,
    required this.maxOutputTokens,
  });

  // Method to convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'model': model.modelName, // Store the modelName from the enum
      'temperature': temperature,
      'maxOutputTokens': maxOutputTokens,
    };
  }

  // Factory constructor to create an object from a JSON map
  factory GoogleGenerativeAIConfig.fromJson(Map<String, dynamic> json) {
    // Get the GeminiModel from the modelName
    final model = GeminiModel.values.firstWhere(
      (element) => element.modelName == json['model'],
      orElse: () => GeminiModel.pro, // Default to GeminiModel.pro if not found
    );

    return GoogleGenerativeAIConfig(
      model: model,
      temperature: json['temperature'],
      maxOutputTokens: json['maxOutputTokens'],
    );
  }
}
