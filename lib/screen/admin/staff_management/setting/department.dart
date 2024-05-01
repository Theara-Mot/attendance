import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/screen/admin/student_management/setting/add_class.dart';
import 'package:attendance/screen/admin/student_management/setting/add_year.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Department extends StatefulWidget {
  const Department({super.key});

  @override
  State<Department> createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  List<Map<String,dynamic>> data = [
    {'id':1,'name':'ICT','status':'active'},
    {'id':2,'name':'English','status':'active'},
    {'id':3,'name':'Khmer','status':'active'},
    {'id':4,'name':'Mathematics','status':'active'},
    {'id':4,'name':'Chemistry','status':'active'},
    {'id':4,'name':'Physics','status':'active'},
    {'id':4,'name':'Biology','status':'active'},
    {'id':4,'name':'Geography','status':'active'},
  ];
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
        title: 'Department',
        check: true,
        notificationIcon: Icons.add_box_outlined,
        onTapNotification: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return AddClass();
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
                            return AddClass(name: data[index]['name'],status: data[index]['status']);
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
