import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddLeave extends StatefulWidget {
  const AddLeave({super.key});

  @override
  State<AddLeave> createState() => _AddLeaveState();
}

class _AddLeaveState extends State<AddLeave> {
  DateTime? fromDate;
  DateTime? toDate;
  List<String> dataList = ['annual_leave', 'sick_leave','maternity', 'special_leave',];
  String leaveType = '';
  int usedLeave = 2;
  Future<void> _fromDate(BuildContext context) async {
    DateTime? picked = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 220,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            minimumDate: DateTime(2020),
            maximumDate: DateTime(2025),
            onDateTimeChanged: (DateTime newDate) {
              setState(() {
                fromDate = newDate;
              });
            },
          ),
        );
      },
    );

    if (picked != null && picked != fromDate) {
      setState(() {
        fromDate = picked;
      });
    }
  }

  Future<void> _toDate(BuildContext context) async {
    DateTime? picked = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 220,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            minimumDate: fromDate ?? DateTime(2020),
            maximumDate: DateTime(2025),
            onDateTimeChanged: (DateTime newDate) {
              setState(() {
                toDate = newDate;
              });
            },
          ),
        );
      },
    );

    if (picked != null && picked != toDate) {
      setState(() {
        toDate = picked;
      });
    }
  }
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
  int calculateDateDifference() {
    if (fromDate != null && toDate != null) {
      final difference = toDate!.difference(fromDate!);
      return difference.inDays;
    }
    return 0;
  }
  @override
  Widget build(BuildContext context) {
    int requestedDays = calculateDateDifference();
    return  BuildAppBar(title: 'request_leave',
    centerTitle: true,
      bodyWidget: GestureDetector(
        onTap: () {   

        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  const SizedBox(height:5),
                  Container(
                    width: double.infinity,
                    padding:const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:Column(
                      children: [
                        Text(' Mot Sotheara',style: GoogleFonts.ubuntu(
                          fontSize: 16,fontWeight: FontWeight.w500
                        ),),
                        SizedBox(height:10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text('id'.tr(),style: GoogleFonts.ubuntu(
                            fontSize: 16,fontWeight: FontWeight.w400
                          ),),
                          Text('1324',style: GoogleFonts.ubuntu(
                            fontSize: 16,fontWeight: FontWeight.w500
                          ),)
                        ],),
                        SizedBox(height:10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text('department'.tr(),style: GoogleFonts.ubuntu(
                            fontSize: 16,fontWeight: FontWeight.w400
                          ),),
                          Text('IT',style: GoogleFonts.ubuntu(
                            fontSize: 16,fontWeight: FontWeight.w500
                          ))
                        ]),
                        SizedBox(height:10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text('role'.tr(),style: GoogleFonts.ubuntu(
                            fontSize: 16,fontWeight: FontWeight.w400
                          )),
                          Text('Tech Support Officer',style: GoogleFonts.ubuntu(
                            fontSize: 16,fontWeight: FontWeight.w500
                          ))
                        ]),
                        SizedBox(height:10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text('joined_date'.tr(),style: GoogleFonts.ubuntu(
                            fontSize: 16,fontWeight: FontWeight.w400
                          )),
                          Text('Octomber-10-2022',style: GoogleFonts.ubuntu(
                            fontSize: 16,fontWeight: FontWeight.w500
                          ))
                        ])
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('request_date'.tr(),style: GoogleFonts.ubuntu(
                          fontSize: 16,fontWeight: FontWeight.w500
                        )),
                        const SizedBox(height: 5,),
                        Row(children: [
                          Expanded(child: GestureDetector(
                          onTap: () {
                            _fromDate(context);
                          },
                          child: Container(
                            padding:const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color:const Color.fromARGB(255, 216, 238, 248)
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: [
                                Text('from_date'.tr(),style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.w400),),
                                Text(fromDate != null
                                    ? fromDate!.toString().split(' ')[0]
                                    : '',style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.w400),)
                              ]),
                            ),
                          )
                        )),
                        const SizedBox(width: 10,),
                        Expanded(child: GestureDetector(
                          onTap: () {
                            // ignore: unrelated_type_equality_checks
                            if(fromDate !=null && fromDate != ''){
                              _toDate(context);
                            }
                          },
                          child: Container(
                            padding:const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color:const Color.fromARGB(255, 216, 238, 248)
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: [
                                Text('to_date'.tr(),style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.w400),),
                                Text(toDate != null
                                    ? toDate!.toString().split(' ')[0]
                                    : '',style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.w400),)
                              ]),
                            ),
                          )
                        ))
                        ],),
                        const SizedBox(height: 5),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          padding:const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                              color:const Color.fromARGB(255, 216, 238, 248)
                          ),
                          child: Row(children: [
                            Text("you_have_requested_leave_for".tr(),style:GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.w400)),
                            Text(" $requestedDays",style:GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.w400)),
                            Text('day'.tr(),style:GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.w400)),
                          ],)
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('reason_requested_leave'.tr(),
                    style: GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w500)),
                  Card(
                    elevation: 0,
                    margin:const EdgeInsets.symmetric(vertical: 5),
                    color: Colors.white,
                    child: Padding(
                      padding:const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _textEditingController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        style: GoogleFonts.ubuntu(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        maxLines: 8,
                        onChanged: (value) {
                          setState(() {
                            // Trim empty new lines
                            _textEditingController.text = value.replaceAll(RegExp(r'\n{2,}'), '\n');
                          });
                        },
                        
                        decoration:InputDecoration.collapsed(
                          hintText: "input_your_reason_here".tr(),
                          fillColor: Colors.white,
                          filled: true,
                         ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: AppColor.primaryColor,
                      onPressed: () {
                        if (kDebugMode) {
                          print('fdsaf');
                        }
                      },
                      pressedOpacity :1,
                      child:  Text('${'submit'.tr()} (Touch Sani)',
                        style: GoogleFonts.ubuntu(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        )
                      ),
                    ),
                  )         
              ],
            ),
          ),
        ),
      ),
    );
  }
}