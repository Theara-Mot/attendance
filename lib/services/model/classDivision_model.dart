import 'dart:convert';

class ClassDivision {
  final int id;
  final int classId;
  final int yearId;
  final List<int> days;
  final List<int> students;

  ClassDivision({
    required this.id,
    required this.classId,
    required this.yearId,
    required this.days,
    required this.students,
  });

  factory ClassDivision.fromJson(Map<String, dynamic> json) {
    return ClassDivision(
      id: json['id'],
      classId: json['class_id'],
      yearId: json['year_id'],
      days: List<int>.from(json['days']),
      students: List<int>.from(json['students']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'class_id': classId,
      'year_id': yearId,
      'days': days,
      'students': students,
    };
  }
}
