class Time {
  int? id;
  String name;
  String? status;

  Time({this.id, required this.name, this.status});

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      id: json['id'],
      name: json['name'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'status': status,
    };
  }
}
