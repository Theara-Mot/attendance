import 'package:attendance/const/app_buildButton.dart';
import 'package:attendance/const/app_variable.dart';
import 'package:attendance/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/app_color.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController accountController;
  late TextEditingController passwordController;
  bool _obscureText = true;
  bool rememberMe = false;
  _saveToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userType = passwordController.text.toLowerCase();
    if (userType == 'user' || userType == 'admin') {
      GlobalVariable.userType = userType;
      await prefs.setString('userType', userType);
    } else {
      print('Invalid user type entered');
    }
  }

  @override
  void initState() {
    super.initState();
    accountController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    accountController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  GlobalVariable.appName,
                  style: GoogleFonts.fascinate(
                    fontSize: 35,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  GlobalVariable.companyName,
                  style: GoogleFonts.monoton(
                    fontSize: 30,
                    color: AppColor.primaryColor,
                  ),
                ),
                const SizedBox(height: 80),
                TextField(
                  controller: accountController,
                  style: GoogleFonts.ubuntu(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'account'.tr(),
                    hintStyle: GoogleFonts.ubuntu(fontSize: 18),
                    prefixIcon: Icon(Icons.person_outline,size: 30,color: Colors.black54,),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  style: GoogleFonts.ubuntu(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: _obscureText, // Hide or display password
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        !_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off,size: 30,color: Colors.black54,
                      ),
                    ),
                    hintText: 'password'.tr(),
                    hintStyle: GoogleFonts.ubuntu(fontSize: 18),
                    prefixIcon: Icon(Icons.lock_outlined,size: 30,color: Colors.black54,),
                  ),
                ),
                const SizedBox(height: 30),
                BuildButton(text: 'login', function: (){
                  // _saveToSharedPreferences();
                  //GlobalVariable.userType = passwordController.text.toLowerCase();
                  GlobalVariable.userType = 'admin';
                  //FocusScope.of(context).unfocus();
                  if(GlobalVariable.userType == 'admin' || GlobalVariable.userType == "user"){
                    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                      MaterialPageRoute( builder: (BuildContext context) { return MyAppHomePage(); }, ), (_) => false, );
                  }else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor:AppColor.primaryColor,
                        elevation:0,
                        content: Text('Your snackbar message here'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                }),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(GlobalVariable.dev_name,
                        style: GoogleFonts.fascinate(color: Colors.grey.withOpacity(0.15))
                    ),
                    const SizedBox(width: 5,),
                    Text('version'.tr(),
                        style: GoogleFonts.ubuntu(color: Colors.grey.withOpacity(0.3))
                    ),
                    const SizedBox(width: 5,),
                    Text('1.1.1',
                        style: GoogleFonts.ubuntu(color: Colors.grey.withOpacity(0.3))
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
