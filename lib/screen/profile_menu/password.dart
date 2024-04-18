import 'dart:io';

import 'package:attendance/const/app_appBar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../const/app_variable.dart';

class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool useBiometrics =  GlobalVariable.useBiometric;
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(title: 'password'.tr(),
    centerTitle: true,
      bodyWidget:  Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Container(
              height:50,
              padding: EdgeInsets.symmetric(horizontal: 8),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(30),
               color: Colors.white
             ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('gesture_password'.tr(),
                    style: GoogleFonts.ubuntu(fontSize: 16.0),
                  ),
                  Icon(Icons.arrow_forward_ios_sharp,color: Colors.black54,size: 20,)
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height:50,
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 3),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Platform.isAndroid
                        ? 'turn_on_fingerprint'.tr()
                        : 'turn_on_face_id'.tr(),
                    style: GoogleFonts.ubuntu(fontSize: 16.0),
                  ),
                  Switch(
                    splashRadius:5,
                    value: GlobalVariable.useBiometric,
                    onChanged: (value) {
                      setState(() {
                        GlobalVariable.useBiometric = value;
                      });
                    },
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
