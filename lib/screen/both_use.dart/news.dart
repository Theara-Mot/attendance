import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'news_detail.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  final List<Map<String,dynamic>> newsItems = [
    {
      'title': 'កាលវិភាគ​សិក្សាថ្នាក់ថ្មីចាប់ផ្តើម',
      'body': 'យើងសូមស្វែងរកសិទ្ធិថ្នាក់ថ្មីចាប់ផ្តើមហើយ។ យើងសូមស្វែងយល់និយោជិកទាំងអស់ទិន្នន័យនៅថ្នាក់ថ្មី និងសូមផ្នែកជំនាញនិងបុគ្គលិកនៅថ្នាក់ថ្មីប្រាប់នឹងបង្ហាញនូវឆមាសថ្នាក់ថ្មីរបស់ពួកយើងមានសម្រាប់បទរកចំណីជាឆ្នេរម្នាក់មុនពេល!'
    },
    {
      'title': 'ការសិក្សារបស់អតិថិជន-គ្រួសារនិស្សិតនិងបុគ្គលិកនៅថ្នាក់ថ្មីនឹងធ្វើនៅថ្ងៃសៅរ៍ថ្ងៃទី២០ ខែមេសា',
      'body': 'ការសិក្សារបស់អតិថិជិជម្រើសារនិស្សិតនិងបុគ្គលិកនៅថ្នាក់ថ្មីនឹងធ្វើនៅថ្ងៃសៅរ៍ ទី២០ ខែមេសា, ពីម៉ោង ៩:០០ ព្រឹក ដល់ ១២:០០ ល្ងាច។ ការនេះគឺជាសាកល្បងសម្រាប់អតិថិជិជម្រើសារដើម្បីសិក្សាពីវត្ថុរបស់កុមារនិងសំណួរជាឆ្នេរ។'
    },
    {
      'title': 'ឆ្នាំសិក្សាថ្មីត្រូវចាប់ផ្តើម',
      'body': 'យើងសូមស្វែងរកការត្រូវចាប់ផ្តើមឆ្នាំសិក្សាថ្មី។ សូមស្វែងយល់ដល់និយោជិកទាំងអស់នៅក្នុងថ្នាក់ថ្មីនិងសូមផ្នែកជំនាញនិងបុគ្គលិកនិងនិស្សិតនៅក្នុងថ្នាក់ថ្មីទាន់សម័យសិក្សារបស់ពួកយើងជាឆ្នេរ។'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
      centerTitle: true,
      title: 'News',
      bodyWidget: ListView.builder(
        itemCount: newsItems.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return NewDetail();
              }));
            } ,
            child: Container(
            margin: EdgeInsets.only(left: 12,right: 12,top: 10),
            padding: EdgeInsets.all(10),
            height: 130,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage('assets/static_images/poster.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(newsItems[index]['title'],overflow: TextOverflow.ellipsis,style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w600,fontSize:16
                        )),
                        Expanded(
                          child: Text(newsItems[index]['body'],overflow: TextOverflow.fade,style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w400,fontSize:14,color:Colors.grey
                          )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('18 April 2024',textAlign: TextAlign.left,style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.w400,fontSize:14,color:Colors.grey
                            )),
                            Icon(Icons.arrow_forward_ios_outlined,size: 14,color: Colors.grey,)
                          ],
                        )
                      ],
                    )
                  ),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
