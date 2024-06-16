
import 'package:flutter/material.dart';

class HealthCheckCard extends StatelessWidget {
  final Map<String, dynamic> data;

  HealthCheckCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mood: ${data['mood']}', style: TextStyle(fontSize: 16.0)),
            Text('Stress Level: ${data['stressLevel']}', style: TextStyle(fontSize: 16.0)),
            Text('Notes: ${data['notes']}', style: TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
