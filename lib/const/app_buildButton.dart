import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app_color.dart';

class BuildButton extends StatefulWidget {
  final String text;
  final Function() function;
  final Color color;
  const BuildButton({Key? key, required this.text,required this.function, this.color = AppColor.primaryColor});

  @override
  State<BuildButton> createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        onTap: widget.function,
        splashColor: Colors.white60,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: EdgeInsets.symmetric(vertical:8),
          width: double.infinity,
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
