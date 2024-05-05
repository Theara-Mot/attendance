import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/screen/admin/student_management/setting/add_class.dart';
import 'package:attendance/screen/admin/student_management/setting/add_shift.dart';
import 'package:attendance/screen/admin/student_management/setting/add_time.dart';
import 'package:attendance/screen/admin/student_management/setting/add_year.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../services/controller/day_controller.dart';
import '../../../../services/model/day_model.dart';


class Shift extends StatefulWidget {
  const Shift({super.key});

  @override
  State<Shift> createState() => _ShiftState();
}

class _ShiftState extends State<Shift> {
  DayController dayController = DayController('shift');
  List<Day> data = [];
  bool _isLoading = false;
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
    await fetchData();
  }
  @override
  void initState(){
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
        title: 'Shift',
        check: true,
        notificationIcon: Icons.add_box_outlined,
        onTapNotification: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return AddShift();
          }));
        },
        bodyWidget: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: Padding(
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
                              return AddShift(id:data[index].id, name: data[index].name,status: data[index].status);
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
                                  data[index].name,
                                  style: GoogleFonts.notoSerifKhmer(fontSize: 18),
                                ),
                                Text(
                                  '${data[index].status}'.tr(),
                                  style: GoogleFonts.notoSerifKhmer(
                                    fontSize: 18,
                                    color: data[index].status.toLowerCase() == 'active'
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
        ));
  }
}
