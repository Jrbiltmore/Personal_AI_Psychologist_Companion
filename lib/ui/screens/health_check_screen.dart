
import 'package:flutter/material.dart';
import '../widgets/health_check_card.dart';
import '../../services/ai_service.dart';

class HealthCheckScreen extends StatefulWidget {
  @override
  _HealthCheckScreenState createState() => _HealthCheckScreenState();
}

class _HealthCheckScreenState extends State<HealthCheckScreen> {
  final AIService _aiService = AIService();
  Map<String, dynamic>? _healthCheckData;

  void _conductHealthCheck() async {
    final data = await _aiService.conductHealthCheck("user123");
    setState(() {
      _healthCheckData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Check'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_healthCheckData != null)
              HealthCheckCard(data: _healthCheckData!),
            ElevatedButton(
              onPressed: _conductHealthCheck,
              child: Text('Conduct Health Check'),
            ),
          ],
        ),
      ),
    );
  }
}
