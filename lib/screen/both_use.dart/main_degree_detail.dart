import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/app_color.dart';

class MainDegreeDetail extends StatefulWidget {
  final String grade;
  final String content;
  const MainDegreeDetail({super.key, required this.grade, required this.content});

  @override
  State<MainDegreeDetail> createState() => _MainDegreeDetailState();
}

class _MainDegreeDetailState extends State<MainDegreeDetail> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
        centerTitle: true,
        title: 'Main Degree Detail',
        bodyWidget: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Text(widget.grade,textAlign: TextAlign.justify,style: GoogleFonts.notoSerifKhmer(fontSize:20,fontWeight:FontWeight.w600,color:AppColor.primaryColor),),
              SizedBox(height: 30,),
              Text(widget.content +widget.content+widget.content+widget.content+widget.content,textAlign: TextAlign.justify,style: GoogleFonts.notoSerifKhmer(fontSize:14,fontWeight:FontWeight.w400),)
            ],
          ),
        )
    );
  }
}
