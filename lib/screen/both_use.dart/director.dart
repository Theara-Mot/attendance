import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';

class Director extends StatefulWidget {
  const Director({super.key});

  @override
  State<Director> createState() => _DirectorState();
}

class _DirectorState extends State<Director> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(title: 'director', bodyWidget: Column(
      children: [

      ],
    ));
  }
}
