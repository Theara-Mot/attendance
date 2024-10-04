import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/const/app_snackbar.dart';
import 'package:attendance/screen/admin/student_management/setting/add_year.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../services/controller/day_controller.dart';
import '../../../../services/model/day_model.dart';

class Years extends StatefulWidget {
  const Years({super.key});

  @override
  State<Years> createState() => _YearsState();
}

class _YearsState extends State<Years> {
  DayController dayController = DayController('year');
  late Future<List<Day>> _daysFuture;

  Future<List<Day>> fetchDays() async {
    try {
      List<Day> days = await dayController.fetchDays();
      // Sort the data by the number field (replace 'dayNumber' with the actual field name)
      days.sort((a, b) => a.name.compareTo(b.name));
      return days;
    } catch (e) {
      BuildSnackbar.showSnackbar(context, 'error: $e');
      return [];
    }
  }

  Future<void> _handleRefresh() async {
    setState(() {
      _daysFuture = fetchDays();
    });
  }

  @override
  void initState() {
    super.initState();
    _daysFuture = fetchDays();
  }

  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
      title: 'year',
      check: true,
      notificationIcon: Icons.add_box_outlined,
      onTapNotification: () async {
        final updatedData = await Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AddYear();
        }));
        if (updatedData != null) {
          setState(() {
            _daysFuture = fetchDays();
          });
        }
      },
      bodyWidget: FutureBuilder<List<Day>>(
        future: _daysFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<Day>? data = snapshot.data;

            return RefreshIndicator(
              onRefresh: _handleRefresh,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    Day? day = data?[index];
                    return Padding(
                      padding: const EdgeInsets.all(5), // Adjust the margin as needed
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: InkWell(
                          splashColor: Color.fromARGB(249, 26, 123, 189),
                          borderRadius: BorderRadius.circular(10),
                          onTap: () async {
                            final updateData = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return AddYear(id: day?.id, name: day?.name, status: day?.status);
                            }));
                            if (updateData != null) {
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
                                CupertinoSwitch(
                                  value:day.status=='Active'?true:false,
                                  trackColor: Colors.red,
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
