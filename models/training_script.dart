
import 'package:http/http.dart' as http;
import 'dart:convert';

class TrainingScript {
  final String apiKey;

  TrainingScript(this.apiKey);

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
}
