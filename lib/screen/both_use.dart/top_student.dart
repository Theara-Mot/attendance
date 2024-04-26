import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/screen/both_use.dart/top_student_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class TopStudent extends StatefulWidget {
  const TopStudent({super.key});

  @override
  State<TopStudent> createState() => _TopStudentState();
}

class _TopStudentState extends State<TopStudent> {
  List<Map<String, dynamic>> data = [
    {
      'grade': 'ថ្នាក់ទី ៧',
      'content': 'ប្រវត្តិរូបវត្តការសិក្សារបស់ថ្នាក់ទី៧។ បុគ្គលិកនិងនិស្សិតក្នុងថ្នាក់នេះនិងចំណេះដឹងសិក្សាក្នុងអន្តរជាតិនិងមិត្តភាពនិងរសជាតិបង្កើតប្រទេស។'
    },
    {
      'grade': 'ថ្នាក់ទី ៨',
      'content': 'ប្រវត្តិរូបវត្តការសិក្សារបស់ថ្នាក់ទី៨។ ការសិក្សាទៅថ្នាក់ទី ៨ សម្រាប់និស្សិតជាសាធារណៈក្រុមក្រាយនិងមនុស្សជាច្រើននៅកម្ពុជា។'
    },
    {
      'grade': 'ថ្នាក់ទី ៩',
      'content': 'ប្រវត្តិរូបវត្តការសិក្សារបស់ថ្នាក់ទី៩។ និស្សិតនិស្សិតក្នុងថ្នាក់ទី ៩ បានធ្វើអន្តរជាតិពីសាលានិស្សិតរហូតដល់រដ្ឋបាល។'
    },
    {
      'grade': 'ថ្នាក់ទី ១០',
      'content': 'ប្រវត្តិរូបវត្តការសិក្សារបស់ថ្នាក់ទី១០។ ការបញ្ចប់និយោជិកនិស្សិតមានការផ្សារទៅផ្ទះគ្រួសារនិងពួកគាត់នៅពេលវេលាផងដែរ។'
    },
    {
      'grade': 'ថ្នាក់ទី ១១',
      'content': 'ប្រវត្តិរូបវត្តការសិក្សារបស់ថ្នាក់ទី១១។ ការសិក្សាទៅថ្នាក់ទី១១ គឺជាករណីអប្បបរមាកម្មដោយនិស្សិតស្រាវជ្រាវបង្កើតការដឹកជញ្ជា។'
    },
    {
      'grade': 'ថ្នាក់ទី ១២',
      'content': 'ប្រវត្តិរូបវត្តការសិក្សារបស់ថ្នាក់ទី១២។ និស្សិតនិស្សិតស្រាវជ្រាវគឺបានចំណាក់សំគាល់ថាគោលបំណងជាបន្តបន្ទាប់គ្នាទៅកាន់រដ្ឋបាលឬវាបានការផ្លាស់ប្ដូរនូវប្រភេទគណនេយ្យចំណេះដឹងរបស់ពួកគាត់ដោយសេដ្ឋកិច្ចប្រកបដោយភាពគិតថ្លៃ។'
    }];

  @override
  Widget build(BuildContext context) {
    return BuildAppBar(title: 'top_student', bodyWidget: ListView.builder(
      padding: EdgeInsets.all(8),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return TopStudentDetail(grade: data[index]['grade'],);
                }));
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                        width: 50,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Lottie.asset('assets/static_images/degree.json',repeat: false,reverse: true),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Text(
                          data[index]['grade'],
                          style: GoogleFonts.notoSerifKhmer(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
