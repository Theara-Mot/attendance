import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';

class CreateClass extends StatefulWidget {
  const CreateClass({super.key});

  @override
  State<CreateClass> createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(title: 'create_class', bodyWidget: Column(
      children: [
        
      ],
    ));
  }
}
