
import 'package:flutter_test/flutter_test.dart';
import 'package:ai_companion/models/chat_model.dart';

void main() {
  test('ChatModel serialization', () {
    final chat = ChatModel(
      senderId: '1',
      receiverId: '2',
      message: 'Hello, World!',
      timestamp: DateTime(2023, 1, 1, 12, 0, 0),
      isRead: true,
    );

    final json = chat.toJson();
    expect(json['senderId'], '1');
    expect(json['receiverId'], '2');
    expect(json['message'], 'Hello, World!');
    expect(json['timestamp'], '2023-01-01T12:00:00.000');
    expect(json['isRead'], true);

    final newChat = ChatModel.fromJson(json);
    expect(newChat.senderId, '1');
    expect(newChat.receiverId, '2');
    expect(newChat.message, 'Hello, World!');
    expect(newChat.timestamp, DateTime(2023, 1, 1, 12, 0, 0));
    expect(newChat.isRead, true);
  });
}
