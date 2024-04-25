import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/app_color.dart';
import '../../../const/app_appBar.dart';

class LecturerAbsentList extends StatefulWidget {
  const LecturerAbsentList({super.key});

  @override
  _LecturerAbsentListState createState() => _LecturerAbsentListState();
}

class _LecturerAbsentListState extends State<LecturerAbsentList> {
  List<Map<String, dynamic>> data = [
    {'id':1,'name':'មុត សុធារ៉ា','gender':'Male','grade':'12 A1','duration':'3days','date':'01/01/2024 - 03/01/2024'},
    {'id':2,'name':'សេង ស៊ីម៉ង់','gender':'Male','grade':'12 A1','duration':'3days','date':'02/01/2024 - 04/01/2024'},
    {'id':3,'name':'ស៊ូ កូដីកា','gender':'Female','grade':'10 C','duration':'4days','date':'03/01/2024 - 05/01/2024'},
    {'id':4,'name':'មាស បូរ៉ា','gender':'Male','grade':'11 B2','duration':'5days','date':'04/01/2024 - 06/01/2024'},
    {'id':5,'name':'វិរិច សារុន','gender':'Female','grade':'10 C','duration':'6days','date':'05/01/2024 - 07/01/2024'},
    {'id':6,'name':'កាញារ៉ា បាន','gender':'Male','grade':'7 C','duration':'7days','date':'06/01/2024 - 08/01/2024'},
    {'id':7,'name':'ថនិកា ជ័យ','gender':'Female','grade':'7 A','duration':'8days','date':'07/01/2024 - 09/01/2024'},
    {'id':8,'name':'បាន សារិន','gender':'Male','grade':'7 B','duration':'9days','date':'08/01/2024 - 10/01/2024'},
    {'id':9,'name':'ស៊ុន ចំរើន','gender':'Male','grade':'7 C','duration':'10days','date':'09/01/2024 - 11/01/2024'},
    {'id':10,'name':'កែវ សុគន្ធា','gender':'Female','grade':'12 A2','duration':'11days','date':'10/01/2024 - 12/01/2024'},
    {'id':11,'name':'អ៊ុយ វិធីតា','gender':'Male','grade':'12 B2','duration':'12days','date':'11/01/2024 - 13/01/2024'},
    {'id':12,'name':'រស់ ខឿត','gender':'Male','grade':'11 A1','duration':'13days','date':'12/01/2024 - 14/01/2024'},
    {'id':13,'name':'សិរីវ តូតេត','gender':'Female','grade':'11 A1','duration':'14days','date':'13/01/2024 - 15/01/2024'},
    {'id':14,'name':'បូ វីហ្សា','gender':'Female','grade':'12 A3','duration':'15days','date':'14/01/2024 - 16/01/2024'},
    {'id':15,'name':'សាត វិច្ឆិកា','gender':'Male','grade':'12 A3','duration':'16days','date':'15/01/2024 - 17/01/2024'},
  ];

  @override
  Widget build(BuildContext context) {
    data.sort((a, b) => a['grade'].compareTo(b['grade']));
    Map<String, List<Map<String, dynamic>>> groupedStudents = {};
    print(data);
    // Group students by grade
    for (var student in data) {
      String grade = student['grade'];
      if (!groupedStudents.containsKey(grade)) {
        groupedStudents[grade] = [];
      }
      groupedStudents[grade]!.add(student);
    }

    return BuildAppBar(
      title: 'lecturer_absent_list',
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$grade',
                      style: GoogleFonts.notoSerifKhmer(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${students.length} ${'lecturers'.tr()}',
                      style: GoogleFonts.notoSerifKhmer(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
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
                '${student['gender']}',
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
