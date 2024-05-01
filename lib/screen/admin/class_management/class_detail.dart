import 'dart:async';

import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/const/app_snackbar.dart';
import 'package:attendance/screen/admin/class_management/add_student_to_class.dart';
import 'package:attendance/screen/admin/student_management/class_qr_code.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/app_dimension.dart';
import '../../both_use.dart/qr_code.dart';
class ClassDetail extends StatefulWidget {
  final String name;
  const ClassDetail({Key? key, required this.name}) : super(key: key);

  @override
  State<ClassDetail> createState() => _ClassDetailState();
}

class _ClassDetailState extends State<ClassDetail>with SingleTickerProviderStateMixin {
  bool isShowSchedule = false;
  bool isShowLecturer = false;
  bool isShowStudent = false;
  TextStyle style = GoogleFonts.notoSerifKhmer(fontSize:18,fontWeight:FontWeight.w500,color:Colors.white);
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    double beginScale = 1.0;
    double middleScale = 1.0;
    double endScale = 1.2;
    Tween<double> beginTween = Tween<double>(
      begin: beginScale,
      end: middleScale,
    );

    Tween<double> middleTween = Tween<double>(
      begin: middleScale,
      end: endScale,
    );

    Tween<double> endTween = Tween<double>(
      begin: endScale,
      end: beginScale,
    );

    Interval beginInterval = Interval(0.0, 0.33, curve: Curves.easeOut);
    Interval middleInterval = Interval(0.33, 0.67, curve: Curves.easeInOut);
    Interval endInterval = Interval(0.67, 1.00, curve: Curves.easeIn);

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: beginTween.chain(CurveTween(curve: beginInterval)),
        weight: 1.0,
      ),
      TweenSequenceItem<double>(
        tween: middleTween.chain(CurveTween(curve: middleInterval)),
        weight: 1.0,
      ),
      TweenSequenceItem<double>(
        tween: endTween.chain(CurveTween(curve: endInterval)),
        weight: 1.0,
      ),
    ]).animate(_animationController);

    _animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.name.tr(),
          style: GoogleFonts.ubuntu(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return AddStudentToClass();
              }));
            },
            child: Icon(Icons.add_box_outlined,color: Colors.white,size: 30),
          ),
          SizedBox(width: 10,),
          GestureDetector(
            onTap: (){
              Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute( builder: (BuildContext context) { return ClassfQrCode(name: widget.name,); }, ));
            },
            child: AnimatedBuilder(
                animation: _animationController,
                builder: (BuildContext context,Widget? child){
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      margin: EdgeInsets.only(top: AppDimension.width10*1.4,bottom: AppDimension.width10*1.4),
                      padding: EdgeInsets.all(2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppDimension.radius8),
                          color: Colors.white
                      ),
                      child: Icon(Icons.qr_code,color: Colors.red),
                    ),
                  );
                }
            ),
          ),
          SizedBox(width: 10,),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 10),
            child:Ink(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:isShowSchedule? AppColor.primaryColor:Colors.white
              ),
              child: InkWell(
                splashColor: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10),
                onTap: (){
                  setState(() {
                    isShowSchedule = !isShowSchedule;
                    isShowLecturer = false;
                    isShowStudent = false;
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(isShowSchedule?'Hide Schedule ?':'Show Schedule ?',style: GoogleFonts.notoSerifKhmer(fontSize:16,color:isShowSchedule?Colors.white:Colors.black),),
                      Icon(isShowSchedule?Icons.close:Icons.cloud_done,color:isShowSchedule?Colors.white:AppColor.primaryColor)
                    ],
                  ),
                ),
              ),
            ),
          ),
          isShowSchedule? Container(
            margin: EdgeInsets.only(top: 10,bottom: 10),
            padding:EdgeInsets.only(top: 10,bottom: 10,left: 8,right: 8),
            decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(10)
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              child: DataTable(
                onSelectAll: (a){

                },
                clipBehavior: Clip.antiAlias,
                dividerThickness:2,
                dataRowColor: MaterialStateColor.resolveWith((states) {return Colors.white;},),
                headingRowColor: MaterialStateColor.resolveWith((states) {return AppColor.primaryColor;},),
                border: TableBorder.all(),
                headingRowHeight: 50,
                columns: [
                  DataColumn(label: Text('Time',style:style)),
                  DataColumn(label: Text('Monday',style:style)),
                  DataColumn(label: Text('Tuesday',style:style)),
                  DataColumn(label: Text('Wednesday',style:style)),
                  DataColumn(label: Text('Thursday',style:style)),
                  DataColumn(label: Text('Friday',style:style)),
                  DataColumn(label: Text('Saturday',style:style)),
                ],
                rows: [
                  buildDataRow(['7-8', 'H', 'ITC', 'I', 'E', 'H', 'E']),
                  buildDataRow(['8-9', 'ITC', 'E', 'H', 'E', 'E', 'He']),
                  buildDataRow(['9-11', 'M', 'P', 'K', 'M', 'P', 'C']),
                ],
              ),
            ),
          ):Container(),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 10),
            child:Ink(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:isShowLecturer?AppColor.primaryColor: Colors.white
              ),
              child: InkWell(
                splashColor: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10),
                onTap: (){
                  setState(() {
                    isShowSchedule = false;
                    isShowStudent = false;
                    isShowLecturer = !isShowLecturer;
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(isShowLecturer?'Hide Lecturer List ?':'Show Lecturer List ?',style: GoogleFonts.notoSerifKhmer(fontSize:16,color:isShowLecturer?Colors.white:Colors.black),),
                      Icon(isShowLecturer?Icons.close:Icons.cloud_done,color:isShowLecturer?Colors.white:AppColor.primaryColor)
                    ],
                  ),
                ),
              ),
            ),
          ),
          !isShowLecturer? Container():SizedBox(height: 10,),
          if(isShowLecturer)
            SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        // Navigator.of(context, rootNavigator: true).push(
                        //     MaterialPageRoute( builder: (BuildContext context) { return null; }, ));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 5.0,left: 8,right: 8),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/static_images/s_logo.jpg'),
                            ),
                            SizedBox(width: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('lecturer',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'gender',
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Colors.grey,)
                          ],
                        ),
                      ),
                    );
                  },
                )),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 10),
            child:Ink(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:isShowStudent?AppColor.primaryColor: Colors.white
              ),
              child: InkWell(
                splashColor: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10),
                onTap: (){
                  setState(() {
                    isShowSchedule = false;
                    isShowLecturer = false;
                    isShowStudent = !isShowStudent;
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(isShowStudent?'Hide Student List ?':'Show Student List ?',style: GoogleFonts.notoSerifKhmer(fontSize:16,color:isShowStudent?Colors.white:Colors.black),),
                      Icon(isShowStudent?Icons.close:Icons.cloud_done,color:isShowStudent?Colors.white:AppColor.primaryColor)
                    ],
                  ),
                ),
              ),
            ),
          ),
          !isShowStudent? Container():SizedBox(height: 10,),
          if(isShowStudent)
            SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      // Navigator.of(context, rootNavigator: true).push(
                      //     MaterialPageRoute( builder: (BuildContext context) { return null; }, ));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 5.0,left: 8,right: 8),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/static_images/s_logo.jpg'),
                          ),
                          SizedBox(width: 15.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('student',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'gender',
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Colors.grey,)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  DataRow buildDataRow(List<String> cells, {bool isHeader = false}) {
    return DataRow(
      cells: cells.map((cell) {
        final style = TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal, fontSize: 18);
        return DataCell(Center(child: Text(cell, style: style)));
      }).toList(),
    );
  }
}
