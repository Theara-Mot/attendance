import 'package:attendance/const/app_appBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/app_color.dart';

class AboutSchool extends StatefulWidget {
  const AboutSchool({super.key});

  @override
  State<AboutSchool> createState() => _AboutSchoolState();
}

class _AboutSchoolState extends State<AboutSchool> {
  Map<String,dynamic> data = {
    'header':"ប្រវត្តិវិទ្យាល័យសម្តេចឪ សម្តេចម៉ែ",
    'content':"""
    សាកលវិទ្យាល័យ ប៊ែលធី អន្តរជាតិ គឺជាគ្រឹះស្ថានអប់រំឧត្តមសិក្សាឯកជនមួយ ដែលបានចាប់បដិសន្ធឡើងនៅថ្ងៃទី៤ ខែសីហា ឆ្នាំ២០០៥ ដោយផ្តើមចេញពីវិទ្យាស្ថាន ប៊ែលធី អន្តរជាតិ និងបានអភិវឌ្ឍទៅជាសាកលវិទ្យាល័យ ប៊ែលធី អន្តរជាតិ នៅថ្ងៃទី៦ ខែកញ្ញា ឆ្នាំ២០១២។ សាកលវិទ្យាល័យប៊ែលធី អន្តរជាតិ ត្រូវបានសម្ពោធដាក់ឱ្យប្រើប្រាស់ជាផ្លូវការ នៅថ្ងៃទី២១ ខែសីហា ឆ្នាំ២០១៤ ក្រោមអធិបតីភាពដ៏ខ្ពង់ខ្ពស់ សម្តេចអគ្គមហាសេនាបតីតេជោ ហ៊ុន សែន នាយករដ្ឋមន្ត្រី នៃព្រះរាជាណាចក្រកម្ពុជា។
សាកលវិទ្យាល័យ មានឈ្មោះពេញជាភាសាខ្មែរ “សាកលវិទ្យាល័យ ប៊ែលធី អន្តរជាតិ”និងជាភាសាអង់គ្លេស “BELTEI INTERNATIONAL UNIVERSITY”ហើយឈ្មោះ “BELTEI” នេះផ្គុំទ្បើងដោយ ៦មុខជំនាញធំៗដូចជា “BEL” មកពីពាក្យ Business, Economics, Law និង “TEI” មកពីពាក្យ Tourism, English, Information Technology ។
ឯកឧត្តមបណ្ឌិត លី ឆេង បច្ចុប្បន្នជាតំណាងរាស្ត្រមណ្ឌល រាជធានីភ្នំពេញ ជាអគ្គនាយក ប៊ែលធីគ្រុប និងជាប្រធានក្រុមប្រឹក្សាភិបាល សាកលវិទ្យាល័យ ប៊ែលធី អន្តរជាតិ គឺជាស្ថាបនិកតែម្នាក់គត់ ដែលបាន វិនិយោគទុនក្នុងការបង្កើត និងសាងសង់អគារសាកលវិទ្យាល័យ ប៊ែលធី អន្តរជាតិ ទាំងអស់នេះ។
បច្ចុប្បន្ន សាកលវិទ្យាល័យមាន ២ទីតាំង នៅរាជធានីភ្នំពេញ ដែល កំពុងដំណើរការកម្មវិធី២ធំៗ (កម្មវិធីសិក្សាជា ភាសាជាតិ និងកម្មវិធី សិក្សា អន្តរជាតិ) មាន ១២មហាវិទ្យាល័យ និង ៤២ជំនាញ៖
- សាកលវិទ្យាល័យ ប៊ែលធី អន្តរជាតិ ទីតាំងទី ១ ទួលស្លែង៖ អគារ២១ ផ្លូវ៣៦០ សង្កាត់បឹងកេងកង៣ ខណ្ឌបឹងកេងកង រាជធានី ភ្នំពេញ (ខាងត្បូងសារមន្ទីរទួលស្លែង១០០ម៉ែត្រ) អគារមានកម្ពស់១៥ ជាន់ស្មើនឹង១១០បន្ទប់ មានសាលសហសិក្សា១ ចំណុះ១៥០នាក់ និង សាលសន្និសីទ១ ចំណុះ៧០០នាក់ មានអាហារដ្ឋាន១កន្លែង បណ្ណាល័យ១ និងចំណតយានយន្ត២ជាន់។
- សាកលវិទ្យាល័យ ប៊ែលធី អន្តរជាតិ ទីតាំងទី ២ ស្ពានអាកាសចោមចៅ៖ អគារ១៥១ ផ្លូវជាតិលេខ៣ សង្កាត់ចោមចៅទី២ ខណ្ឌពោធិ៍សែនជ័យ រាជធានីភ្នំពេញ (ចម្ងាយប្រហែល ៥០០ម៉ែត្រ ពី ស្ពានអាកាសចោមចៅ) អគារកម្ពស់៩ជាន់ ស្មើនឹង១៤២បន្ទប់ មានសាលសហសិក្សា១ចំណុះ១៥០នាក់ សាលមហោស្រព១ ចំណុះ៨០០នាក់ និងសាលសន្និសីទ១ ចំណុះ១,២០០នាក់ មានអាហារដ្ឋាន១កន្លែង បណ្ណាល័យ១ មានអគារអន្តេវាសិកដ្ឋាន១ ខ្នង ស្មើនឹង៦៥បន្ទប់មាន គ្រែចំនួន១៣០ និងមានចំណតយានយន្តជាង១០,០០០ ម៉ែត្រការ៉េ។
    """
  };
  List<String> items =[
    'https://picsum.photos/250?image=15',
    'https://picsum.photos/250?image=16',
    'https://picsum.photos/250?image=17',
    'https://picsum.photos/250?image=18',
    'https://picsum.photos/250?image=19',
    'https://picsum.photos/250?image=20',
    'https://picsum.photos/250?image=20',
    'https://picsum.photos/250?image=20',
  ];
  CarouselController _carouselController = CarouselController();

// Function to stop auto-scroll after the first cycle
  void stopAutoScroll() {
    _carouselController.stopAutoPlay();
  }

// Use this function as onPageChanged callback
  void onPageChangedCallback(int index, CarouselPageChangedReason reason) {
    if (index == items.length - 1 && reason == CarouselPageChangedReason.timed) {
      stopAutoScroll();
    }
  }
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
        centerTitle: true,
        title: 'about',
        bodyWidget: Padding(
          padding: EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                Text(data['header'],textAlign: TextAlign.justify,style: GoogleFonts.notoSerifKhmer(fontSize:20,fontWeight:FontWeight.w600,color:AppColor.primaryColor),),
                SizedBox(height: 30,),
                Container(
                  height: 180,
                  width: double.infinity,
                  child: CarouselSlider(
                    carouselController: _carouselController,
                    items: items.map((data) {
                      return Container(
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            data,
                            fit: BoxFit.cover,
                            width: 1000,
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      pauseAutoPlayOnTouch: true, // Pause auto-scrolling when touched
                      onPageChanged: onPageChangedCallback, // Use the defined callback
                      scrollDirection: Axis.horizontal,
                    ),
                  )
                ),
                SizedBox(height: 30,),
                Text(data['content'],textAlign: TextAlign.justify,style: GoogleFonts.notoSerifKhmer(fontSize:14,fontWeight:FontWeight.w400),)
              ],
            ),
          ),
        )
    );
  }
}
