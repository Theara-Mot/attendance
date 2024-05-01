import 'package:attendance/const/app_buildButton.dart';
import 'package:attendance/const/app_dimension.dart';
import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_font.dart';
import 'package:attendance/const/app_snackbar.dart';
import 'package:attendance/provider/provider.dart';
import 'package:attendance/screen/admin/staff_management/staff_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../const/app_color.dart';

class AddStudentToClass extends StatefulWidget {
  const AddStudentToClass({super.key});

  @override
  State<AddStudentToClass> createState() => _AddStudentToClassState();
}

class _AddStudentToClassState extends State<AddStudentToClass> {
  List<Map<String, dynamic>> AddStudentToClass = [
    {
      'name_kh': 'ពេជ្រ គីមហ្វីល',
      'name_en': 'Phearum Kimhuy',
      'id': '1001',
      'department': 'HR Department',
      'email': 'phearum@example.com',
      'phone': '+855 123456789',
      'dob': '1990-01-01',
      'pob': 'Phnom Penh, Cambodia',
      'salary': 1500,
      'join_date': '2020-05-15',
      'gender': 'Male',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'សេង រតនា',
      'name_en': 'Seng Ratana',
      'id': '1002',
      'department': 'IT Department',
      'email': 'ratana@example.com',
      'phone': '+855 987654321',
      'dob': '1992-03-10',
      'pob': 'Siem Reap, Cambodia',
      'salary': 1700,
      'join_date': '2019-12-20',
      'gender': 'Female',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'អ៊ុយ លីហួត',
      'name_en': 'Iy Lihoat',
      'id': '1003',
      'department': 'Finance Department',
      'email': 'iy@example.com',
      'phone': '+855 1122334455',
      'dob': '1988-07-25',
      'pob': 'Battambang, Cambodia',
      'salary': 1800,
      'join_date': '2021-02-28',
      'gender': 'Male',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'អ៊ុក ស៊ីហេង',
      'name_en': 'Ok Siheng',
      'id': '1004',
      'department': 'Operator Department',
      'email': 'ok@example.com',
      'phone': '+855 9988776655',
      'dob': '1995-09-12',
      'pob': 'Kampot, Cambodia',
      'salary': 1600,
      'join_date': '2018-11-10',
      'gender': 'Female',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'ពុក ប៊ុនថន',
      'name_en': 'Pouk Bonthan',
      'id': '1005',
      'department': 'HR Department',
      'email': 'pouk@example.com',
      'phone': '+855 1122334455',
      'dob': '1993-04-30',
      'pob': 'Sihanoukville, Cambodia',
      'salary': 1600,
      'join_date': '2019-08-22',
      'gender': 'Male',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'ស៊ុយ ពេជ្រ',
      'name_en': 'Soy Phearum',
      'id': '1006',
      'department': 'IT Department',
      'email': 'soy@example.com',
      'phone': '+855 9988776655',
      'dob': '1989-12-15',
      'pob': 'Kratie, Cambodia',
      'salary': 1800,
      'join_date': '2020-07-01',
      'gender': 'Male',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'វីរៈ វិសាល់',
      'name_en': 'Virak Visal',
      'id': '1007',
      'department': 'Admin Department',
      'email': 'virak@example.com',
      'phone': '+855 123456789',
      'dob': '1991-05-20',
      'pob': 'Takeo, Cambodia',
      'salary': 1700,
      'join_date': '2019-10-05',
      'gender': 'Male',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'អូន សុភាព',
      'name_en': 'Oun Sopheak',
      'id': '1008',
      'department': 'Cashier Department',
      'email': 'sopheak@example.com',
      'phone': '+855 987654321',
      'dob': '1994-08-18',
      'pob': 'Kandal, Cambodia',
      'salary': 1600,
      'join_date': '2020-03-15',
      'gender': 'Male',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'សុទ្ធារី សុធារី',
      'name_en': 'Sotearith Sotheari',
      'id': '1009',
      'department': 'Operator Department',
      'email': 'sotearith@example.com',
      'phone': '+855 1122334455',
      'dob': '1996-06-05',
      'pob': 'Prey Veng, Cambodia',
      'salary': 1500,
      'join_date': '2018-04-20',
      'gender': 'Female',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'ទ្រី ស៊ុនហុង',
      'name_en': 'Tri Sounhong',
      'id': '1010',
      'department': 'Finance Department',
      'email': 'tri@example.com',
      'phone': '+855 9988776655',
      'dob': '1987-02-25',
      'pob': 'Koh Kong, Cambodia',
      'salary': 1800,
      'join_date': '2020-01-10',
      'gender': 'Male',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'ស៊ុន ស៊ីណាត',
      'name_en': 'Son Sinaet',
      'id': '1011',
      'department': 'HR Department',
      'email': 'sinaet@example.com',
      'phone': '+855 123456789',
      'dob': '1990-09-08',
      'pob': 'Banteay Meanchey, Cambodia',
      'salary': 1600,
      'join_date': '2019-05-25',
      'gender': 'Male',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'ហេង ស៊ីម៉ុត',
      'name_en': 'Heng Simot',
      'id': '1012',
      'department': 'Admin Department',
      'email': 'simot@example.com',
      'phone': '+855 987654321',
      'dob': '1993-11-14',
      'pob': 'Kampong Cham, Cambodia',
      'salary': 1700,
      'join_date': '2020-08-30',
      'gender': 'Male',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'អ៊ុយ ជិនហូរ',
      'name_en': 'Iy Chinhour',
      'id': '1013',
      'department': 'Cashier Department',
      'email': 'chinhour@example.com',
      'phone': '+855 1122334455',
      'dob': '1995-12-28',
      'pob': 'Kampong Speu, Cambodia',
      'salary': 1500,
      'join_date': '2018-11-20',
      'gender': 'Female',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'អូន រដ្ឋា',
      'name_en': 'Oun Roda',
      'id': '1014',
      'department': 'HR Department',
      'email': 'roda@example.com',
      'phone': '+855 9988776655',
      'dob': '1996-07-10',
      'pob': 'Pursat, Cambodia',
      'salary': 1800,
      'join_date': '2019-12-05',
      'gender': 'Female',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'កែវ សេន',
      'name_en': 'Kae Soen',
      'id': '1015',
      'department': 'IT Department',
      'email': 'soen@example.com',
      'phone': '+855 123456789',
      'dob': '1992-04-18',
      'pob': 'Kandal, Cambodia',
      'salary': 1700,
      'join_date': '2020-10-15',
      'gender': 'Male',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'ហេង ចេកពិច',
      'name_en': 'Heng Chea Pich',
      'id': '1016',
      'department': 'HR Department',
      'email': 'heng@example.com',
      'phone': '+855 9988776655',
      'dob': '1994-03-28',
      'pob': 'Battambang, Cambodia',
      'salary': 1600,
      'join_date': '2018-09-20',
      'gender': 'Male',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'ប៊ុន ស៊ីម៉េង',
      'name_en': 'Bun Simeng',
      'id': '1017',
      'department': 'IT Department',
      'email': 'bun@example.com',
      'phone': '+855 1122334455',
      'dob': '1991-08-12',
      'pob': 'Kampong Thom, Cambodia',
      'salary': 1700,
      'join_date': '2019-07-15',
      'gender': 'Female',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'ជា ខេង',
      'name_en': 'Chea Kheng',
      'id': '1018',
      'department': 'Finance Department',
      'email': 'chea@example.com',
      'phone': '+855 123456789',
      'dob': '1988-12-05',
      'pob': 'Preah Vihear, Cambodia',
      'salary': 1800,
      'join_date': '2020-04-28',
      'gender': 'Male',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'វីរៈ អ៊ាងចាន់',
      'name_en': 'Virak Ang Chan',
      'id': '1019',
      'department': 'Operator Department',
      'email': 'virak@example.com',
      'phone': '+855 9988776655',
      'dob': '1993-06-20',
      'pob': 'Koh Kong, Cambodia',
      'salary': 1600,
      'join_date': '2018-11-10',
      'gender': 'Male',
      'avatar':'https://picsum.photos/250?image=9',
      'staff_upline1': 'Upline 1 Name',
      'staff_upline2': 'Upline 2 Name',
      'staff_upline3': 'Upline 3 Name',
      'locationid': 'Location ID',
      'shiftid': 'Shift ID'
    },
    {
      'name_kh': 'សុវណ្ណ ស៊ីណា',
      'name_en': 'Sovann Sina',
      'id': '1020',
      'department': 'Admin Department',
      'email': 'sovann@example.com',
      'phone': '+855 1122334455',
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
      'shiftid': 'Shift ID'
    }];
  List<String> grade = [
    'grade_7',
    'grade_8',
    'grade_9',
    'grade_10',
    'grade_11',
    'grade_12',
  ];
  String selectedGrade = 'January';
  int selectedYear = DateTime.now().year;
  Set<int> selectedIndices = Set<int>();
  List<Map<String, dynamic>> selectedStudents = [];
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return BuildAppBar(
        title: 'student_list',
        bodyWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: AddStudentToClass.length,
                  itemBuilder: (context, index) {
                    final staff = AddStudentToClass[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          // Toggle the selection of the tapped student
                          if (selectedIndices.contains(index)) {
                            selectedIndices.remove(index);
                          } else {
                            selectedIndices.add(index);
                          }
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 5.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: selectedIndices.contains(index)
                              ? AppColor.primaryColor // Change color for selected item
                              : Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                              AssetImage('assets/static_images/s_logo.jpg'),
                            ),
                            const SizedBox(width: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  languageProvider.currentLocale ==
                                      const Locale('km', 'KM')
                                      ? staff['name_kh']
                                      : staff['name_en'],
                                  style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.bold,
                                    color:selectedIndices.contains(index)?Colors.white:Colors.black
                                  ),
                                ),
                                Text(
                                  '${staff['id']} - ${staff['gender']}',
                                  style: GoogleFonts.ubuntu(
                                      color:selectedIndices.contains(index)?Colors.white:Colors.black
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                              color:selectedIndices.contains(index)?Colors.white:Colors.grey,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              BuildButton(
                text: 'Submit',
                function: () {
                  selectedStudents.clear();
                  selectedIndices.forEach((index) {
                    selectedStudents.add(AddStudentToClass[index]);
                  });
                  if(selectedStudents.isNotEmpty){
                    BuildSnackbar.showSnackbar(context, 'added_successfully !');
                    Navigator.pop(context);
                  }else{
                    BuildSnackbar.showSnackbar(context, 'no student_is_added');
                    Navigator.pop(context);
                  }
                },
              ),
              SizedBox(height: 10)
            ],
          ),
        ));
  }
}