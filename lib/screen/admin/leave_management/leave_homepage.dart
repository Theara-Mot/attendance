import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/screen/admin/drawer/custom_drawer_leave.dart';
import 'package:attendance/screen/admin/drawer/custom_drawer_schedule.dart';
import 'package:attendance/screen/admin/leave_management/lecturer_leave_list.dart';
import 'package:attendance/screen/admin/leave_management/student_leave_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaveHomePage extends StatefulWidget {
  const LeaveHomePage({super.key});

  @override
  State<LeaveHomePage> createState() => _LeaveHomePageState();
}

class _LeaveHomePageState extends State<LeaveHomePage> {
  Expanded buildContainer(IconData icon,String name,int amount,{Widget? page}){
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(2,2),
                  color: Colors.white,
                  spreadRadius: 2,
                  blurRadius: 2
                )
              ]
            ),
                child: InkWell(
          splashColor: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10),
          onTap: (){
            if(page != null ){
              Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute( builder: (BuildContext context) { return page!; }, ));
            }else{
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColor.primaryColor,
                  content: Text('Under Construction',style: GoogleFonts.notoSerifKhmer(
                    color:Colors.white,
                    fontSize:16
                  ),),
                ),
              );
            }
          },
          child: Container(
            padding: EdgeInsets.all(8),
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: Colors.grey.shade300
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon,color: AppColor.primaryColor,size: 35,),
                Text('$name'.tr(),style: GoogleFonts.notoSerifKhmer(fontSize:18),),
                Spacer(),
                Text('$amount '+'pax'.tr(),style: GoogleFonts.notoSerifKhmer(fontSize:18),),
              ],
            ),
          ),
                ),
              ),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        title: Text(
          'leave_management'.tr(),
          style: GoogleFonts.ubuntu(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('leave_request'.tr(),
            style: GoogleFonts.notoSerifKhmer(
              fontSize:18,
              color:AppColor.primaryColor,
              fontWeight:FontWeight.w600
            ),),
            Row(
              children: [
                buildContainer(Icons.person_outline, 'student', 10,page: StudentLeaveList()),
                buildContainer(Icons.person_pin_rounded, 'lecturer', 10,page: LecturerLeaveList()),
              ],
            ),
            SizedBox(height: 15,),
            Text('absent'.tr(),
              style: GoogleFonts.notoSerifKhmer(
                  fontSize:18,
                  color:AppColor.primaryColor,
                  fontWeight:FontWeight.w600
              ),),
            Row(
              children: [
                buildContainer(Icons.person_outline, 'student', 10),
                buildContainer(Icons.person_pin_rounded, 'lecturer', 10),
              ],
            ),
            SizedBox(height: 15,),
            Text('abnormal_attendance'.tr(),
              style: GoogleFonts.notoSerifKhmer(
                  fontSize:18,
                  color:AppColor.primaryColor,
                  fontWeight:FontWeight.w600
              ),),
            Row(
              children: [
                buildContainer(Icons.person_outline, 'student', 10),
                buildContainer(Icons.person_pin_rounded, 'lecturer', 10),
              ],
            )
          ],
        ),
      ),
    );
  }
}