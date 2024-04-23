import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
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

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  List<Map<String, dynamic>>  data=[];
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    data = [
      {
        'icon': 'degree',
        'name': 'grade_7',
        'page':const News()
      },
      {
        'icon': 'top_student',
        'name': 'grade_8',
        'page':const MainDegree()
      },
      {
        'icon': 'social_media',
        'name': 'grade_9',
        'page':const SocialMedia()
      },
      {
        'icon': 'top_student',
        'name':'grade_10',
        'page':TopStudent()
      },
      {
        'icon': 'social_media',
        'name': 'grade_11',
        'page':const AboutSchool()
      },
      {
        'icon': 'top_student',
        'name': 'grade_12',
        'page':const Director()
      }];
    List<String> grade = [
      'A','B','C','D','E','F'
    ];

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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5, top: 5),
                    width: double.infinity,
                    height: 50,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color:index == currentIndex ?AppColor.primaryColor: Colors.white,
                      boxShadow: [
                        if (index == currentIndex )
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
                          'assets/static_images/${data[index]['icon']}.json',
                          width: 70,
                          height: 100,
                          repeat: false,
                        ),
                        SizedBox(height: AppDimension.height10 / 2),
                        Expanded(
                          child: Text(
                            data[index]['name'].toString().tr(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSerifKhmer(
                              fontSize: AppDimension.font15,
                              fontWeight: FontWeight.w500,
                              color:index == currentIndex ?Colors.white: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (index == currentIndex)
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: grade.length,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
                        width: double.infinity,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.primaryColor,
                        ),
                        child: Text(
                          '${data[currentIndex]['name']}'.tr() + '${grade[index]}',
                          style: GoogleFonts.notoSerifKhmer(color:Colors.white),
                        ),
                      );
                    },
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}