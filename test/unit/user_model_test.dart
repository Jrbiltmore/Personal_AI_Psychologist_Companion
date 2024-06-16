
import 'package:flutter_test/flutter_test.dart';
import 'package:ai_companion/models/user_model.dart';

void main() {
  test('UserModel serialization', () {
    final user = UserModel(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      avatarUrl: 'http://example.com/avatar.jpg',
      phoneNumber: '1234567890',
      dateOfBirth: DateTime(2000, 1, 1),
      address: '123 Main St',
    );

    final json = user.toJson();
    expect(json['id'], '1');
    expect(json['name'], 'John Doe');
    expect(json['email'], 'john.doe@example.com');
    expect(json['avatarUrl'], 'http://example.com/avatar.jpg');

    final newUser = UserModel.fromJson(json);
    expect(newUser.id, '1');
    expect(newUser.name, 'John Doe');
    expect(newUser.email, 'john.doe@example.com');
    expect(newUser.avatarUrl, 'http://example.com/avatar.jpg');
  });
}
