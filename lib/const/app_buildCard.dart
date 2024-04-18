import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

class BuildCard extends StatefulWidget {
  final IconData? leadingIcon;
  final String name;
  final String data;
  final bool showData;
  final bool showTrailing;

  const BuildCard({
    Key? key,
    this.leadingIcon,
    this.name = 'name',
    this.data = '',
    this.showData = false,
    this.showTrailing = false,
  }) : super(key: key);

  @override
  _BuildCardState createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  late bool showData;

  @override
  void initState() {
    super.initState();
    showData = widget.showData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        children: [
          if (widget.leadingIcon != null) ...[
            Icon(widget.leadingIcon),
            SizedBox(width: 10),
          ],
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    widget.name.tr(),
                    style: GoogleFonts.notoSerifKhmer(color: Colors.black54,fontSize: 14),
                  ),
                  Text(widget.data.isNotEmpty ? ' : ' : ''),
                  Text(
                    widget.data.isNotEmpty ? '${widget.data}'.tr() : '',
                    style: GoogleFonts.notoSerifKhmer(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          if (widget.showTrailing)
            GestureDetector(
              onTap: () {
                setState(() {
                  showData = !showData;
                });
              },
              child: Icon(showData ? Icons.remove_red_eye : Icons.visibility_off),
            ),
        ],
      ),
    );
  }
}
