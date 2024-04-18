import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';

class AddTime extends StatefulWidget {
  const AddTime({super.key});

  @override
  State<AddTime> createState() => _AddTimeState();
}

class _AddTimeState extends State<AddTime> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(title: 'add_time', bodyWidget: Column(
      children: [
        
      ],
    ));
  }
}