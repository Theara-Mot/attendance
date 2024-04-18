// ignore_for_file: prefer_const_constructors
import 'package:attendance/const/app_dimension.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/screen/both_use.dart/leave_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LeaveHistory extends StatefulWidget {
  const LeaveHistory({Key? key}) : super(key: key);

  @override
  State<LeaveHistory> createState() => _LeaveHistoryState();
}

class _LeaveHistoryState extends State<LeaveHistory> {
  TextStyle normalText = GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w400);
  TextStyle greyText = GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.black.withOpacity(0.6));

  List<Map<String, dynamic>> leaveHistoryData = [
    {
      'leaveType': 'annual_leave',
      'requestDays': 2,
      'fromDate': '2024-02-20',
      'toDate': '2024-02-22',
      'submitDate': '2024-02-18',
      'requestDate': '2024-02-17',
      'duration': '2 days',
      'requestBy': 'John Doe',
      'approveBy': 'Jane Smith',
      'reason': 'Vacation trip',
      'status': 'pending',
    },
    {
      'leaveType': 'annual_leave',
      'requestDays': 2,
      'fromDate': '2024-02-12',
      'toDate': '2024-02-13',
      'submitDate': '2024-02-18',
      'requestDate': '2024-02-17',
      'duration': '2 days',
      'requestBy': 'John Doe',
      'approveBy': 'Jane Smith',
      'reason': 'Vacation trip',
      'status': 'pending',
    },
    {
      'leaveType': 'sick_leave',
      'requestDays': 3,
      'fromDate': '2024-03-10',
      'toDate': '2024-03-12',
      'submitDate': '2024-03-08',
      'requestDate': '2024-03-07',
      'duration': '3 days',
      'requestBy': 'Alice Johnson',
      'approveBy': 'David Brown',
      'reason': 'Flu',
      'status': 'approved',
    },
    {
      'leaveType': 'maternity',
      'requestDays': 90,
      'fromDate': '2024-04-01',
      'toDate': '2024-06-29',
      'submitDate': '2024-03-15',
      'requestDate': '2024-03-10',
      'duration': '90 days',
      'requestBy': 'Emily White',
      'approveBy': 'Michael Johnson',
      'reason': 'Maternity leave',
      'status': 'approved',
    },
    {
      'leaveType': 'sick_leave',
      'requestDays': 5,
      'fromDate': '2024-08-10',
      'toDate': '2024-08-14',
      'submitDate': '2024-08-08',
      'requestDate': '2024-08-07',
      'duration': '5 days',
      'requestBy': 'Robert Davis',
      'approveBy': 'Jennifer Wilson',
      'reason': 'Fever',
      'status': 'rejected',
    }
  ];

  @override
  Widget build(BuildContext context) {
    // Get the list of months that have data
    Set<String> monthsWithData = Set<String>.from(leaveHistoryData.map<String>((entry) => entry['fromDate']!.substring(0, 7)));
    return SingleChildScrollView(
      child: Column(
        children: monthsWithData.map((month) {
          // Filter data for the current month
          List<Map<String, dynamic>> filteredData = leaveHistoryData.where((entry) => entry['fromDate']!.startsWith(month)).toList();

          return Column(
            children: [
              Text(month, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: filteredData.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> leaveEntry = filteredData[index];
                  String leaveType = leaveEntry['leaveType'];
                  int requestDays = leaveEntry['requestDays'];
                  String fromDate = leaveEntry['fromDate'];
                  String toDate = leaveEntry['toDate'];
                  String status = leaveEntry['status'];

                  return GestureDetector(
                    onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LeaveDetail(leaveData: leaveEntry),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      margin: const EdgeInsets.only(top: 10, left: 8, right: 8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: AppColor.primaryColor.withOpacity(0.3)
                        ),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0,0),
                              color: AppColor.primaryColor.withOpacity(0.1),
                              blurRadius: 1,
                              spreadRadius: 2
                          )
                        ],
                        borderRadius: BorderRadius.circular(AppDimension.radius8),
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
                                    leaveType.tr(),
                                    style:  GoogleFonts.ubuntu(
                                        fontSize: 20, fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black,
                                size: 20,
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('request_day'.tr(), style: greyText),
                                  SizedBox(height: 3),
                                  Text('from_date'.tr(), style: greyText),
                                  SizedBox(height: 3),
                                  Text('to_date'.tr(), style: greyText),
                                  SizedBox(height: 3),
                                  Text('status'.tr(), style: greyText),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(requestDays.toString(), style: normalText),
                                  SizedBox(height: 3),
                                  Text(fromDate, style: normalText),
                                  SizedBox(height: 3),
                                  Text(toDate, style: normalText),
                                  SizedBox(height: 3),
                                  Text(
                                    status.tr(),
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: status.tr() == 'Pending' || status.tr() =="កំពង់រងចាំ"
                                          ? Colors.green
                                          : status.tr() == 'Rejected' || status.tr() == "ច្រានចោល"
                                          ? Colors.red
                                          : status == 'Processing' || status.tr() == "កំពង់ដំណើារការ"
                                          ? Colors.blue
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
