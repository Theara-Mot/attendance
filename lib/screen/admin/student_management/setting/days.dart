import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/screen/admin/student_management/setting/add_class.dart';
import 'package:attendance/screen/admin/student_management/setting/add_day.dart';
import 'package:attendance/screen/admin/student_management/setting/add_year.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Days extends StatefulWidget {
  const Days({super.key});

  @override
  State<Days> createState() => _DaysState();
}

class _DaysState extends State<Days> {
  List<Map<String,dynamic>> data = [
    {'id':1,'name':'Monday','status':'active'},
    {'id':2,'name':'Tuesday','status':'active'},
    {'id':3,'name':'Wednesday','status':'active'},
    {'id':4,'name':'Thursday','status':'Inactive'},
    {'id':4,'name':'Friday','status':'Inactive'},
    {'id':4,'name':'Saturday','status':'Inactive'},
  ];
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
        title: 'Days',
        check: true,
        notificationIcon: Icons.add_box_outlined,
        onTapNotification: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return AddDay();
          }));
        },
        bodyWidget: Padding(
            padding: const EdgeInsets.all(8.0),
            child:ListView.builder(
                itemCount: data.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(5), // Adjust the margin as needed
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        splashColor:  Color.fromARGB(249, 26, 123, 189),
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return AddDay(name: data[index]['name'],status: data[index]['status']);
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                child: Text('${index + 1}'),
                              ),
                              Text(
                                data[index]['name'],
                                style: GoogleFonts.notoSerifKhmer(fontSize: 18),
                              ),
                              Text(
                                '${data[index]['status']}'.tr(),
                                style: GoogleFonts.notoSerifKhmer(
                                  fontSize: 18,
                                  color: data[index]['status'] == 'active'
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })
        ));
  }
}
