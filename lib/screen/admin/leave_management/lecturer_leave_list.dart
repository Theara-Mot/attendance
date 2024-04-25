import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/app_color.dart';
import '../../../const/app_appBar.dart';

class LecturerLeaveList extends StatefulWidget {
  const LecturerLeaveList({Key? key}) : super(key: key);

  @override
  _LecturerLeaveListState createState() => _LecturerLeaveListState();
}

class _LecturerLeaveListState extends State<LecturerLeaveList> {
  List<Map<String, dynamic>> lecturerList = [
    {
      'id': 1,
      'name': 'មុត សុធារ៉ា',
      'gender': 'Male',
      'grade': 'High School',
      'duration': '3days',
      'date': '01/01/2024 - 03/01/2024',
      'department': 'English',
    },
    {
      'id': 2,
      'name': 'សេង ស៊ីម៉ង់',
      'gender': 'Male',
      'grade': 'Primary',
      'duration': '2days',
      'date': '02/01/2024 - 04/01/2024',
      'department': 'Mathematics',
    },
    {
      'id': 3,
      'name': 'ស៊ូ កូដីកា',
      'gender': 'Female',
      'grade': 'High School',
      'duration': '3days',
      'date': '03/01/2024 - 05/01/2024',
      'department': 'Physics',
    },
    {
      'id': 4,
      'name': 'មាស បូរ៉ា',
      'gender': 'Male',
      'grade': 'Primary',
      'duration': '2days',
      'date': '04/01/2024 - 06/01/2024',
      'department': 'Chemistry',
    },
    {
      'id': 5,
      'name': 'វិរិច សារុន',
      'gender': 'Female',
      'grade': 'High School',
      'duration': '3days',
      'date': '05/01/2024 - 07/01/2024',
      'department': 'Biology',
    },
    {
      'id': 6,
      'name': 'កាញារ៉ា បាន',
      'gender': 'Male',
      'grade': 'Primary',
      'duration': '2days',
      'date': '06/01/2024 - 08/01/2024',
      'department': 'Geography',
    },
    {
      'id': 7,
      'name': 'ថនិកា ជ័យ',
      'gender': 'Female',
      'grade': 'High School',
      'duration': '3days',
      'date': '07/01/2024 - 09/01/2024',
      'department': 'History',
    },
    {
      'id': 8,
      'name': 'បាន សារិន',
      'gender': 'Male',
      'grade': 'Primary',
      'duration': '2days',
      'date': '08/01/2024 - 10/01/2024',
      'department': 'Literature',
    },
    {
      'id': 9,
      'name': 'ស៊ុន ចំរើន',
      'gender': 'Male',
      'grade': 'High School',
      'duration': '3days',
      'date': '09/01/2024 - 11/01/2024',
      'department': 'Music',
    },
    {
      'id': 10,
      'name': 'កែវ សុគន្ធា',
      'gender': 'Female',
      'grade': 'Primary',
      'duration': '2days',
      'date': '10/01/2024 - 12/01/2024',
      'department': 'Art',
    },
    {
      'id': 11,
      'name': 'អ៊ុយ វិធីតា',
      'gender': 'Male',
      'grade': 'High School',
      'duration': '3days',
      'date': '11/01/2024 - 13/01/2024',
      'department': 'Physical Education',
    },
    {
      'id': 12,
      'name': 'រស់ ខឿត',
      'gender': 'Male',
      'grade': 'Primary',
      'duration': '2days',
      'date': '12/01/2024 - 14/01/2024',
      'department': 'Dance',
    },
    {
      'id': 14,
      'name': 'បូ វីហ្សា',
      'gender': 'Female',
      'grade': 'Primary',
      'duration': '2days',
      'date': '14/01/2024 - 16/01/2024',
      'department': 'Science',
    },
    {
      'id': 15,
      'name': 'សាត វិច្ឆិកា',
      'gender': 'Male',
      'grade': 'High School',
      'duration': '3days',
      'date': '15/01/2024 - 17/01/2024',
      'department': 'Computer Science',
    },
  ];


  @override
  Widget build(BuildContext context) {
    Map<String, List<Map<String, dynamic>>> groupedStudents = {};

    // Group students by grade
    for (var student in lecturerList) {
      String grade = student['grade'];
      if (!groupedStudents.containsKey(grade)) {
        groupedStudents[grade] = [];
      }
      groupedStudents[grade]!.add(student);
    }

    return BuildAppBar(
      title: 'lecturer_leave_list',
      bodyWidget: ListView.builder(
        padding: EdgeInsets.all(9),
        itemCount: groupedStudents.length,
        itemBuilder: (context, index) {
          String grade = groupedStudents.keys.elementAt(index);
          List<Map<String, dynamic>> students = groupedStudents[grade]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 5.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Grade $grade',
                  style: GoogleFonts.notoSerifKhmer(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              // Display each student in the grade
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return buildListTile(students[index]);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildListTile(Map<String, dynamic> student) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/static_images/s_logo.jpg'),
          ),
          const SizedBox(width: 15.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                student['name'],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 3),
              Text(
                '${student['duration']} ( ${student['date']} )',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Colors.grey)
        ],
      ),
    );
  }
}
