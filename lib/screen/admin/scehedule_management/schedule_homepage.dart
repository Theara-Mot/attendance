import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/screen/admin/drawer/custom_drawer_leave.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleHomePage extends StatefulWidget {
  const ScheduleHomePage({super.key});

  @override
  State<ScheduleHomePage> createState() => _ScheduleHomePageState();
}

class _ScheduleHomePageState extends State<ScheduleHomePage> {
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
          'schedule_management'.tr(),
          style: GoogleFonts.ubuntu(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      drawer: const CustomDrawerLeave(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(),
      ),
    );
  }
}