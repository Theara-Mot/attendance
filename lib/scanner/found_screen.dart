import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';


class FoundScreen extends StatefulWidget {
  final String value;
  final Function() screenClose;
  const FoundScreen({Key? key, required this.value, required this.screenClose}) : super(key: key);

  @override
  State<FoundScreen> createState() => _FoundScreenState();
}

class _FoundScreenState extends State<FoundScreen> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(title: 'Result', bodyWidget: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Result: ", style: TextStyle(fontSize: 20),),
              SizedBox(height: 20),
              Text(widget.value, style: TextStyle(fontSize: 16))
            ],
          ),
        ),
      ));
  }
}