class OpenAIModelConfig {
  String baseUrl;
  String apiKey;
  String modelName;
  int requestsPerMinute;
  int tokensPerMinute;
  String? organizationId;
  String? systemPrompt; // Example optional field
  double temperature;
  double topP;
  int maxTokens;
  double frequencyPenalty;
  double presencePenalty;
  List<String>? stopSequences; // Example optional field
  Map<String, double>? logitBias; // Example optional field
  Duration? timeout;
  int? retryCount;
  Map<String, String>? customHeaders; // Example optional field
  String? proxyUrl;
  String? proxyUsername;
  String? proxyPassword;

  OpenAIModelConfig({
    required this.baseUrl,
    required this.apiKey,
    required this.modelName,
    required this.requestsPerMinute,
    required this.tokensPerMinute,
    this.organizationId,
    this.systemPrompt,
    required this.temperature,
    required this.topP,
    required this.maxTokens,
    required this.frequencyPenalty,
    required this.presencePenalty,
    this.stopSequences,
    this.logitBias,
    this.timeout,
    this.retryCount,
    this.customHeaders,
    this.proxyUrl,
    this.proxyUsername,
    this.proxyPassword,
  });

  // Method to convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'baseUrl': baseUrl,
      'apiKey': apiKey,
      'modelName': modelName,
      'requestsPerMinute': requestsPerMinute,
      'tokensPerMinute': tokensPerMinute,
      'organizationId': organizationId,
      'systemPrompt': systemPrompt,
      'temperature': temperature,
      'topP': topP,
      'maxTokens': maxTokens,
      'frequencyPenalty': frequencyPenalty,
      'presencePenalty': presencePenalty,
      'stopSequences': stopSequences,
      'logitBias': logitBias,
      'timeout': timeout?.inMilliseconds, // Store timeout as milliseconds
      'retryCount': retryCount,
      'customHeaders': customHeaders,
      'proxyUrl': proxyUrl,
      'proxyUsername': proxyUsername,
      'proxyPassword': proxyPassword,
    };
  }

  // Factory constructor to create an object from a JSON map
  factory OpenAIModelConfig.fromJson(Map<String, dynamic> json) {
    return OpenAIModelConfig(
      baseUrl: json['baseUrl'],
      apiKey: json['apiKey'],
      modelName: json['modelName'],
      requestsPerMinute: json['requestsPerMinute'],
      tokensPerMinute: json['tokensPerMinute'],
      organizationId: json['organizationId'],
      systemPrompt: json['systemPrompt'],
      temperature: json['temperature'],
      topP: json['topP'],
      maxTokens: json['maxTokens'],
      frequencyPenalty: json['frequencyPenalty'],
      presencePenalty: json['presencePenalty'],
      stopSequences: json['stopSequences'] != null ? List<String>.from(json['stopSequences']) : null,
      logitBias: json['logitBias'] != null ? Map<String, double>.from(json['logitBias']) : null,
      timeout: json['timeout'] != null ? Duration(milliseconds: json['timeout']) : null, // Convert milliseconds back to Duration
      retryCount: json['retryCount'],
      customHeaders: json['customHeaders'] != null ? Map<String, String>.from(json['customHeaders']) : null,
      proxyUrl: json['proxyUrl'],
      proxyUsername: json['proxyUsername'],
      proxyPassword: json['proxyPassword'],
    );
  }
}