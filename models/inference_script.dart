
import 'package:http/http.dart' as http;
import 'dart:convert';

class InferenceScript {
  final String apiKey;

  InferenceScript(this.apiKey);

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
