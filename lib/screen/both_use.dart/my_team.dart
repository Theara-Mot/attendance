import 'package:attendance/const/app_dimension.dart';
import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/screen/admin/staff_management/staff_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
class MyTeam extends StatefulWidget {
  const MyTeam({Key? key});

  @override
  State<MyTeam> createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeam> {
  List<Map<String, dynamic>> staffEntries = [
  {
    'name_kh': 'សុវណ្ណ ស៊ីណា',
    'name_en': 'Sovann Sina',
    'id': '1020',
    'department': 'Admin Department',
    'email': 'sovann@example.com',
    'phone': '0717653775',
    'dob': '1992-11-15',
    'pob': 'Kampot, Cambodia',
    'salary': 1700,
    'join_date': '2020-08-10',
    'gender': 'Female',
    'avatar':'https://picsum.photos/250?image=9',
    'staff_upline1': 'Upline 1 Name',
    'staff_upline2': 'Upline 2 Name',
    'staff_upline3': 'Upline 3 Name',
    'locationid': 'Location ID',
    'shiftid': 'Shift ID',
    'position': 'Programmer'
  },
  {
    'name_kh': 'ប៉ុន សំរែង',
    'name_en': 'Pon Samrang',
    'id': '1021',
    'department': 'Human Resources',
    'email': 'pon@example.com',
    'phone': '+855 1122334466',
    'dob': '1990-05-20',
    'pob': 'Phnom Penh, Cambodia',
    'salary': 1900,
    'join_date': '2019-12-05',
    'gender': 'Male',
    'avatar':'https://picsum.photos/250?image=10',
    'staff_upline1': 'Upline 1 Name',
    'staff_upline2': 'Upline 2 Name',
    'staff_upline3': 'Upline 3 Name',
    'locationid': 'Location ID',
    'shiftid': 'Shift ID',
    'position': 'Programmer'
  },
  {
    'name_kh': 'ហួន វីរៈ',
    'name_en': 'Hun Virak',
    'id': '1022',
    'department': 'Finance Department',
    'email': 'hun@example.com',
    'phone': '+855 1122334477',
    'dob': '1985-09-25',
    'pob': 'Siem Reap, Cambodia',
    'salary': 2100,
    'join_date': '2021-03-20',
    'gender': 'Male',
    'avatar':'https://picsum.photos/250?image=11',
    'staff_upline1': 'Upline 1 Name',
    'staff_upline2': 'Upline 2 Name',
    'staff_upline3': 'Upline 3 Name',
    'locationid': 'Location ID',
    'shiftid': 'Shift ID',
    'position': 'Programmer'
  },
  {
    'name_kh': 'ជីវ ជិនណា',
    'name_en': 'Chiv Chinna',
    'id': '1023',
    'department': 'IT Department',
    'email': 'chiv@example.com',
    'phone': '+855 1122334488',
    'dob': '1995-04-12',
    'pob': 'Battambang, Cambodia',
    'salary': 1800,
    'join_date': '2020-06-15',
    'gender': 'Male',
    'avatar':'https://picsum.photos/250?image=12',
    'staff_upline1': 'Upline 1 Name',
    'staff_upline2': 'Upline 2 Name',
    'staff_upline3': 'Upline 3 Name',
    'locationid': 'Location ID',
    'shiftid': 'Shift ID',
    'position': 'Programmer'
  },
  {
    'name_kh': 'ហ៊ុន ស៊ីណា',
    'name_en': 'Hun Sina',
    'id': '1024',
    'department': 'Marketing Department',
    'email': 'hunsina@example.com',
    'phone': '+855 1122334499',
    'dob': '1988-08-30',
    'pob': 'Kandal, Cambodia',
    'salary': 2000,
    'join_date': '2019-10-25',
    'gender': 'Male',
    'avatar':'https://picsum.photos/250?image=13',
    'staff_upline1': 'Upline 1 Name',
    'staff_upline2': 'Upline 2 Name',
    'staff_upline3': 'Upline 3 Name',
    'locationid': 'Location ID',
    'shiftid': 'Shift ID',
    'position': 'Programmer'
  },
  {
    'name_kh': 'ភូមិ ប៊ុនលី',
    'name_en': 'Phoum Bunly',
    'id': '1025',
    'department': 'Sales Department',
    'email': 'bunly@example.com',
    'phone': '+855 1122334500',
    'dob': '1993-02-18',
    'pob': 'Prey Veng, Cambodia',
    'salary': 1800,
    'join_date': '2021-01-12',
    'gender': 'Male',
    'avatar':'https://picsum.photos/250?image=14',
    'staff_upline1': 'Upline 1 Name',
    'staff_upline2': 'Upline 2 Name',
    'staff_upline3': 'Upline 3 Name',
    'locationid': 'Location ID',
    'shiftid': 'Shift ID',
    'position': 'Programmer'
  }];

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredEntries = staffEntries.where((entry) {
      final name = '${entry['name_en']} (${entry['name_kh']})'.toLowerCase();
      return name.contains(_searchQuery.toLowerCase());
    }).toList();
    return BuildAppBar(
      title: 'my_teamates',
      centerTitle: true,
      bodyWidget: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical:8.0,horizontal: 12.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search by name...',
                    hintStyle: GoogleFonts.ubuntu(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppDimension.radius10*3),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                  onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                ),
              ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredEntries.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                     
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StaffDetail(
                          staff: filteredEntries[index],
                        ),
                      ),
                    );
                    
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.25),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(filteredEntries[index]['avatar']),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    '${filteredEntries[index]['name_en']} (${filteredEntries[index]['name_kh']})',
                                    style: GoogleFonts.ubuntu(fontSize: 14, fontWeight: FontWeight.w500),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  '${filteredEntries[index]['position']}',
                                  style: GoogleFonts.ubuntu(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final url = 'tel:${filteredEntries[index]['phone']}';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  final snackBar = SnackBar(

                                    backgroundColor: AppColor.primaryColor,
                                    content: Text('could not lunch $url',style: GoogleFonts.ubuntu(fontSize: 16),),
                                    duration: Duration(seconds: 3),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    child: Center(
                                      child: Icon(Icons.phone_forwarded_sharp, size: 20, color: AppColor.primaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 5,),
                            GestureDetector(
                              onTap: () async {
                                final telegramUrl = 'https://t.me/thearone123';
                                if (await canLaunch(telegramUrl)) {
                                  await launch(telegramUrl);
                                } else {
                                  print('Could not launch $telegramUrl');
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Center(
                                    child: Icon(Icons.telegram, size: 32, color: AppColor.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
