import 'package:attendance/const/app_buildButton.dart';
import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_snackbar.dart';
import 'package:attendance/const/app_variable.dart';
import 'package:attendance/provider/provider.dart';
import 'package:attendance/services/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../const/app_color.dart';
import '../../../services/controller/day_controller.dart';
import '../../../services/controller/student_controller.dart';
import '../../../services/model/day_model.dart';

class AddStudentToClass extends StatefulWidget {
  final int classDivisionId;

  const AddStudentToClass({Key? key, required this.classDivisionId}) : super(key: key);

  @override
  State<AddStudentToClass> createState() => _AddStudentToClassState();
}

class _AddStudentToClassState extends State<AddStudentToClass> {
  List<Student> studentList = [];
  Set<int> selectedIndices = Set<int>();
  DayController dayController = DayController('days');
  late Future<List<Day>> _daysFuture;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    StudentController studentController = StudentController('students');
    try {
      List<Student> students = await studentController.fetchStudents();
      setState(() {
        studentList = students;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Failed to load students: $e');
    }
  }

  Future<void> _submitForm() async {
    final selectedStudentIds = selectedIndices
        .map((index) => studentList[index].id)
        .where((id) => id != null)
        .cast<int>()
        .toList();

    final response = await http.post(
      Uri.parse('${GlobalVariable.APP_URL}/class-divisions'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer 6|QibaJIQWbas8s271Qkpvsehy49jHoOu667iq9JoS3bc2fb57',
      },
      body: json.encode({
        'class_id': widget.classDivisionId,
        'year_id': 2,
        'days': [1,2,3,4,5],
        'students': selectedStudentIds,
      }),
    );

    if (response.statusCode == 201) {
      final responseBody = json.decode(response.body);
      for (int id in selectedStudentIds) {
        _updateStudentStatus(id, 'true');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Class Division created successfully: ${responseBody['id']}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to create Class Division: ${response.body}')),
      );
    }
  }

  void _updateStudentStatus(int id, String status) {
    setState(() {
      studentList = studentList.map((student) {
        if (student.id == id) {
          student.is_taken = status;
        }
        return student;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return BuildAppBar(
      title: 'Student List',
      bodyWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView.builder(
                  itemCount: studentList.length,
                  itemBuilder: (context, index) {
                    final student = studentList[index];
                    bool isSelected = selectedIndices.contains(student.id);
                    String isTaken = student.is_taken;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedIndices.remove(student.id);
                          } else {
                            selectedIndices.add(student.id!);
                          }
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 5.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColor.primaryColor
                              : (isTaken == 'true' ? Colors.green : Colors.white),
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
                                  languageProvider.currentLocale == const Locale('km', 'KM')
                                      ? student.khmer_name
                                      : student.english_name,
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.bold,
                                    color: isSelected ? Colors.white : Colors.black,
                                  ),
                                ),
                                Text(
                                  '${student.id} - ${student.gender}',
                                  style: GoogleFonts.ubuntu(
                                    color: isSelected ? Colors.white : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                              color: isSelected ? Colors.white : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              BuildButton(
                text: 'Submit',
                function: () {
                  if (selectedIndices.isNotEmpty) {
                    _submitForm();
                  } else {
                    BuildSnackbar.showSnackbar(context, 'No student is added');
                  }
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
