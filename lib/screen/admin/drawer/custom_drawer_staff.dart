
import 'package:attendance/screen/admin/drawer/custom_listtile.dart';
import 'package:attendance/screen/admin/drawer/header.dart';
import 'package:attendance/screen/admin/staff_management/setting/department.dart';
import 'package:attendance/screen/admin/staff_management/setting/lecturer_level.dart';
import 'package:attendance/screen/admin/staff_management/staff_center.dart';
import 'package:attendance/screen/admin/staff_management/staff_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomDrawerStaff extends StatefulWidget {
  const CustomDrawerStaff({Key? key}) : super(key: key);

  @override
  State<CustomDrawerStaff> createState() => _CustomDrawerStaffState();
}

class _CustomDrawerStaffState extends State<CustomDrawerStaff> {
  bool _isCollapsed = true;
  static Container textName(String name){
    return Container(
      margin: EdgeInsets.only(top: 5,bottom: 5),
        width: double.infinity,
        child: Text(name,textAlign: TextAlign.start,style:GoogleFonts.notoSerifKhmer(color:Colors.white, fontSize:18)
        ));
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomDrawerHeader(isColapsed: _isCollapsed),
              const Divider(
                color: Colors.white,
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.store,
                title: 'staff_center',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: StaffCenter(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.list_alt,
                title: 'staff_list',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: StaffList(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.person_add_alt_outlined,
                title: 'create_staff',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: StaffList(),
              ),
              // const Divider(color: Colors.white),
              const Spacer(),
              textName('Setting'),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.date_range,
                title: 'Job Division',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: StaffList(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.date_range,
                title: 'lecturer_level',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: LecturerLevel(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.date_range,
                title: 'department',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: Department(),
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