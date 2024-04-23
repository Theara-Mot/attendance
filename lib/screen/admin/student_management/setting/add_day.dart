import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';

class AddDay extends StatefulWidget {
  const AddDay({super.key});

  @override
  State<AddDay> createState() => _AddDayState();
}

class _AddDayState extends State<AddDay> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(title: 'add_day', bodyWidget: Column(
      children: [

      ],
    ));
  }
}
