import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';

class Classes extends StatefulWidget {
  const Classes({super.key});

  @override
  State<Classes> createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(title: 'classes', bodyWidget: Column(
      children: [

      ],
    ));
  }
}
