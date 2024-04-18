import 'dart:io';

import 'package:attendance/const/app_color.dart';
import 'package:attendance/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthScreen extends StatefulWidget {
  const LocalAuthScreen({Key? key}) : super(key: key);

  @override
  _LocalAuthScreenState createState() => _LocalAuthScreenState();
}

class _LocalAuthScreenState extends State<LocalAuthScreen> {
  late Future<bool> authenticated = Future.value(false);
  late List<BiometricType> _availableBiometrics = [];
  late final LocalAuthentication _localAuth = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    BiometricType biometricType = Platform.isAndroid
        ? BiometricType.strong
        : BiometricType.face;
    _authenticateUser(biometricType);
  }

  Future<void> _authenticateUser(BiometricType type) async {
    try {
      _availableBiometrics = await _localAuth.getAvailableBiometrics();
      if (_availableBiometrics.contains(type)) {
        bool auth = await _localAuth.authenticate(
            localizedReason: 'Please login to use SMART HR',
            options:const AuthenticationOptions(
                biometricOnly: false, useErrorDialogs: true, stickyAuth: true));
        if (auth) {
          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil( 
          MaterialPageRoute( builder: (BuildContext context) { return MyAppHomePage(); }, ), (_) => false, );
        } else {
          print('Authentication failed');
        }
      } else {
        print('Authentication method not available');
      }
    } catch (e) {
      print('Error authenticating: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Smart HR',
              style: GoogleFonts.fascinate(fontSize: 35, color: AppColor.primaryColor,fontWeight: FontWeight.w400),
            ),
            Text(
              'ASIA WEILUY',
              style: GoogleFonts.monoton(fontSize: 30, color: AppColor.primaryColor),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                // Use face for iOS, fingerprint for Android
                BiometricType biometricType = Platform.isAndroid
                    ? BiometricType.strong
                    : BiometricType.face;

                _authenticateUser(biometricType);
              },
              child: Icon(
                Platform.isAndroid ? Icons.fingerprint : Icons.face,
                color: AppColor.primaryColor,
                size: 70,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Touch In',
              style: GoogleFonts.ubuntu(fontSize: 18, color: AppColor.primaryColor),
            ),
            const SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}
