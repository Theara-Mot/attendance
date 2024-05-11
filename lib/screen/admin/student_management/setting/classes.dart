import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/screen/admin/student_management/setting/add_class.dart';
import 'package:attendance/screen/admin/student_management/setting/add_year.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../services/controller/day_controller.dart';
import '../../../../services/model/day_model.dart';

class Classes extends StatefulWidget {
  const Classes({super.key});

  @override
  State<Classes> createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  DayController dayController = DayController('class');
  late Future<List<Day>> _classFuture;
  List<Day> data =[];
  Future<List<Day>> fetchDays() async {
    try{
      return await dayController.fetchDays();
    }catch(e){
      print('Error fetching data: $e');
      return [];
    }
  }
  Future<void> _handleRefresh() async {
    setState(() {
      _classFuture = fetchDays();
    });
  }
  @override
  void initState(){
    super.initState();
    _classFuture = fetchDays();
  }
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
        title: 'classes',
        check: true,
        notificationIcon: Icons.add_box_outlined,
        onTapNotification: () async {
          final updatedData = await Navigator.push(context, MaterialPageRoute(builder: (context){
            return AddClass();
          }));
          if(updatedData != null){
            setState(() {
              data.add(updatedData);
              _classFuture = fetchDays();
            });
          }
        },
        bodyWidget:FutureBuilder<List<Day>>(
          future: _classFuture,
          builder: (context,snpashot){
            if(snpashot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }else if (snpashot.hasError){
              return Center(child: Text('Error: ${snpashot.error}'),);
            }else{
              List<Day>? data = snpashot.data;
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
                                  final updatedData  =await  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return AddClass(id:day?.id,name: day?.name,status: day?.status);
                                  }));
                                  if(updatedData !=null){
                                    setState(() {
                                      data?[index] =updatedData;
                                      _classFuture = fetchDays();
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
            }
          },

        ));
  }
}
