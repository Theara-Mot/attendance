import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/screen/admin/student_management/setting/add_class.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
  List<Day> data = [];
  bool status = false;

  Future<List<Day>> fetchDays() async {
    try {
      List<Day> days = await dayController.fetchDays();

      // Sort by status first, then by name
      days.sort((a, b) {
        // Define status order
        int statusComparison = a.status.compareTo(b.status);
        if (statusComparison != 0) {
          return statusComparison; // Sort by status if different
        }

        // Extract numeric and letter parts from name for secondary sorting
        final regex = RegExp(r'(\d+)\s*([A-Z]*)'); // Regex to extract number and letter
        final aMatch = regex.firstMatch(a.name);
        final bMatch = regex.firstMatch(b.name);

        final aNumber = aMatch != null ? int.parse(aMatch.group(1)!) : 0;
        final bNumber = bMatch != null ? int.parse(bMatch.group(1)!) : 0;

        final aLetter = aMatch != null ? aMatch.group(2) : '';
        final bLetter = bMatch != null ? bMatch.group(2) : '';

        if (aNumber != bNumber) return aNumber.compareTo(bNumber); // Sort by number
        return aLetter!.compareTo(bLetter!); // Sort by letter
      });

      return days;
    } catch (e) {
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
  void initState() {
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
        final updatedData = await Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AddClass();
        }));
        if (updatedData != null) {
          setState(() {
            data.add(updatedData);
            _classFuture = fetchDays();
          });
        }
      },
      bodyWidget: FutureBuilder<List<Day>>(
        future: _classFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
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
                      padding: const EdgeInsets.all(5),
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: InkWell(
                          splashColor: Color.fromARGB(249, 26, 123, 189),
                          borderRadius: BorderRadius.circular(10),
                          onTap: () async {
                            final updatedData = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return AddClass(id: day?.id, name: day?.name, status: day?.status);
                            }));
                            if (updatedData != null) {
                              setState(() {
                                data?[index] = updatedData;
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
                                // Text(
                                //   '${day.status}'.tr(),
                                //   style: GoogleFonts.notoSerifKhmer(
                                //     fontSize: 18,
                                //     color: day.status.toLowerCase() == 'active' ? Colors.green : Colors.red,
                                //   ),
                                // ),
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
          }
        },
      ),
    );
  }
}