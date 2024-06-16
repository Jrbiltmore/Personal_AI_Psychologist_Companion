
import 'package:http/http.dart' as http;
import 'dart:convert';

class AIService {
  Future<String> generateResponse(String message) async {
    final response = await http.post(
      Uri.parse('https://api.example.com/generate-response'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': message}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['response'];
    } else {
      throw Exception('Failed to generate response');
    }
  }

  Future<Map<String, dynamic>> conductHealthCheck(String userId) async {
    final response = await http.post(
      Uri.parse('https://api.example.com/conduct-health-check'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': userId}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to conduct health check');
    }
  }
}
