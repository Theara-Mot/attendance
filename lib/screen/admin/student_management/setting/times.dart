import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';

class Times extends StatefulWidget {
  const Times({super.key});

  @override
  State<Times> createState() => _TimesState();
}

class _TimesState extends State<Times> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
        title: 'Times',
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
