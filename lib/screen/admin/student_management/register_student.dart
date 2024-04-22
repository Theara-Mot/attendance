import 'package:attendance/const/app_appBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/app_buildButton.dart';
import '../../../const/app_color.dart';
import '../../../const/build_input_card.dart';


class RegisterStudent extends StatefulWidget {
  const RegisterStudent({Key? key}) : super(key: key);

  @override
  State<RegisterStudent> createState() => _RegisterStudentState();
}

class _RegisterStudentState extends State<RegisterStudent> {
  List<String> data = [
    'Input Khmer name',
    'Input English name',
    'Input gender',
    'Input ethnicity',
    'Input nationality',
    'Input religion',
    'Input date of birth',
    'Input phone number',
    'Input place of birth',
    'Input father\'s name',
    'Input father\'s job',
    'Input father\'s phone',
    'Input mother\'s name',
    'Input mother\'s job',
    'Input mother\'s phone',
    'Input residence',
    'Input join date',
    'Input grade',
  ];

  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    controllers = List.generate(data.length, (index) => TextEditingController());
  }

  List<String> getFilters() {
    List<String> filters = [];
    for (int i = 0; i < data.length; i++) {
      String filter = controllers[i].text??'';
      filters.add(filter);
    }
    return filters;
  }

  TextStyle style = GoogleFonts.notoSerifKhmer(fontSize: 15, fontWeight: FontWeight.w500, color: AppColor.primaryColor);

  Widget textContainer(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 5),
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BuildAppBar(title: 'register_student', bodyWidget: SingleChildScrollView(
      padding: EdgeInsets.only(left: 8,right: 8,bottom: 10),
      child: Column(
        children: [
          for (int i = 0; i < data.length; i++)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (i == 0) textContainer('Student Information'),
                if (i == 9) textContainer('Father Information'),
                if (i == 12) textContainer('Mother Information'),
                if (i == 15) textContainer('Residence'),
                BuildInputCard(controller: controllers[i], hint: data[i]),
              ],
            ),
          SizedBox(height: 10),
          BuildButton(
            text: 'submit',
            function: () {
              List<String> filters = getFilters();
              print(filters);
            },
          ),
        ],
      ),
    ));
  }
}
