import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_font.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'news_detail.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  final List<String> newsItems = [
    'News Item 1',
    'News Item 2',
    'News Item 3',
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
                        Text(newsItems[index],style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w600,fontSize:16
                        )),
                        Text(newsItems[index],style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w400,fontSize:14,color:Colors.grey
                        )),
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
