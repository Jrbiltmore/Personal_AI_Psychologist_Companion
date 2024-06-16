
import 'package:http/http.dart' as http;
import 'dart:convert';

class StatisticsService {
  final String apiUrl = 'https://api.example.com/statistics';

  Future<void> reportStatistics(Map<String, dynamic> statistics) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(statistics),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to report statistics');
    }
  }

  Future<Map<String, dynamic>> getFeedback() async {
    final response = await http.get(Uri.parse('$apiUrl/feedback'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get feedback');
    }
  }
}
