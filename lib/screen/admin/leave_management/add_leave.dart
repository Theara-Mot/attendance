import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';

class AddLeave extends StatefulWidget {
  const AddLeave({super.key});

  @override
  State<AddLeave> createState() => _AddLeaveState();
}

class _AddLeaveState extends State<AddLeave> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(title: 'leave', bodyWidget: Column(
      children: [
        
      ],
    ));
  }
}