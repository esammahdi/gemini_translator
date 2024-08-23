import 'package:gemini_translator/shared/data/models/api_provider.dart';

class LLMModel {
  Provider provider;
  String displayName;
  String modelName;
  String apiKey;
  int requestsPerMinute;
  int tokensPerMinute; 

  LLMModel({
    required this.provider,
    required this.displayName,
    required this.modelName,
    required this.apiKey,
    required this.requestsPerMinute,
    required this.tokensPerMinute,
  });
}
