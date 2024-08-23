
class Provider {
  String displayName;
  String baseUrl;
  String apiType; // e.g., "OpenAI", "Google", etc.

  Provider({
    required this.displayName,
    required this.baseUrl,
    required this.apiType,
  });
}

enum APIProvider {
  openAI("OpenAI"),
  googleGenerativeAI("Google Generative AI"),
  googleVertex("Google Vertex"),
  claude("Claude"),
  deepl("DeepL");

  final String displayName;

  const APIProvider(this.displayName);
}