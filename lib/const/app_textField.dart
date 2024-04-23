import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class BuildSelectText extends StatefulWidget {
  String selectText;
  final List<String> textList;
  final String label;

  BuildSelectText({Key? key, required this.selectText, required this.textList, required this.label}) : super(key: key);

  @override
  _BuildSelectTextState createState() => _BuildSelectTextState();
}

class _BuildSelectTextState extends State<BuildSelectText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              height: 200.0,
              child: CupertinoPicker(
                itemExtent: 32.0,
                onSelectedItemChanged: (int index) {
                  setState(() {
                    widget.selectText = widget.textList[index];
                  });
                },
                children: widget.textList.map((String type) {
                  return Text(type);
                }).toList(),
              ),
            );
          },
        );
      },
      child: AbsorbPointer(
        child: Card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(vertical: 0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: TextField(
              style: GoogleFonts.ubuntu(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: widget.label,
                labelStyle: GoogleFonts.ubuntu(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              controller: TextEditingController(text: widget.selectText),
            ),
          ),
        ),
      ),
    );
  }
}
