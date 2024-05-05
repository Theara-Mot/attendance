class Day {
  final int? id;
  final String name;
  final String status;

  Day({required this.id, required this.name, required this.status});

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      id: json['id']??null,
      name: json['name'],
      status: json['status'],
    );
  }
}