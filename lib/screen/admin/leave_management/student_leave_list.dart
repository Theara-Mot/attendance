import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/app_color.dart';

class StudentLeaveList extends StatefulWidget {
  const StudentLeaveList({Key? key}) : super(key: key);

  @override
  _StudentLeaveListState createState() => _StudentLeaveListState();
}

class _StudentLeaveListState extends State<StudentLeaveList> {
  List<Map<String, dynamic>> data = [
    {'id':1,'name':'មុត សុធារ៉ា','gender':'Male','grade':'12 A1','duration':'3days','date':'01/01/2024 - 03/01/2024'},
    {'id':2,'name':'សេង ស៊ីម៉ង់','gender':'Male','grade':'12 A1','duration':'3days','date':'02/01/2024 - 04/01/2024'},
    {'id':3,'name':'ស៊ូ កូដីកា','gender':'Female','grade':'10 C3','duration':'4days','date':'03/01/2024 - 05/01/2024'},
    {'id':4,'name':'មាស បូរ៉ា','gender':'Male','grade':'11 B2','duration':'5days','date':'04/01/2024 - 06/01/2024'},
    {'id':5,'name':'វិរិច សារុន','gender':'Female','grade':'10 C3','duration':'6days','date':'05/01/2024 - 07/01/2024'},
    {'id':6,'name':'កាញារ៉ា បាន','gender':'Male','grade':'7 C2','duration':'7days','date':'06/01/2024 - 08/01/2024'},
    {'id':7,'name':'ថនិកា ជ័យ','gender':'Female','grade':'6 A2','duration':'8days','date':'07/01/2024 - 09/01/2024'},
    {'id':8,'name':'បាន សារិន','gender':'Male','grade':'5 B1','duration':'9days','date':'08/01/2024 - 10/01/2024'},
    {'id':9,'name':'ស៊ុន ចំរើន','gender':'Male','grade':'4 C1','duration':'10days','date':'09/01/2024 - 11/01/2024'},
    {'id':10,'name':'កែវ សុគន្ធា','gender':'Female','grade':'3 A3','duration':'11days','date':'10/01/2024 - 12/01/2024'},
    {'id':11,'name':'អ៊ុយ វិធីតា','gender':'Male','grade':'2 B2','duration':'12days','date':'11/01/2024 - 13/01/2024'},
    {'id':12,'name':'រស់ ខឿត','gender':'Male','grade':'1 C1','duration':'13days','date':'12/01/2024 - 14/01/2024'},
    {'id':13,'name':'សិរីវ តូតេត','gender':'Female','grade':'K3','duration':'14days','date':'13/01/2024 - 15/01/2024'},
    {'id':14,'name':'បូ វីហ្សា','gender':'Female','grade':'K3','duration':'15days','date':'14/01/2024 - 16/01/2024'},
    {'id':15,'name':'សាត វិច្ឆិកា','gender':'Male','grade':'K1','duration':'16days','date':'15/01/2024 - 17/01/2024'},
  ];


  @override
  Widget build(BuildContext context) {
    String? previousGrade;
    return BuildAppBar(title: 'student_leave_list', bodyWidget: ListView.builder(
      padding: EdgeInsets.all(9),
      itemCount: data.length,
      itemBuilder: (context, index) {
        bool displayContainer = false;
        if (data[index]['grade'] != previousGrade) {
          displayContainer = true;
          previousGrade = data[index]['grade'];
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(index != 0 && displayContainer)
              const SizedBox(height: 20,),
            if (displayContainer)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 5.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color:AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Grade ${data[index]['grade']}',
                  style: GoogleFonts.notoSerifKhmer(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color:Colors.white
                  ),
                ),
              ),

            Container(
              margin: const EdgeInsets.only(bottom: 5.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/static_images/s_logo.jpg'),
                  ),
                  const SizedBox(width: 15.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index]['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        '${data[index]['gender']}',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Colors.grey,)
                ],
              ),
            ),
          ],
        );
      },
    ));
  }
}
