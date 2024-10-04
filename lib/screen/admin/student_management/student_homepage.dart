import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/screen/admin/class_management/class_detail.dart';
import 'package:attendance/screen/admin/drawer/custom_drawer_leave.dart';
import 'package:attendance/screen/admin/drawer/custom_drawer_student.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../const/app_dimension.dart';
import '../../both_use.dart/about.dart';
import '../../both_use.dart/director.dart';
import '../../both_use.dart/main_degree.dart';
import '../../both_use.dart/news.dart';
import '../../both_use.dart/social_media.dart';
import '../../both_use.dart/top_student.dart';

import '../../../../services/controller/day_controller.dart';
import '../../../../services/model/day_model.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> with SingleTickerProviderStateMixin {
  DayController dayController = DayController('class');
  List<Map<String, dynamic>> classData = [];
  int currentIndex = -1;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    fetchClassData();
  }

  Future<void> fetchClassData() async {
    try {
      List<Day> fetchedData = await dayController.fetchDays();
      Map<String, List<Map<String, dynamic>>> groupedData = {};

      // Grouping data by class name and including the ID
      for (var day in fetchedData) {
        String className = day.name.split(' ')[0];
        String grade = day.name.split(' ')[1];

        if (!groupedData.containsKey(className)) {
          groupedData[className] = [];
        }
        groupedData[className]!.add({'grade': grade, 'id': day.id});
      }

      // Sorting the grades within each class
      groupedData.forEach((className, grades) {
        grades.sort((a, b) => a['grade'].compareTo(b['grade']));
      });

      // Sorting the classes by their numeric part
      List<MapEntry<String, List<Map<String, dynamic>>>> sortedEntries = groupedData.entries.toList();
      sortedEntries.sort((a, b) {
        int aNumber = int.parse(a.key);
        int bNumber = int.parse(b.key);
        return aNumber.compareTo(bNumber);
      });

      // Converting grouped data to a suitable format for the UI
      setState(() {
        classData = sortedEntries.map((entry) {
          return {'name': entry.key, 'grades': entry.value, 'visible': false};
        }).toList();
      });
    } catch (e) {
      print('Error fetching class data: $e');
    }
  }

  Future<void> _handleRefresh() async {
    setState(() {
      fetchClassData();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.sort, color: Colors.white),
          ),
        ),
        title: Text(
          'student_management'.tr(),
          style: GoogleFonts.ubuntu(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      drawer: const CustomDrawerStudent(),
      body: classData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: _handleRefresh,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: classData.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        classData[index]['visible'] = !classData[index]['visible'];
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5, top: 5),
                      width: double.infinity,
                      height: 50,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: classData[index]['visible'] ? AppColor.primaryColor : Colors.white,
                        boxShadow: [
                          if (classData[index]['visible'])
                            BoxShadow(
                              color: AppColor.primaryColor,
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 0),
                            ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColor.primaryColor.withOpacity(0.3),
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/static_images/degree.json',
                            width: 70,
                            height: 100,
                            repeat: false,
                          ),
                          SizedBox(height: AppDimension.height10 / 2),
                          Expanded(
                            child: Text(
                              'Grade ${classData[index]['name'].toString().tr()}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.notoSerifKhmer(
                                fontSize: AppDimension.font15,
                                fontWeight: FontWeight.w500,
                                color: classData[index]['visible'] ? Colors.white : Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (classData[index]['visible'])
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: classData[index]['grades'].length,
                      itemBuilder: (context, subIndex) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 3, left: 10, right: 10),
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.primaryColor,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(builder: (BuildContext context) {
                                    return ClassDetail(
                                      name: '${classData[index]['name']}'.tr() + ' ${classData[index]['grades'][subIndex]['grade']}'.tr(),
                                      id: classData[index]['grades'][subIndex]['id'],
                                    );
                                  }),
                                );
                              },
                              splashColor: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 8),
                                margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
                                width: double.infinity,
                                height: 35,
                                child: Text(
                                  '${classData[index]['name']}'.tr() + ' ${classData[index]['grades'][subIndex]['grade']}',
                                  style: GoogleFonts.notoSerifKhmer(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
