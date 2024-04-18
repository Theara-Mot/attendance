import 'package:attendance/const/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AttendanceHistory extends StatefulWidget {
  const AttendanceHistory({Key? key}) : super(key: key);

  @override
  State<AttendanceHistory> createState() => _AttendanceHistoryState();
}

class _AttendanceHistoryState extends State<AttendanceHistory> {
  TextStyle normalText =
  GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w500);
  TextStyle greyText = GoogleFonts.ubuntu(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black.withOpacity(0.6));

  List<Map<String, dynamic>> leaveHistoryData = [];

  @override
  void initState() {
    super.initState();
    generateThisMonthData();
  }

  void generateThisMonthData() {
    // Get current month and year
    DateTime now = DateTime.now();
    int currentMonth = now.month;
    int currentYear = now.year;

    // Get the number of days in the current month
    int daysInMonth = DateTime(currentYear, currentMonth + 1, 0).day;

    // Generate data for each day of the month
    for (int i = 1; i <= daysInMonth; i++) {
      String date = DateFormat('yyyy-MM-dd').format(DateTime(currentYear, currentMonth, i));
      String checkInTime = '08:00 AM'; // Example check-in time
      String checkInStatus = 'on_time'; // Example check-in status
      String checkOutTime = '05:00 PM'; // Example check-out time
      String checkOutStatus = 'on_time'; // Example check-out status

      // Add the generated data to the list
      leaveHistoryData.add({
        'date': date,
        'checkInTime': checkInTime,
        'checkInStatus': checkInStatus,
        'checkOutTime': checkOutTime,
        'checkOutStatus': checkOutStatus,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: leaveHistoryData.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> leaveEntry = leaveHistoryData[index];
              String date = leaveEntry['date'];
              String checkInTime = leaveEntry['checkInTime'];
              String checkInStatus = leaveEntry['checkInStatus'].toString().tr();
              String checkOutTime = leaveEntry['checkOutTime'];
              String checkOutStatus =
              leaveEntry['checkOutStatus'].toString().tr();
              List<String> splitTime = checkInTime.split(' ');
              String ci = splitTime[0];
              String amci = splitTime[1].toLowerCase().tr();

              List<String> splitTime1 = checkOutTime.split(' ');
              String co = splitTime1[0];
              String pmc0 = splitTime1[1].toLowerCase().tr();

              return Container(
                padding: EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 10, left: 8, right: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: AppColor.primaryColor.withOpacity(0.3)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        color: AppColor.primaryColor.withOpacity(0.1),
                        blurRadius: 1,
                        spreadRadius: 2)
                  ],
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.note_add_outlined,
                              color: AppColor.primaryColor,
                              size: 25,
                            ),
                            SizedBox(width: 10),
                            Text(
                              date.tr(),
                              style: GoogleFonts.ubuntu(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),

                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 198, 228, 247),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 3),
                                Text('check_in'.tr(), style: normalText),
                                SizedBox(height: 3),
                                Text('$ci $amci', style: greyText),
                                SizedBox(height: 3),
                                Text(
                                  '$checkInStatus',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: checkInStatus == "On Time"
                                          ? Color.fromARGB(255, 14, 179, 19)
                                          : checkInStatus == "Late"
                                          ? Colors.red
                                          : Colors.black.withOpacity(0.6)),
                                ),
                                SizedBox(height: 3),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 198, 228, 247),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 3),
                                Text('check_out'.tr(), style: normalText),
                                SizedBox(height: 3),
                                Text('$co $pmc0', style: greyText),
                                SizedBox(height: 3),
                                Text(
                                  '$checkOutStatus',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: checkInStatus.tr() == "On Time"
                                          ? Color.fromARGB(255, 14, 179, 19)
                                          : checkOutStatus == "Late"
                                          ? Colors.red
                                          : Colors.black.withOpacity(0.6)),
                                ),
                                SizedBox(height: 3),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
