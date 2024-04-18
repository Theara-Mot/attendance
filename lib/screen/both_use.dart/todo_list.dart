// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  TextStyle normalText =GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w400);
  TextStyle bigText =  GoogleFonts.ubuntu(fontSize: 18, fontWeight: FontWeight.w500);
  List<Map<String, dynamic>> todoItems = [
  {
    'name': 'Emily White',
    'leaveType': 'maternity',
    'requestDays': 90,
    'fromDate': '2024-04-01',
    'toDate': '2024-06-29',
    'submitDate': '2024-03-15',
    'requestDate': '2024-03-10',
    'duration': '90 days',
    'approveBy': 'Michael Johnson',
    'reason': 'Maternity leave: Expected delivery date approaching.',
    'status': 'approved',
  },
  {
    'name': 'John Doe',
    'leaveType': 'annual_leave',
    'requestDays': 2,
    'fromDate': '2024-02-20',
    'toDate': '2024-02-22',
    'submitDate': '2024-02-18',
    'requestDate': '2024-02-17',
    'duration': '2 days',
    'approveBy': 'Jane Smith',
    'reason': 'Vacation trip: Family gathering in another city.',
    'status': 'pending',
  },
  {
    'name': 'Alice Johnson',
    'leaveType': 'sick_leave',
    'requestDays': 3,
    'fromDate': '2024-03-10',
    'toDate': '2024-03-12',
    'submitDate': '2024-03-08',
    'requestDate': '2024-03-07',
    'duration': '3 days',
    'approveBy': 'David Brown',
    'reason': 'Flu: Doctor advised rest for recovery.',
    'status': 'approved',
  },
  {
    'name': 'Emily White',
    'leaveType': 'maternity',
    'requestDays': 90,
    'fromDate': '2024-04-01',
    'toDate': '2024-06-29',
    'submitDate': '2024-03-15',
    'requestDate': '2024-03-10',
    'duration': '90 days',
    'approveBy': 'Michael Johnson',
    'reason': 'Maternity leave: Expected delivery date approaching.',
    'status': 'approved',
  },
  {
    'name': 'Robert Davis',
    'leaveType': 'sick_leave',
    'requestDays': 5,
    'fromDate': '2024-08-10',
    'toDate': '2024-08-14',
    'submitDate': '2024-08-08',
    'requestDate': '2024-08-07',
    'duration': '5 days',
    'approveBy': 'Jennifer Wilson',
    'reason': 'Fever: Doctor prescribed bed rest for recoveryDoctor prescribed bed rest for recovery.',
    'status': 'rejected',
  }];

  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
      title: 'todo_list',
      centerTitle: true,
      bodyWidget: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: todoItems.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> todoItem = todoItems[index];
            String name = todoItem['name'];
            String fromDate = todoItem['fromDate'];
            String toDate = todoItem['toDate'];
            String leaveType = todoItem['leaveType'];
            String reason = todoItem['reason'];

            return Container(
              margin: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 2),
              padding: EdgeInsets.all(8),
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
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/static_images/logo.png'),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name, style: normalText),
                          SizedBox(height: 2),
                          Text('$fromDate - $toDate', style: bigText),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(leaveType, style: bigText),
                  SizedBox(height: 5),
                  Text(reason, style: GoogleFonts.ubuntu(fontSize: 14)),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 84, 73),
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: Text('rejected'.tr(),style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 16),),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: Text('accept'.tr(),style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 16),),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}