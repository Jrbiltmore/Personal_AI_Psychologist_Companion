
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class DataCollection {
  final String apiKey;

  DataCollection(this.apiKey);

  Future<void> collectData(String prompt, String filePath) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'text-davinci-002',
        'prompt': prompt,
        'max_tokens': 100,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final text = data['choices'][0]['text'];

      final file = File(filePath);
      await file.writeAsString(text, mode: FileMode.append);
    } else {
      throw Exception('Failed to collect data');
    }
  }
}
