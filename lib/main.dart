// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:attendance/const/app_dimension.dart';
import 'package:attendance/const/app_variable.dart';
import 'package:attendance/provider/local_storage.dart';
import 'package:attendance/qr_location.dart';
import 'package:attendance/screen/admin/leave_management/leave_homepage.dart';
import 'package:attendance/screen/admin/staff_management/staff_homepage.dart';
import 'package:attendance/screen/admin/student_management/student_homepage.dart';
import 'package:attendance/screen/adminHome.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/provider/provider.dart';
import 'package:attendance/scanner/scan_qr.dart';
import 'package:attendance/screen/auth/login.dart';
import 'package:attendance/screen/both_use.dart/profile.dart';
import 'package:attendance/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:motion/motion.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
final  navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Geolocator.requestPermission();
  await Motion.instance.initialize();
  Motion.instance.requestPermission();
  Motion.instance.setUpdateInterval(60.fps);
  runApp(EasyLocalization(
    supportedLocales:const [
      Locale('en', 'US'),
      Locale('km', 'KM'),
    ],
    path: 'assets/translations',
    fallbackLocale: Locale('en','US'),
    startLocale: Locale('en', 'US'),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<String?> getToken()async{
    LocalStorage localStorage  = LocalStorage();
    String? t = await localStorage.getData('token');
    if (t != null) {
      print('Token: $t');
    } else {
      print('Token not found');
    }
    return t;
  }
  @override
  Widget build(BuildContext context) {
    String token =getToken().toString();
    print(token);
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(context),
      child: MaterialApp(
        localizationsDelegates:context.localizationDelegates ,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: GlobalVariable.appName,
        debugShowCheckedModeBanner: false,
        theme:ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor:AppColor.primaryColor),
          useMaterial3: true,
        ),
        // navigatorKey: navigatorKey,
        home:SplashScreen(),
        navigatorKey: AppDimension.navigatorKey,
      ),
    );
  }
}
     
class MyAppHomePage extends StatefulWidget {
  const MyAppHomePage({Key? key}) : super(key: key);

  @override
  _MyAppHomePageState createState() => _MyAppHomePageState();
}

class _MyAppHomePageState extends State<MyAppHomePage> {
  
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    List<PersistentBottomNavBarItem> items = [];
    if (GlobalVariable.userType == "user") {
      items = [
        PersistentBottomNavBarItem(
          textStyle: GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
          icon: Icon(Icons.home),
          title: "home".tr(),
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          textStyle: GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
          icon: Icon(Icons.person),
          title: "profile".tr(),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    } else if(GlobalVariable.userType == "admin") {
      items = [
        PersistentBottomNavBarItem(
          textStyle: GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
          icon: Icon(Icons.home),
          title: "home".tr(),
          activeColorPrimary: AppColor.primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          textStyle: GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
          icon: const Icon(Icons.library_books_outlined),
          title: "schedule".tr(),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          textStyle: GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
          icon: const Icon(Icons.perm_contact_cal_sharp),
          title: "staff".tr(),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          textStyle: GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
          icon: const Icon(Icons.person_pin),
          title: "student".tr(),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          textStyle: GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
          icon: Icon(Icons.person),
          title: "profile".tr(),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }
    return items;
  }


  List<Widget> _buildScreens() {
    List<Widget> screens = [];

    if (GlobalVariable.userType == "user") {
      screens = [
        AdminHomePage(),
        StaffProfilePage(),
      ];
    }  if(GlobalVariable.userType == "admin") {
      screens = [
        AdminHomePage(),
        LeaveHomePage(),
        StaffManagement(),
        StudentHomePage(),
        StaffProfilePage(),
      ];
    }

    return screens;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          navBarStyle : NavBarStyle.style1
      ),
    );
  }

}