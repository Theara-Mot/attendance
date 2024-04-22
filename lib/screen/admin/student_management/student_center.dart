import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_buildCard.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/const/build_input_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentCenter extends StatefulWidget {
  const StudentCenter({Key? key}) : super(key: key);

  @override
  _StudentCenterState createState() => _StudentCenterState();
}

class _StudentCenterState extends State<StudentCenter> {
  String convertKey(String key) {
    switch (key) {
      case 'name_kh':
        return 'Name KH';
      case 'name_en':
        return 'Name EN';
      case 'id':
        return 'Student ID';
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
      case 'ethnicity':
        return 'Ethnicity';
      case 'nationality':
        return 'Nationality';
      case 'religion':
        return 'Religion';
      case 'f_name':
        return 'Father\'s Name';
      case 'f_job':
        return 'Father\'s Job';
      case 'f_phone':
        return 'Father\'s Phone';
      case 'm_name':
        return 'Mother\'s Name';
      case 'm_job':
        return 'Mother\'s Job';
      case 'm_phone':
        return 'Mother\'s Phone';
      case 'residence':
        return 'Residence';
      case 'avatar':
        return 'Avatar';
      default:
        return key;
    }
  }
  Map<String, dynamic> data = {};
  bool isEditing = false;
  late Map<String, dynamic> editedData;
  TextEditingController student_id = TextEditingController();
  TextEditingController phone = TextEditingController();
  void toggleEditMode() {
    setState(() {
      isEditing = !isEditing;
      if (isEditing) {
        editedData = Map.from(data);
      }
    });
  }

  void saveChanges() {
    setState(() {
      data = Map.from(editedData);
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
      title: 'student_center',
      bodyWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: BuildInputCard(controller: student_id, hint: 'id')),
                SizedBox(width: 10),
                Expanded(child: BuildInputCard(controller: student_id, hint: 'phone')),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {

                    });
                    data = {
                      'id': '1020',
                      'name_kh': 'សុវណ្ណ ស៊ីណា',
                      'name_en': 'Sovann Sina',
                      'gender': 'Female',
                      'ethnicity':'',
                      'nationality':'',
                      'religion':'',
                      'dob': '1992-11-15',
                      'phone': '+855 1122334455',
                      'pob': 'Kampot, Cambodia',
                      'f_name':'fdas',
                      'f_job':'fdasf',
                      'f_phone':'09876543',
                      'm_name':'fdas',
                      'm_job':'fdasf',
                      'm_phone':'09876543',
                      'residence':'Kampot, Cambodia',
                      'join_date': '2020-08-10',
                      'avatar':'https://picsum.photos/250?image=9',
                      'grade': '10A',
                    };
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.primaryColor,
                    ),
                    child: Center(
                      child: Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            if(data.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        print('Button tapped');
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: AppColor.primaryColor
                          ),
                          child: Text('Attendance',style: GoogleFonts.ubuntu(fontSize:16,color:Colors.white),)),
                    ),
                  GestureDetector(
                    onTap: (){
                      setState(() {

                      });
                      isEditing =! isEditing;
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width/4,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color:AppColor.primaryColor
                      ),
                      child: Text(isEditing?'Save':'Edit',style: GoogleFonts.ubuntu(fontSize:16,color:Colors.white),),
                    ),
                  )
                ],
              ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: data.entries.map((entry) {
                  return !isEditing? BuildCard(
                    name: convertKey(entry.key),
                    data: entry.value.toString(),
                  ):
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: entry.value.toString(),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        style: GoogleFonts.notoSerifKhmer(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration.collapsed(
                          hintText: 'null',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        onChanged: (value) {
                          editedData[entry.key] = value;
                        },
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
