
import 'package:http/http.dart' as http;
import 'dart:convert';

class ModelTrainingService {
  final String apiKey;

  ModelTrainingService(this.apiKey);

  Future<void> trainModel(String datasetPath) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/models'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'dataset': datasetPath,
        'model_type': 'multimodal',
      }),
    );

    if (response.statusCode == 200) {
      // Handle successful training
    } else {
      throw Exception('Failed to train model');
    }
  }

  Future<String> runInference(String modelId, String input) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': modelId,
        'prompt': input,
        'max_tokens': 100,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['text'];
    } else {
      throw Exception('Failed to run inference');
    }
  }
}
