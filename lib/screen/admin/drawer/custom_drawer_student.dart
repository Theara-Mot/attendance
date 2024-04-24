
import 'package:attendance/screen/admin/drawer/custom_listtile.dart';
import 'package:attendance/screen/admin/drawer/header.dart';
import 'package:attendance/screen/admin/scehedule_management/add_shift.dart';
import 'package:attendance/screen/admin/scehedule_management/add_time.dart';
import 'package:attendance/screen/admin/staff_management/staff_center.dart';
import 'package:attendance/screen/admin/staff_management/staff_list.dart';
import 'package:attendance/screen/admin/student_management/setting/add_class.dart';
import 'package:attendance/screen/admin/student_management/setting/add_day.dart';
import 'package:attendance/screen/admin/student_management/setting/add_year.dart';
import 'package:attendance/screen/admin/student_management/setting/days.dart';
import 'package:attendance/screen/admin/student_management/setting/shift.dart';
import 'package:attendance/screen/admin/student_management/setting/times.dart';
import 'package:attendance/screen/admin/student_management/setting/years.dart';
import 'package:attendance/screen/admin/student_management/student_center.dart';
import 'package:attendance/screen/admin/student_management/student_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../student_management/register_student.dart';
import '../student_management/setting/classes.dart';


class CustomDrawerStudent extends StatefulWidget {
  const CustomDrawerStudent({Key? key}) : super(key: key);

  @override
  State<CustomDrawerStudent> createState() => _CustomDrawerStudentState();
}

class _CustomDrawerStudentState extends State<CustomDrawerStudent> {
  bool _isCollapsed = true;
  Text textName(String name){
    return Text(name,overflow: TextOverflow.ellipsis,style:GoogleFonts.notoSerifKhmer(color:Colors.white, fontSize:18)
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDrawerHeader(isColapsed: _isCollapsed),
              const Divider(
                color: Colors.white,
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.store,
                title: 'student_center',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: StudentCenter(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.list_alt,
                title: 'student_list',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: StudentList(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.person_add_alt_outlined,
                title: 'register_student',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: const RegisterStudent(),
              ),
              //const Divider(color: Colors.white),
              const Spacer(),
              textName('setting'),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.date_range,
                title: 'class_division',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: const Years(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.date_range,
                title: 'year',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: const Years(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.home,
                title: 'classes',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: const Classes(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.timelapse_outlined,
                title: 'time',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: const Times(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.filter_tilt_shift_outlined,
                title: 'shift',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: const Shift(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.view_day_sharp,
                title: 'day',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: const Days(),
              ),
              const Spacer(),
              // BottomUserInfo(isCollapsed: _isCollapsed),
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