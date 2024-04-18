import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_buildCard.dart';
import 'package:attendance/const/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffCenter extends StatefulWidget {
  const StaffCenter({Key? key}) : super(key: key);

  @override
  _StaffCenterState createState() => _StaffCenterState();
}

class _StaffCenterState extends State<StaffCenter> {
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

  Map<String, dynamic> data = {};

  List<String> db = ['Leave', 'Attendace'];

  bool isEditing = false;
  late Map<String, dynamic> editedData;

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
      title: 'staff_center',
      bodyWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Staff ID',
                      hintStyle: GoogleFonts.ubuntu(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      hintStyle: GoogleFonts.ubuntu(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {

                    });
                    data = {
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
                    };
                  },
                  child: Container(
                    width: 40,
                    height: 40,
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                  ):TextFormField(
                    initialValue: entry.value.toString(),
                    onChanged: (value) {
                      editedData[entry.key] = value;
                    },
                  );
                }).toList(),
              ),
            ),
            if(data.isNotEmpty && !isEditing)
              SizedBox(
                height: 50,
                child: GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 4.5,
                  ),
                  itemCount: db.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print('Button ${index + 1} tapped');
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: AppColor.primaryColor
                          ),
                          child: Text(db[index],style: GoogleFonts.ubuntu(fontSize:16,color:Colors.white),)),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
