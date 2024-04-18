import 'package:attendance/const/app_dimension.dart';
import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_buildCard.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/screen/auth/local_auth_screen.dart';
import 'package:attendance/screen/profile_menu/about.dart';
import 'package:attendance/screen/profile_menu/guideline.dart';
import 'package:attendance/screen/profile_menu/language.dart';
import 'package:attendance/screen/profile_menu/password.dart';
import 'package:attendance/screen/profile_menu/system_update.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffProfilePage extends StatefulWidget {
  const StaffProfilePage({super.key});

  @override
  State<StaffProfilePage> createState() => _StaffProfilePageState();
}

class _StaffProfilePageState extends State<StaffProfilePage> {
  bool showSalary = false;
  
  void showPopupMenu(BuildContext context) {
    showMenu(
      clipBehavior: Clip.hardEdge,
      shadowColor:AppColor.primaryColor.withOpacity(0.4),
      color:Colors.white,
      context: context,
      position:const RelativeRect.fromLTRB(100, 100, 0, 0),
      items: [
        PopupMenuItem(
          value: "password",
          child: Column(
            children: [
              Row(
                children: [
                Icon(Icons.lock),
                SizedBox(width: 15,),
                Text("password".tr())
              ],),
              Divider()
            ],
          )
        ),
        PopupMenuItem(
          value: "language",
          child: Column(
            children: [
              Row(
                children: [
                Icon(Icons.language),
                SizedBox(width: 15,),
                Text("language".tr())
              ],),
              Divider()
            ],
          )
        ),
        PopupMenuItem(
          value: "system_update",
          child: Column(
            children: [
              Row(
                children: [
                Icon(Icons.system_update),
                SizedBox(width: 15,),
                Text("system_update".tr())
              ],),
              Divider()
            ],
          )
        ),
        PopupMenuItem(
          value: "guideline",
          child: Column(
            children: [
              Row(
                children: [
                Icon(Icons.notes_outlined),
                SizedBox(width: 15,),
                Text("guideline".tr())
              ],),
              Divider()
            ],
          )
        ),
        PopupMenuItem(
          value: "about",
          child: Column(
            children: [
              Row(
                children: [
                Icon(Icons.info),
                SizedBox(width: 15,),
                Text("about".tr())
              ],),
              Divider()
            ],
          )
        ),
        PopupMenuItem(
          value: "logout",
          child: Column(
            children: [
              Row(
                children: [
                Icon(Icons.logout),
                SizedBox(width: 15,),
                Text("logout".tr())
              ],),
              Divider()
            ],
          )
        ),
      ],
    ).then((value) {
      if (value == "password") {
        Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute( builder: (BuildContext context) { return PasswordScreen(); }, ));
      } else if (value == "about") {
        // Navigator.of(context, rootNavigator: true).pushAndRemoveUntil( 
        //   MaterialPageRoute( builder: (BuildContext context) { return About(); }, ), (_) => false, );
        Navigator.of(context, rootNavigator: true).push( 
          MaterialPageRoute(
            builder: (BuildContext context) {
              return About();
            }));
      }else if(value == 'language'){
        Navigator.of(context, rootNavigator: true).push( 
          MaterialPageRoute( builder: (BuildContext context) { return Language(); }, ));
      }else if(value == 'logout'){
        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil( 
          MaterialPageRoute( builder: (BuildContext context) { return LocalAuthScreen(); }, ), (_) => false, );
      }else if(value == 'system_update'){
        Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute( builder: (BuildContext context) { return SystemUpdate(); }, ));
      }else if(value == 'guideline'){
        Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute( builder: (BuildContext context) { return Guideline(); }, ));
      }
    });
  }
  late DateTime joinDate;
  @override
  void initState() {
    super.initState();
    joinDate = DateTime(2022, 7, 18);
  }
  String getWorkAnniversary() {
    final today = DateTime.now();
    final duration = today.difference(joinDate);
    final years = duration.inDays ~/ 365;
    final months = (duration.inDays % 365) ~/ 30;
    final days = (duration.inDays % 365) % 30;

    return "$years ${'years'.tr()}, $months ${'months'.tr()}, $days ${'days'.tr()}";
  }
  @override
  Widget build(BuildContext context) {
    print(AppDimension.screenWidth);
    print(AppDimension.height10);
    print(AppDimension.height10*1.6);
    return  BuildAppBar(
      isShowBack:false,
      centerTitle: true,
      notificationIcon: Icons.menu,
      check: true,
      onTapNotification: (){
        showPopupMenu(context);
      },
      title: 'profile', bodyWidget: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/static_images/theara.jpg',),
              ),
              SizedBox(height: 16.0),
              Text(
                'Mot Sotheara',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Flutter Developer',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              BuildCard(
                leadingIcon: Icons.email,
                name:'email',
                data: 'thearamot@gmail.com',
              ),
              BuildCard(
                leadingIcon: Icons.phone,
                name:'phone',
                data: '+855 71 553 8000',
              ),
              BuildCard(
                leadingIcon: Icons.calendar_today,
                name: 'dob',
                data: 'January 1, 1990',
              ),
              BuildCard(
                leadingIcon: Icons.calendar_today,
                name: 'pob',
                data: 'Village, Commune, Phnom Penh, Cambodia',
              ),
              BuildCard(
                leadingIcon: Icons.male,
                name: 'gender',
                data: 'male',
              ),
              Container(
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Row(children:[
                  ...[
                    Icon(Icons.monetization_on),
                    SizedBox(width: 10),
                  ],
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            'salary'.tr(),
                            style: GoogleFonts.notoSerifKhmer(color: Colors.black54,fontSize: 14),
                          ),
                          Text(' : '),
                          Text(
                            showSalary ?'\$5000':'- - - - - - -',
                            style: GoogleFonts.notoSerifKhmer(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
              onTap: () {
                setState(() {
                  showSalary = !showSalary;
                });
              },
              child: Icon(!showSalary? Icons.remove_red_eye :CupertinoIcons.eye_slash)
            ),
                ]),
              ),
              BuildCard(
                leadingIcon: Icons.date_range,
                name: 'joined_date',
                data: '03-October-2000',
              ),
              BuildCard(
                leadingIcon: Icons.analytics_outlined,
                name: 'Work Anniversary',
                data: getWorkAnniversary(),
              ),
            ],
          ),
        ),
      ));
  }
}