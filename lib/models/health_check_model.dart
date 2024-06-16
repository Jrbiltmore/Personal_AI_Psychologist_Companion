
class HealthCheckModel {
  final String userId;
  final DateTime checkDate;
  final String mood;
  final int stressLevel;
  final String notes;

  HealthCheckModel({
    required this.userId,
    required this.checkDate,
    required this.mood,
    required this.stressLevel,
    required this.notes,
  });

  factory HealthCheckModel.fromJson(Map<String, dynamic> json) {
    return HealthCheckModel(
      userId: json['userId'],
      checkDate: DateTime.parse(json['checkDate']),
      mood: json['mood'],
      stressLevel: json['stressLevel'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'checkDate': checkDate.toIso8601String(),
      'mood': mood,
      'stressLevel': stressLevel,
      'notes': notes,
    };
  }
}
