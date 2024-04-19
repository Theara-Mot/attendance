import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class MainDegree extends StatefulWidget {
  const MainDegree({super.key});

  @override
  State<MainDegree> createState() => _MainDegreeState();
}

class _MainDegreeState extends State<MainDegree> {
  List<Map<String, dynamic>> data = [
    {
      'data':'ថ្នាក់ទី ៧',
      'content':''
    }
  ];
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(title: 'main_degree', bodyWidget: Padding(
      padding: EdgeInsets.all(12),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.only(bottom: 5),
            padding: EdgeInsets.all(8),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red
            ),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white
                  ),
                  child: Lottie.asset('assets/static_images/degree.json',repeat: false,reverse: true),
                ),
                Expanded(child: Container(
                  child: Text(''),
                ))
              ],
            ),
          );
        },
      ),
    ));
  }
}
