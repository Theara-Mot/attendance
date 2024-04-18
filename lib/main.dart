// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:attendance/const/app_dimension.dart';
import 'package:attendance/const/app_variable.dart';
import 'package:attendance/screen/admin/leave_management/leave_dashboard.dart';
import 'package:attendance/screen/admin/staff_management/staff_management.dart';
import 'package:attendance/screen/adminHome.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/provider/provider.dart';
import 'package:attendance/scanner/scan_qr.dart';
import 'package:attendance/screen/auth/login.dart';
import 'package:attendance/screen/both_use.dart/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        navigatorKey: AppDimension.navigatorKey,
        home: LoginScreen(),
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
    List<PersistentBottomNavBarItem> items = [
      PersistentBottomNavBarItem(
        textStyle: GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
        icon: Icon(Icons.home),
        title: "home".tr(),
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        textStyle: GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
        icon: const Icon(Icons.qr_code_scanner),
        title: "scan".tr(),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        textStyle: GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
        icon: const Icon(Icons.library_books_outlined),
        title: "leave".tr(),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        textStyle: GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
        icon: const Icon(Icons.person_pin_outlined),
        title: "staff".tr(),
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

    
    if (GlobalVariable.userType != "admin") {
      items.removeAt(3); 
      items.removeAt(2); 
    }
    return items;
  }


  List<Widget> _buildScreens() {
    if (GlobalVariable.userType == "admin") {
      return [
        const AdminHomePage(),
        const ScanQRCode(),
        const LeaveDashboard(),
        const StaffManagement(),
        StaffProfilePage(),
      ];
    } else {
      return [
        const AdminHomePage(),
        const ScanQRCode(),
        StaffProfilePage(),
      ];
    }
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