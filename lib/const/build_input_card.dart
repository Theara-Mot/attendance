import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildInputCard extends StatefulWidget {
  final TextEditingController controller;
  final int Maxline;
  final String hint;

  const BuildInputCard({
    Key? key,
    required this.controller,
    this.Maxline = 1,
    required this.hint,
  }) : super(key: key);

  @override
  _BuildInputCardState createState() => _BuildInputCardState();
}

class _BuildInputCardState extends State<BuildInputCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4), // Adjust top and bottom padding here
          child: TextField(
            controller: widget.controller,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            style: GoogleFonts.notoSerifKhmer(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            maxLines: widget.Maxline,
            decoration: InputDecoration.collapsed(
              hintText: widget.hint.tr(),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
      ),
    );
  }
}
