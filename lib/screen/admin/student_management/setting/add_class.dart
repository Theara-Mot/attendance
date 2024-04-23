import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';

class AddClass extends StatefulWidget {
  const AddClass({super.key});

  @override
  State<AddClass> createState() => _AddClassState();
}

class _AddClassState extends State<AddClass> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(title: 'add_class', bodyWidget: Column(
      children: [

      ],
    ));
  }
}
