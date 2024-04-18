import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  List<Map<String, dynamic>> data= [];

  @override
  Widget build(BuildContext context) {

    final languageProvider = Provider.of<LanguageProvider>(context);
    data = [
      {"img": "assets/static_images/cambodia.svg", "name": "khmer".tr(), "locale": Locale('km', 'KM')},
      {"img": "assets/static_images/english.svg", "name": "english".tr(), "locale": Locale('en', 'US')},
    ];
    return BuildAppBar(
      title: 'language',
      centerTitle: true,
      bodyWidget: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                languageProvider.changeLanguage(data[index]['locale']);
                Navigator.pop(context);
                // Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                //   MaterialPageRoute( builder: (BuildContext context) {
                //     return MyAppHomePage();
                //   }),(_) => false, );
              });
            },
            child: Container(
              padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 8),
              margin:const EdgeInsets.only(left:12,right: 12,top: 8),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white
              ),
              child: Row(
                children: [
                  Container(
                    width:65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: AssetImage(data[index]['img']),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data[index]['name'], style: GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w500)),
                            Text(
                              languageProvider.currentLocale == data[index]['locale']
                                  ? 'Active'
                                  : 'Inactive',
                              style: GoogleFonts.ubuntu(fontSize: 12, fontWeight: FontWeight.w400, color:languageProvider.currentLocale == data[index]['locale']
                                  ?Colors.green:Colors.grey),
                            ),
                          ],
                        ),
                        languageProvider.currentLocale == data[index]['locale']
                            ? Icon(Icons.check_box_rounded, size: 28, color: Colors.green)
                            : Container(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
