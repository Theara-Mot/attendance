import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';

class AddYear extends StatefulWidget {
  const AddYear({super.key});

  @override
  State<AddYear> createState() => _AddYearState();
}

class _AddYearState extends State<AddYear> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(title: 'add_year', bodyWidget: Column(
      children: [
        
      ],
    ));
  }
}
