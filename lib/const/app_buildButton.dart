import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app_color.dart';

class BuildButton extends StatefulWidget {
  final String text;
  final Function() function;
  const BuildButton({Key? key, required this.text,required this.function});

  @override
  State<BuildButton> createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        onTap: widget.function,
        splashColor: Colors.blueAccent,
        borderRadius: BorderRadius.circular(30),
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: Center(
            child: Text(
              widget.text.tr(),
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
