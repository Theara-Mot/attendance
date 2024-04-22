import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';

class AddShift extends StatefulWidget {
  const AddShift({super.key});

  @override
  State<AddShift> createState() => _AddShiftState();
}

class _AddShiftState extends State<AddShift> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(title: 'shift', bodyWidget: Column(
      children: [
        
      ],
    ));
  }
}