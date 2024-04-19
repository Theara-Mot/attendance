import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';

class AboutSchool extends StatefulWidget {
  const AboutSchool({super.key});

  @override
  State<AboutSchool> createState() => _AboutSchoolState();
}

class _AboutSchoolState extends State<AboutSchool> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(title: 'About', bodyWidget: Column(
      children: [
        
      ],
    ));
  }
}
