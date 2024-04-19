import 'package:attendance/const/app_color.dart';
import 'package:attendance/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/app_appBar.dart';

class NewDetail extends StatefulWidget {
  const NewDetail({super.key});

  @override
  State<NewDetail> createState() => _NewDetailState();
}

class _NewDetailState extends State<NewDetail> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
      centerTitle: true,
      title: 'new_detail',
      bodyWidget: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Text('សូមស្វែង យល់ពីសិទ្ធរឿង ចិញ្ចឹមនៅប្រទេសកម្ពុជា សូមស្វែងយល់ពីសិទ្ធ រឿងចិញ្ចឹមនៅប្រទេសកម្ពុជា',textAlign: TextAlign.justify,style: GoogleFonts.notoSerifKhmer(fontSize:16,fontWeight:FontWeight.w600,color:AppColor.primaryColor),),
            SizedBox(height: 5,),
            Text('Post: 18 Apr 2024',style: GoogleFonts.notoSerifKhmer(fontSize:12,fontWeight:FontWeight.w500),),
            SizedBox(height: 30,),
            Text('សូមស្វែងយល់ពីសិទ្ធរឿងចិញ្ចឹមនៅប្រទេសកម្ពុជា។ ក្រុមហ៊ុនរក្សាសិទ្ធិអាសន្ននិងជំនាញនៅប្រទេសកម្ពុជាបន្តិចបើកដល់អ្នកនិពន្ធនារីដើម្បីប្រើប្រាស់ចំនួនមុនពេលនិងការប្រើប្រាស់ដល់អ្នកប្រើប្រាស់ផ្សេងគ្នានៅប្រទេសកម្ពុជាដោយមានថ្លៃដើម្បីពន្យល់ចំណេះដឹងរបស់អ្នកប្រើប្រាស់។ លោកអ្នកអាចប្រើប្រាស់ប្រភពចំណេះដឹងដើម្បីបង្ហាញពីការបញ្ជាទិញទិញទុកដុំនិងការដុនប្រទះទៅនិងចំនួនដឹកនាំដល់ប្រទេសកម្ពុជាវិញនិងក្នុងប្រទេសនៅពេលណាមួយដែលចង់និពន្ធនារី។',textAlign: TextAlign.justify,style: GoogleFonts.khmer(fontSize:14,fontWeight:FontWeight.w400),)
          ],
        ),
      )
    );
  }
}