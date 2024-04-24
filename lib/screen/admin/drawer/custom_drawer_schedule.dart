
import 'package:attendance/screen/admin/drawer/custom_listtile.dart';
import 'package:attendance/screen/admin/drawer/header.dart';
import 'package:attendance/screen/admin/staff_management/staff_center.dart';
import 'package:attendance/screen/admin/staff_management/staff_list.dart';
import 'package:attendance/screen/admin/student_management/student_center.dart';
import 'package:attendance/screen/admin/student_management/student_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../student_management/register_student.dart';


class CustomDrawerSchedule extends StatefulWidget {
  const CustomDrawerSchedule({Key? key}) : super(key: key);

  @override
  State<CustomDrawerSchedule> createState() => _CustomDrawerScheduleState();
}

class _CustomDrawerScheduleState extends State<CustomDrawerSchedule> {
  bool _isCollapsed = true;
  Container textName(String name){
    return Container(
    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      child: Text(name,overflow: TextOverflow.ellipsis,style:GoogleFonts.notoSerifKhmer(color:Colors.white, fontSize:18)
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 500),
        width: _isCollapsed ? 300 : 70,
        margin: const EdgeInsets.only(bottom: 10, top: 10,left: 10,right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(3),
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(3),
          ),
          color:Color.fromARGB(255, 1, 39, 63),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDrawerHeader(isColapsed: _isCollapsed),
              const Divider(
                color: Colors.white,
              ),
              textName('leave_request'),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.person_outline,
                title: 'student',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: StudentCenter(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.person_pin_rounded,
                title: 'teacher',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: StudentList(),
              ),
              Spacer(),
              textName('absent'),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.person_outline,
                title: 'student',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: const StudentCenter(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.person_pin_rounded,
                title: 'teacher',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: const StudentList(),
              ),
              Spacer(),
              textName('abnormal_attendance'),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.person_outline,
                title: 'student',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: const StudentCenter(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.person_pin_rounded,
                title: 'teacher',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: const StudentList(),
              ),
              const Spacer(),
              Align(
                alignment: _isCollapsed
                    ? Alignment.bottomRight
                    : Alignment.bottomCenter,
                child: IconButton(
                  splashColor: Colors.transparent,
                  icon: Icon(
                    _isCollapsed
                        ? Icons.arrow_back_ios
                        : Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                  onPressed: () {
                    setState(() {
                      _isCollapsed = !_isCollapsed;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}