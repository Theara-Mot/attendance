class Student {
  final int? id;
  final String khmer_name;
  final String english_name;
  final String gender;
  final String ethnicity;
  final String nationality;
  final String religion;
  final String date_of_birth;
  final String phone_number;
  final String place_of_birth;
  final String father_name;
  final String father_job;
  final String father_phone;
  final String mother_name;
  final String mother_job;
  final String mother_phone;
  final String residence;
  final String join_date;
  final String grade;
  final String created_at;
  late final String is_taken;
  Student({
    this.id,
    required this.khmer_name,
    required this.english_name,
    required this.gender,
    required this.ethnicity,
    required this.nationality,
    required this.religion,
    required this.date_of_birth,
    required this.phone_number,
    required this.place_of_birth,
    required this.father_name,
    required this.father_job,
    required this.father_phone,
    required this.mother_name,
    required this.mother_job,
    required this.mother_phone,
    required this.residence,
    required this.join_date,
    required this.grade,
    required this.is_taken,
    required this.created_at
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] ?? null,
      khmer_name: json['khmer_name'],
      english_name: json['english_name'],
      gender: json['gender'],
      ethnicity: json['ethnicity'],
      nationality: json['nationality'],
      religion: json['religion'],
      date_of_birth: json['date_of_birth'],
      phone_number: json['phone_number'],
      place_of_birth: json['place_of_birth'],
      father_name: json['father_name'],
      father_job: json['father_job'],
      father_phone: json['father_phone'],
      mother_name: json['mother_name'],
      mother_job: json['mother_job'],
      mother_phone: json['mother_phone'],
      residence: json['residence'],
      join_date: json['join_date'],
      grade: json['grade'],
      created_at: json['created_at'],
      is_taken: json['is_taken']
    );
  }

  @override
  String toString() {
    return '''
    Student {
      id: $id,
      khmer_name: $khmer_name,
      english_name: $english_name,
      gender: $gender,
      ethnicity: $ethnicity,
      nationality: $nationality,
      religion: $religion,
      date_of_birth: $date_of_birth,
      phone_number: $phone_number,
      place_of_birth: $place_of_birth,
      father_name: $father_name,
      father_job: $father_job,
      father_phone: $father_phone,
      mother_name: $mother_name,
      mother_job: $mother_job,
      mother_phone: $mother_phone,
      residence: $residence,
      join_date: $join_date,
      grade: $grade,
      created_at: $created_at,
      is_taken: $is_taken
    }
    ''';
  }
}
