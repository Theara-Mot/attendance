import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';

class AttendanceRequested extends StatefulWidget {
  const AttendanceRequested({super.key});

  @override
  State<AttendanceRequested> createState() => _AttendanceRequestedState();
}

class _AttendanceRequestedState extends State<AttendanceRequested> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(title: 'attendance_requested', bodyWidget: Column(
      children: [
        
      ],
    ));
  }
}