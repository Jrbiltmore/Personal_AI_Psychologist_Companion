
class UserModel {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String phoneNumber;
  final DateTime dateOfBirth;
  final String address;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatarUrl: json['avatarUrl'],
      phoneNumber: json['phoneNumber'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'address': address,
    };
  }
}
