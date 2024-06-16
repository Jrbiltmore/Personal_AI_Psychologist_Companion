
import 'package:flutter_test/flutter_test.dart';
import 'package:ai_companion/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('HomeScreen has buttons', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    expect(find.text('Chat with AI'), findsOneWidget);
    expect(find.text('Health Check'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });
}
