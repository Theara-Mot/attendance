import 'package:attendance/const/app_dimension.dart';
import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_font.dart';
import 'package:attendance/provider/provider.dart';
import 'package:attendance/screen/admin/staff_management/staff_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../const/app_color.dart';
import '../../../services/controller/student_controller.dart';
import '../../../services/model/student_model.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  List<Student> studentList = [];
  List<Student> filteredStudentList = [];
  List<String> grades = [];
  String selectedGrade = '';
  int selectedYear = DateTime.now().year;
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
        filterStudents();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Failed to load students: $e');
    }
  }

  void filterStudents() {
    setState(() {
      filteredStudentList = studentList.where((student) {
        DateTime createdAt = DateTime.parse(student.created_at);
        return (selectedGrade.isEmpty || student.grade == selectedGrade) &&
            createdAt.year == selectedYear;
      }).toList();
      grades = filteredStudentList.map((student) => student.grade).toSet().toList();
      grades.sort((a, b) {
        // Extract numeric part
        var numA = int.tryParse(a.replaceAll(RegExp(r'[^0-9]'), ''));
        var numB = int.tryParse(b.replaceAll(RegExp(r'[^0-9]'), ''));
        if (numA != null && numB != null) {
          if (numA == numB) {
            // Sort lexicographically ignoring case if numbers are the same
            return a.toLowerCase().compareTo(b.toLowerCase());
          }
          return numA.compareTo(numB);
        } else if (numA != null) {
          return -1; // numA is a number and should come first
        } else if (numB != null) {
          return 1; // numB is a number and should come first
        } else {
          // Sort lexicographically ignoring case if both are non-numeric
          return a.toLowerCase().compareTo(b.toLowerCase());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    int totalStudents = filteredStudentList.length;
    int maleCount = filteredStudentList.where((student) => student.gender == 'Male').length;
    int femaleCount = filteredStudentList.where((student) => student.gender == 'Female').length;

    return BuildAppBar(
      title: 'student_list',
      bodyWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                PopupMenuButton<int>(
                  initialValue: DateTime.now().year,
                  onSelected: (int value) {
                    setState(() {
                      selectedYear = value;
                      selectedGrade = ''; // Reset selected grade when changing year
                      filterStudents();
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    return List.generate(5, (index) {
                      return PopupMenuItem<int>(
                        value: DateTime.now().year - index,
                        child: Text((DateTime.now().year - index).toString()),
                      );
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      selectedYear.toString(),
                      style: GoogleFonts.ubuntu(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 35,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: grades.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGrade = grades[index];
                                filterStudents();
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: selectedGrade == grades[index]
                                    ? AppColor.primaryColor
                                    : Colors.grey[300]!,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                grades[index].tr(),
                                style: TextStyle(
                                  color: selectedGrade == grades[index]
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            grades.isNotEmpty?Container(
              padding: EdgeInsets.all(AppDimension.height10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppDimension.radius8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Total Student', style: AppFont.largBold()),
                      SizedBox(height: AppDimension.height10),
                      Text('Male', style: AppFont.largBold()),
                      SizedBox(height: AppDimension.height10),
                      Text('Female', style: AppFont.largBold()),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(totalStudents.toString(), style: AppFont.largBold()),
                      SizedBox(height: AppDimension.height10),
                      Text(maleCount.toString(), style: AppFont.largBold()),
                      SizedBox(height: AppDimension.height10),
                      Text(femaleCount.toString(), style: AppFont.largBold()),
                    ],
                  )
                ],
              ),
            ):Container(),
            SizedBox(height: AppDimension.height10),
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                itemCount: filteredStudentList.length,
                itemBuilder: (context, index) {
                  final student = filteredStudentList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return StaffDetail(staff: student);
                          },
                        ),
                      );
                    },
                    child: Container(
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
                                languageProvider.currentLocale ==
                                    const Locale('km', 'KM')
                                    ? student.khmer_name
                                    : student.english_name,
                                style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${student.id} - ${student.gender}',
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
