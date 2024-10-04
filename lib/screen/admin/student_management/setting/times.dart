import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/screen/admin/student_management/setting/add_time.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../const/app_snackbar.dart';
import '../../../../services/controller/time_controller.dart';
import '../../../../services/model/time_model.dart';

class Times extends StatefulWidget {
  const Times({super.key});

  @override
  State<Times> createState() => _TimesState();
}

class _TimesState extends State<Times> {
  TimeController timeController = TimeController('times'); // Update endpoint if necessary
  late Future<List<Time>> _timesFuture;
  List<Time> data = [];

  String _sortCriteria = 'name';

  Future<List<Time>> fetchTimes() async {
    try {
      List<Time> times = await timeController.fetchTimes();

      // Define a function to extract the numeric value from the name
      int extractNumericValue(String name) {
        final match = RegExp(r'(\d+)').firstMatch(name);
        return match != null ? int.parse(match.group(0)!) : 0;
      }

      // Sort based on the criteria
      times.sort((a, b) {
        if (_sortCriteria == 'name') {
          return extractNumericValue(a.name).compareTo(extractNumericValue(b.name));
        } else if (_sortCriteria == 'status') {
          return a.status!.compareTo(b.status!);
        }
        return 0;
      });

      return times;
    } catch (e) {
      BuildSnackbar.showSnackbar(context, 'error: $e');
      return [];
    }
  }

  Future<void> _handleRefresh() async {
    setState(() {
      _timesFuture = fetchTimes();
    });
  }

  @override
  void initState() {
    super.initState();
    _timesFuture = fetchTimes();
  }

  void _setSortCriteria(String criteria) {
    setState(() {
      _sortCriteria = criteria;
      _timesFuture = fetchTimes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
      title: 'Times',
      check: true,
      notificationIcon: Icons.add_box_outlined,
      onTapNotification: () async {
        final updatedData = await Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AddTime();
        }));
        if (updatedData != null) {
          setState(() {
            data.add(updatedData);
            _timesFuture = fetchTimes(); // Update _timesFuture with the new data
          });
        }
      },
      bodyWidget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: _sortCriteria,
                  items: [
                    DropdownMenuItem(
                      value: 'name',
                      child: Text('Sort by Name'),
                    ),
                    DropdownMenuItem(
                      value: 'status',
                      child: Text('Sort by Status'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      _setSortCriteria(value);
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Time>>(
              future: _timesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<Time>? data = snapshot.data;
                  return RefreshIndicator(
                    onRefresh: _handleRefresh,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: data?.length,
                        itemBuilder: (context, index) {
                          Time? time = data?[index];
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
                                  final updatedData = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return AddTime(id: time?.id, name: time?.name, status: time?.status);
                                  }));

                                  if (updatedData != null) {
                                    setState(() {
                                      data?[index] = updatedData;
                                      _timesFuture = fetchTimes(); // Update _timesFuture with the new data
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
                                    children: [
                                      CircleAvatar(
                                        child: Text('${index + 1}'),
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        time!.name,
                                        style: GoogleFonts.notoSerifKhmer(fontSize: 18),
                                      ),
                                      Spacer(),
                                      Text(
                                        '${time.status}'.tr(),
                                        style: GoogleFonts.notoSerifKhmer(
                                          fontSize: 18,
                                          color: time.status?.toLowerCase() == 'active'
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
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
