import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/const/app_snackbar.dart';
import 'package:attendance/screen/admin/staff_management/setting/add_department.dart';
import 'package:attendance/screen/admin/student_management/setting/add_class.dart';
import 'package:attendance/screen/admin/student_management/setting/add_year.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../services/controller/day_controller.dart';
import '../../../../services/model/day_model.dart';

class Department extends StatefulWidget {
  const Department({super.key});

  @override
  State<Department> createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  DayController dayController = DayController('department');
  List<Day> data =[];
  bool _isLoading = false;
  late Future<List<Day>> _daysFuture;
  Future<List<Day>> fetchDays() async{
    try{
      return await dayController.fetchDays();
    }catch(e){
      BuildSnackbar.showSnackbar(context, 'error $e');
      return [];
    }
  }
  Future<void> fetchData() async {
    try {
      setState(() {
        _isLoading = true;
      });
      List<Day> fetchedData = await dayController.fetchDays();
      setState(() {
        data = fetchedData;
      });
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  Future<void> _handleRefresh() async {
    setState(() {
      _daysFuture = fetchDays();
    });
  }
  @override
  void initState(){
    super.initState();
    _daysFuture = fetchDays();
  }
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
        title: 'Department',
        check: true,
        notificationIcon: Icons.add_box_outlined,
        onTapNotification: () async {
          final updateData = await Navigator.push(context, MaterialPageRoute(builder: (context){
            return AddDepartment();
          }));
          if(updateData !=null) {
            setState(() {
              _daysFuture = fetchDays();
            });
          }
        },
        bodyWidget:FutureBuilder<List<Day>>(
          future: _daysFuture,
          builder: (context,snapshot){
            if(snapshot.hasData){
              List<Day>? data = snapshot.data;
              return RefreshIndicator(
                onRefresh: _handleRefresh,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:ListView.builder(
                        itemCount: data?.length,
                        itemBuilder: (context,index){
                          Day? day = data?[index];
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
                                onTap: () async {
                                  final udpateData = await Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return AddDepartment(id:day?.id,name: day?.name,status: day?.status);
                                  }));

                                  if(udpateData != null){
                                    setState(() {
                                      _daysFuture = fetchDays();
                                    });
                                  }
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
                                        day!.name,
                                        style: GoogleFonts.notoSerifKhmer(fontSize: 18),
                                      ),
                                      Text(
                                        '${day.status}'.tr(),
                                        style: GoogleFonts.notoSerifKhmer(
                                          fontSize: 18,
                                          color: day.status.toLowerCase() == 'active'
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
                ),
              );
            }else if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }else{
              return Center(child: Text('Error: ${snapshot.error}'));
            }
          },
        )
    );
  }
}
