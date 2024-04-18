import 'package:attendance/const/app_dimension.dart';
import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/screen/both_use.dart/attendance_history.dart';
import 'package:attendance/screen/both_use.dart/leave_history.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    const LeaveHistory(),
    const AttendanceHistory(),
  ];

  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
      centerTitle: true,
      title: 'history', bodyWidget: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentPageIndex = 0;
                    });
                  },
                  child: Container(
                    height: AppDimension.height20*2,
                    margin: EdgeInsets.all(AppDimension.margin10),
                    decoration: BoxDecoration(
                      color: _currentPageIndex == 0 ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(AppDimension.radius10*3),
                      border: Border.all(
                          color: _currentPageIndex == 0 ?Colors.white:Colors.grey
                      )
                    ),

                    child: Center(
                      child: Text('leave_history'.tr(), style: GoogleFonts.ubuntu(fontSize: AppDimension.font16,color: _currentPageIndex == 0 ?Colors.white:Colors.grey)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentPageIndex = 1;
                    });
                  },
                  child: Container(
                    height: AppDimension.height20*2,
                    margin: EdgeInsets.all(AppDimension.margin10),
                    decoration: BoxDecoration(
                      color: _currentPageIndex == 1 ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(AppDimension.radius10*3),
                        border: Border.all(
                            color: _currentPageIndex == 1 ?Colors.white:Colors.grey
                        )
                    ),
                    
                    child: Center(
                      child: Text('attendance_history'.tr(), style: GoogleFonts.ubuntu(fontSize: AppDimension.font16,color: _currentPageIndex == 1 ?Colors.white:Colors.grey)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: _pages[_currentPageIndex],
          ),
        ],
      ),);
  }
}


