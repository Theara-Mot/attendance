import 'package:attendance/const/app_appBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Director extends StatefulWidget {
  const Director({Key? key}) : super(key: key);

  @override
  State<Director> createState() => _DirectorState();
}

class _DirectorState extends State<Director> {
  int _currentIndex = 0;

  List<Map<String, dynamic>> managementTeam = [
    {
      'name': "លោក សៀង វ៉ាន់ធីម",
      'position': "អនុបណ្ឌិតកំពូល",
      'imageUrl': 'https://picsum.photos/250?image=15',
      'description': 'គាត់ជានិស្សិតជាតិសាសន៍នៅប្រទេសកម្ពុជា ប្រកាសបង្កើតបច្ចុប្បន្នប្រឆាំងនៅសាកលវិទ្យាល័យ កម្ពុជាដែលមានកំរិតខ្ពង់ខ្ពស់បំផុត។ គាត់មានជំនាញនៅក្នុងវិស័យការណ៍សហគមន៍ រាជធានីភ្នំពេញ និងទៅសិក្សានៅសាកលវិទ្យាល័យ ប៊ែលធី អន្តរជាតិ។'
    },
    {
      'name': "លោក សេង វ៉ាន់ធីម",
      'position': "អ្នកនិយោជិករដ្ឋបាល",
      'imageUrl': 'https://picsum.photos/250?image=16',
      'description': 'គាត់ជានិស្សិតជាតិសាសន៍នៅប្រទេសកម្ពុជា ប្រកាសបង្កើតបច្ចុប្បន្នប្រឆាំងនៅសាកលវិទ្យាល័យ កម្ពុជាដែលមានកំរិតខ្ពង់ខ្ពស់បំផុត។ គាត់មានជំនាញនៅក្នុងវិស័យការណ៍សហគមន៍ រាជធានីភ្នំពេញ និងទៅសិក្សានៅសាកលវិទ្យាល័យ ប៊ែលធី អន្តរជាតិ។'
    },
    {
      'name': "លោក សេង វ៉ាន់ធីម",
      'position': "អ្នកជំនាញបច្ចេកទេស",
      'imageUrl': 'https://picsum.photos/250?image=17',
      'description': 'គាត់ជានិស្សិតជាតិសាសន៍នៅប្រទេសកម្ពុជា ប្រកាសបង្កើតបច្ចុប្បន្នប្រឆាំងនៅសាកលវិទ្យាល័យ កម្ពុជាដែលមានកំរិតខ្ពង់ខ្ពស់បំផុត។ គាត់មានជំនាញនៅក្នុងវិស័យការណ៍សហគមន៍ រាជធានីភ្នំពេញ និងទៅសិក្សានៅសាកលវិទ្យាល័យ ប៊ែលធី អន្តរជាតិ។'
    },
    {
      'name': "លោក សសេង វ៉ាន់ធីម",
      'position': "អ្នកគ្រប់គ្រងវិស័យ",
      'imageUrl': 'https://picsum.photos/250?image=18',
      'description': 'គាត់ជានិស្សិតជាតិសាសន៍នៅប្រទេសកម្ពុជា ប្រកាសបង្កើតបច្ចុប្បន្នប្រឆាំងនៅសាកលវិទ្យាល័យ កម្ពុជាដែលមានកំរិតខ្ពង់ខ្ពស់បំផុត។ គាត់មានជំនាញនៅក្នុងវិស័យការណ៍សហគមន៍ រាជធានីភ្នំពេញ និងទៅសិក្សានៅសាកលវិទ្យាល័យ ប៊ែលធី អន្តរជាតិ។'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
      centerTitle: true,
      title: 'ថ្នាក់ដឹកនាំកំពូល',
      bodyWidget: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Expanded(
                child: CarouselSlider.builder(
                  itemCount: managementTeam.length,
                  options: CarouselOptions(
                    height: double.infinity,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    pauseAutoPlayOnTouch: true, // Pause auto-scrolling when touched
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              managementTeam[index]['name'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              managementTeam[index]['imageUrl'],
                              fit: BoxFit.cover,
                              width: 1000,
                              height: 350,
                            ),
                          ),
                          SizedBox(height: 20,),
                          if (_currentIndex == index) ...[
                            Text(
                              managementTeam[index]['position'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              managementTeam[index]['description'],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
