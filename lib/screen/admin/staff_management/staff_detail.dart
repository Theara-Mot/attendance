import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffDetail extends StatelessWidget {
  final Map<String, dynamic> staff;

  const StaffDetail({required this.staff});

  String convertKey(String key) {
    switch (key) {
      case 'name_kh':
        return 'Name KH';
      case 'name_en':
        return 'Name EN';
      case 'id':
        return 'ID';
      case 'department':
        return 'Department';
      case 'email':
        return 'Email';
      case 'phone':
        return 'Phone';
      case 'dob':
        return 'Date of Birth';
      case 'pob':
        return 'Place of Birth';
      case 'salary':
        return 'Salary';
      case 'join_date':
        return 'Join Date';
      case 'gender':
        return 'Gender';
      default:
        return key;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
      centerTitle: true,
      title: '${staff['name_en']} (${staff['name_kh']})', 
      bodyWidget: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity, 
                    height: 190,
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: AppColor.primaryColor,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(staff['avatar']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var entry in staff.entries)
                          if (entry.key != 'avatar')
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${convertKey(entry.key)}:',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '${entry.key == 'salary' ? '******' : entry.value}',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
