// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';
import 'dart:math';
import 'package:attendance/const/app_dimension.dart';
import 'package:attendance/const/app_color.dart';
import 'package:attendance/const/app_font.dart';
import 'package:attendance/const/app_variable.dart';
import 'package:attendance/screen/both_use.dart/add_leave.dart';
import 'package:attendance/screen/both_use.dart/history.dart';
import 'package:attendance/screen/both_use.dart/main_degree.dart';
import 'package:attendance/screen/both_use.dart/my_team.dart';
import 'package:attendance/screen/both_use.dart/qr_code.dart';
import 'package:attendance/screen/both_use.dart/todo_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'both_use.dart/news.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage>with SingleTickerProviderStateMixin {
  @override
void dispose() {
  _animationController.dispose();
  super.dispose();
}
  bool _isAnimationStopped = false;
  // ignore: non_constant_identifier_names
  bool _checkin_out = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  List<Map<String, dynamic>> about = [];
  List<Map<String, dynamic>> data = [];
  final CarouselController _carouselController = CarouselController();
  final CarouselController _imageController = CarouselController();
  
  int _currentIndex = 0;
  int _imageIndex = 0;
  @override
  void initState() {
    super.initState();
    
    Timer(Duration(milliseconds: 3700), () {
      setState(() {
        _isAnimationStopped = true; 
      });
    });
    Timer(Duration(milliseconds: 4150), () {
      setState(() {
        _checkin_out = true; 
      });
    });
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    double beginScale = 1.0;
    double middleScale = 1.0;
    double endScale = 1.2;
    Tween<double> beginTween = Tween<double>(
      begin: beginScale,
      end: middleScale,
    );

    Tween<double> middleTween = Tween<double>(
      begin: middleScale,
      end: endScale,
    );

    Tween<double> endTween = Tween<double>(
      begin: endScale,
      end: beginScale,
    );

    Interval beginInterval = Interval(0.0, 0.33, curve: Curves.easeOut);
    Interval middleInterval = Interval(0.33, 0.67, curve: Curves.easeInOut);
    Interval endInterval = Interval(0.67, 1.00, curve: Curves.easeIn);

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: beginTween.chain(CurveTween(curve: beginInterval)),
        weight: 1.0,
      ),
      TweenSequenceItem<double>(
        tween: middleTween.chain(CurveTween(curve: middleInterval)),
        weight: 1.0,
      ),
      TweenSequenceItem<double>(
        tween: endTween.chain(CurveTween(curve: endInterval)),
        weight: 1.0,
      ),
    ]).animate(_animationController);

    _animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    data = [
    {
      'icon': 'requst_leave',
      'name': 'request_leave',
      'page': const AddLeave()
    },
    {
      'icon': 'leave_done',
      'name': 'history',
      'page':const History(),
    },
    {
      'icon': 'requst_leave',
      'name': 'my_department',
      'page':const MyTeam()
    }];
    about = [
    {
      'icon': 'degree',
      'name': 'news',
      'page':const News()
    },
    {
      'icon': 'degree',
      'name': 'main_degree',
      'page':const MainDegree()
    },
    {
      'icon': 'social_media',
      'name': 'social_media',
      'page':const MyTeam()
    },
    {
      'icon': 'social_media',
      'name': 'website',
      'page':const MyTeam()
    },
    {
      'icon': 'top_student',
      'name':'top_student',
      'page':const MyTeam()
    },
    {
      'icon': 'social_media',
      'name': 'about',
      'page':const MyTeam()
    },
    {
      'icon': 'top_student',
      'name': 'Director',
      'page':const MyTeam()
    }];
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(AppDimension.radius10),
          margin: EdgeInsets.all(AppDimension.radius8),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(AppDimension.radius10*3),
            backgroundBlendMode: BlendMode.colorBurn,
            image: DecorationImage(
                image: AssetImage(GlobalVariable.logoPath),
            )
          ),
        ),
        backgroundColor: Color.fromARGB(255, 29, 95, 136),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "វិទ្យាល័យសម្តេចឪ-ម៉ែ (រតនគិរី)",
              style: GoogleFonts.notoSerifKhmer(fontSize: AppDimension.font20,color: Colors.white,fontWeight: FontWeight.w500),
            ),
            Text('Samdech Ov-Mae​ High School',
              style: GoogleFonts.ubuntu(fontSize: AppDimension.font20,color: Colors.white,fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          Icon(Icons.notifications_active,color: Colors.white,),
          SizedBox(width: AppDimension.width10,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: AppDimension.height8/2, bottom: AppDimension.height8/2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppDimension.radius10),
              ),
              child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          child: StreamBuilder<DateTime>(
            stream: Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now()),
            builder: (context, snapshot) {
              final dateTime = snapshot.data;
              final formattedDateTime = dateTime != null
              ? DateFormat('EEE, dd-MM-yyyy hh:mm:ss a').format(dateTime)
              : 'Loading...';
              return Text(
                formattedDateTime,
                textAlign: TextAlign.center,
                style:  GoogleFonts.blackOpsOne (
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColor.primaryColor,
                ),
              );
            },
          ),
        ),
      ),
            ),
            SizedBox(height:AppDimension.height20),
            SizedBox(
              child: Row(
                children: [
                  Expanded(child: Container(
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimension.radius8),
                      color: Colors.white
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppDimension.radius8),
                            topRight: Radius.circular(AppDimension.radius8),
                          )
                        ),child: Center(child: Text('check_in'.tr(),style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.w500,color:Colors.white),)),
                      ),
                      SizedBox(height: AppDimension.height10/2),
                      Text('7:50 ${'am'.tr()}', style: GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w500)),
                        SizedBox(height: AppDimension.height10/2),
                      Text('on_time'.tr(),style: GoogleFonts.ubuntu(fontSize: AppDimension.font16,fontWeight: FontWeight.w400),),
                      SizedBox(height: AppDimension.height10/2),
                    ]),
                  )),
                  SizedBox(width: AppDimension.width10),
                  Expanded(child: Container(
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimension.radius8),
                      color: Colors.white
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppDimension.radius8),
                            topRight: Radius.circular(AppDimension.radius8),
                          )
                        ),child: Center(child: Text('check_out'.tr(),style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.w500,color:Colors.white),)),
                      ),
                      SizedBox(height: AppDimension.height10/2),
                      Text('5:15 ${'pm'.tr()}',style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.w500),),
                      SizedBox(height: AppDimension.height10/2),
                      Text('go_home'.tr(),style: GoogleFonts.ubuntu(fontSize: AppDimension.font16,fontWeight: FontWeight.w400),),
                      SizedBox(height: AppDimension.height10/2),
                    ]),
                  )),
                ],
              )
            ),
            SizedBox(height: AppDimension.height20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppDimension.radius8),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing:8.0,
                  crossAxisSpacing: 8.0,
                    childAspectRatio:1.1
                ),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute( builder: (BuildContext context) { return data[index]['page']; }, ));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color:Colors.white.withOpacity(0.9),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset:const Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColor.primaryColor.withOpacity(0.3),
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/static_images/${data[index]['icon']}.json',
                            width: AppDimension.width10*5.5,
                            height: AppDimension.height10*5.5,
                            animate: !_isAnimationStopped,
                          ),
                          SizedBox(height: AppDimension.height10/2),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                            data[index]['name'].toString().tr(),
                            style: GoogleFonts.ubuntu(
                              fontSize: AppDimension.font15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height:AppDimension.height20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppDimension.margin8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppDimension.radius8),
              ),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Change crossAxisCount to 1 if index == 6
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 1.1,
                    ),
                    itemCount: about.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return about[index]['page'];
                            }),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.primaryColor.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColor.primaryColor.withOpacity(0.3),
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                'assets/static_images/${about[index]['icon']}.json',
                                width: 55,
                                height: 55,
                                repeat: false,
                              ),
                              SizedBox(height: AppDimension.height10 / 2),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  about[index]['name'].toString().tr(),
                                  style: GoogleFonts.ubuntu(
                                    fontSize: AppDimension.font15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
            ]),
        )
      ),
    );
  }
}
