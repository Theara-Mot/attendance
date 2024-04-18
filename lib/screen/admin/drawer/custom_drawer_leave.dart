
import 'package:attendance/const/app_dimension.dart';
import 'package:attendance/screen/admin/drawer/custom_listtile.dart';
import 'package:attendance/screen/admin/drawer/header.dart';
import 'package:attendance/screen/admin/staff_management/staff_center.dart';
import 'package:attendance/screen/admin/staff_management/staff_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomDrawerLeave extends StatefulWidget {
  const CustomDrawerLeave({Key? key}) : super(key: key);

  @override
  State<CustomDrawerLeave> createState() => _CustomDrawerLeaveState();
}

class _CustomDrawerLeaveState extends State<CustomDrawerLeave> {
  bool _isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 500),
        width: _isCollapsed ? 300 : 70,
        margin: const EdgeInsets.only(bottom: 10, top: 10,left: 10,right: 10),
        decoration:const BoxDecoration(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDrawerHeader(isColapsed: _isCollapsed),
              const Divider(
                color: Colors.white,
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.store,
                title: 'attendance',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: StaffCenter(),
              ),
              const Divider(
                color: Colors.white,
              ),
              Text('to_check'.tr(),
                style: GoogleFonts.ubuntu(
                  fontSize: 18,
                  color: Colors.white,
                )
              ),
              SizedBox(height: AppDimension.height10),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.store,
                title: 'attendance_requested',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: StaffCenter(),
              ),
              const Divider(
                color: Colors.white,
              ),
              Text('setting'.tr(),
                style: GoogleFonts.ubuntu(
                  fontSize: 18,
                  color: Colors.white,
                )
              ),
              SizedBox(height: AppDimension.height10,),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.store,
                title: 'add_leave',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: StaffCenter(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.person_add_alt_outlined,
                title: 'add_shift',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: StaffCenter(),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.person_add_alt_outlined,
                title: 'add_time',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                route: StaffCenter(),
              ),
              //const Divider(color: Colors.white),
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