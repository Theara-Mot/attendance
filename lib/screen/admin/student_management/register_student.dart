import 'dart:convert';

import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../const/app_buildButton.dart';
import '../../../const/app_color.dart';
import '../../../const/build_input_card.dart';
import '../../../services/controller/student_controller.dart';
import 'package:http/http.dart' as http;
class RegisterStudent extends StatefulWidget {
  const RegisterStudent({Key? key}) : super(key: key);

  @override
  State<RegisterStudent> createState() => _RegisterStudentState();
}

class _RegisterStudentState extends State<RegisterStudent> {
  List<String> data = [
    'Input Khmer name',
    'Input English name',
    'Input gender',
    'Input ethnicity',
    'Input nationality',
    'Input religion',
    'Input date of birth',
    'Input phone number',
    'Input place of birth',
    'Input father\'s name',
    'Input father\'s job',
    'Input father\'s phone',
    'Input mother\'s name',
    'Input mother\'s job',
    'Input mother\'s phone',
    'Input residence',
    'Input join date',
    'Input grade',
  ];

  List<TextEditingController> controllers = [];
  StudentController studentController = StudentController('students');

  @override
  void initState() {
    super.initState();
    controllers = List.generate(data.length, (index) => TextEditingController());
  }

  List<String> getFilters() {
    List<String> filters = [];
    for (int i = 0; i < data.length; i++) {
      String filter = controllers[i].text ?? '';
      filters.add(filter);
    }
    return filters;
  }

  TextStyle style = GoogleFonts.notoSerifKhmer(fontSize: 15, fontWeight: FontWeight.w500, color: AppColor.primaryColor);

  Widget textContainer(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 5),
      child: Text(text, style: style),
    );
  }

  Future<void> registerStudent() async {
    List<String> filters = getFilters();
    Map<String, String> studentData = {
      'khmer_name': filters[0],
      'english_name': filters[1],
      'gender': filters[2],
      'ethnicity': filters[3],
      'nationality': filters[4],
      'religion': filters[5],
      'date_of_birth': filters[6],
      'phone_number': filters[7],
      'place_of_birth': filters[8],
      'father_name': filters[9],
      'father_job': filters[10],
      'father_phone': filters[11],
      'mother_name': filters[12],
      'mother_job': filters[13],
      'mother_phone': filters[14],
      'residence': filters[15],
      'join_date': filters[16],
      'grade': filters[17],
    };
    print(studentData);

    studentController.createStudent(studentData, context).then((student) {
      print(student); // Print the student data
    }).catchError((error) {
      print('Failed to register student: $error');
    });
    // final String apiUrl = 'http://192.168.0.101:1234/api/students'; // Replace with your API URL
    // final response = await http.post(
    //   Uri.parse(apiUrl),
    //   headers: {
    //     'Content-Type': 'application/json',
    //     'Authorization': 'Bearer 4|w7HjWit832DAHxt66LrsYIesGrpmjeew9IfhzL5144c5ebf7' // Replace with your token
    //   },
    //   body: jsonEncode(studentData),
    // );

    // if (response.statusCode == 201) {
    //   final responseData = jsonDecode(response.body);
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Student created successfully')));
    //   print(responseData);
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to create student')));
    //   print(response.body);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
      title: 'register_student',
      bodyWidget: SingleChildScrollView(
        padding: EdgeInsets.only(left: 8, right: 8, bottom: 10),
        child: Column(
          children: [
            for (int i = 0; i < data.length; i++)
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (i == 0) textContainer('Student Information'),
                  if (i == 9) textContainer('Father Information'),
                  if (i == 12) textContainer('Mother Information'),
                  if (i == 15) textContainer('Residence'),
                  BuildInputCard(controller: controllers[i], hint: data[i]),
                ],
              ),
            SizedBox(height: 10),
            BuildButton(
              borderRadius: 10,
              text: 'submit',
              function: registerStudent,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
