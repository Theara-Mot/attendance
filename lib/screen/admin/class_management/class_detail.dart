import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/const/app_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
class ClassDetail extends StatefulWidget {
  final String name;
  const ClassDetail({Key? key, required this.name}) : super(key: key);

  @override
  State<ClassDetail> createState() => _ClassDetailState();
}

class _ClassDetailState extends State<ClassDetail> {
  bool isShowSchedule = false;
  bool isShowLecturer = false;
  bool isShowStudent = false;
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
      title: widget.name,
      notificationIcon: Icons.add_box_outlined,
      check: true,
      onTapNotification: () {
        BuildSnackbar.showSnackbar(context, 'Under Construction');
      },
      bodyWidget: Column(
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
            padding:EdgeInsets.only(top: 10,bottom: 10),
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(10)
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              child: DataTable(
                border: TableBorder.all(),
                headingRowHeight: 50,
                columns: [
                  DataColumn(label: Text('Time')),
                  DataColumn(label: Text('Monday')),
                  DataColumn(label: Text('Tuesday')),
                  DataColumn(label: Text('Wednesday')),
                  DataColumn(label: Text('Thursday')),
                  DataColumn(label: Text('Friday')),
                  DataColumn(label: Text('Saturday')),
                ],
                rows: [
                  buildDataRow(['Time', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']),
                  buildDataRow(['Time', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']),
                  buildDataRow(['Time', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']),
                ],
              ),
            ),
          ):Container(),
          // isShowSchedule? Container():SizedBox(height: 10,),
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
            ),
                      ),
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
