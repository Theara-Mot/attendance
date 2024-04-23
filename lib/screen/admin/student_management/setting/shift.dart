import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';

class Shift extends StatefulWidget {
  const Shift({super.key});

  @override
  State<Shift> createState() => _ShiftState();
}

class _ShiftState extends State<Shift> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
        title: 'shift',
        check: true,
        notificationIcon: Icons.add_box_outlined,
        onTapNotification: (){
          print('tap');
        },
        bodyWidget: Column(
          children: [

          ],
        ));
  }
}
