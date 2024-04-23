import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';

class Days extends StatefulWidget {
  const Days({super.key});

  @override
  State<Days> createState() => _DaysState();
}

class _DaysState extends State<Days> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
        title: 'Days',
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
