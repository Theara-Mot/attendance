import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopStudentDetail extends StatefulWidget {
  final String grade;
  const TopStudentDetail({Key? key, required this.grade}) : super(key: key);

  @override
  State<TopStudentDetail> createState() => _TopStudentDetailState();
}

class _TopStudentDetailState extends State<TopStudentDetail> {
  final List<Map<String, dynamic>> dataList = [
    {
      'name': 'មុត សុធារ៉ា',
      'gender': 'ប្រុស',
      'price': '44.90',
      'imageUrl': 'https://i.pravatar.cc/150?img=1',
    },
    {
      'name': 'សេង វ៉ាន់ធីម',
      'gender': 'ស្រី',
      'price': '32.50',
      'imageUrl': 'https://i.pravatar.cc/150?img=2',
    },
    {
      'name': 'លី សេរីឌីណា',
      'gender': 'ប្រុស',
      'price': '56.20',
      'imageUrl': 'https://i.pravatar.cc/150?img=3',
    },
    {
      'name': 'ជឹម សារិន្ត',
      'gender': 'ស្រី',
      'price': '39.99',
      'imageUrl': 'https://i.pravatar.cc/150?img=4',
    },
    {
      'name': 'ការិន សារីយ៉ា',
      'gender': 'ប្រុស',
      'price': '49.99',
      'imageUrl': 'https://i.pravatar.cc/150?img=5',
    },
  ];

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  String selectedMonth = 'January';
  int selectedYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
        title: widget.grade,
        bodyWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  PopupMenuButton<int>(
                    initialValue: DateTime.now().year,
                    onSelected: (int value) {
                      setState(() {
                        selectedYear = value;
                      });
                    },
                    itemBuilder: (BuildContext context) {
                      return List.generate(5, (index) {
                        return PopupMenuItem<int>(
                          value: DateTime.now().year - index,
                          child: Text((DateTime.now().year - index).toString()),
                        );
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        selectedYear.toString(),
                        style: GoogleFonts.ubuntu(color:Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 35, // Set a fixed height for the SizedBox
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: months.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedMonth = months[index];
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: selectedMonth == months[index]
                                      ? AppColor.primaryColor
                                      : Colors.grey[300]!,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  months[index],
                                  style: TextStyle(
                                    color: selectedMonth == months[index]
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    final item = dataList[index];
                    return Stack(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(top: 25, left: 25, bottom: 10,right: 25),
                          margin: EdgeInsets.only(bottom: 10),
                          width: double.infinity,
                          height: 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: index.isEven
                              ? Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(item['imageUrl']),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              item['name'],
                                              style: GoogleFonts.notoSerifKhmer(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              item['gender'],
                                              style: GoogleFonts.notoSerifKhmer(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              item['price'],
                                              style: GoogleFonts.notoSerifKhmer(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              item['name'],
                                              style: GoogleFonts.notoSerifKhmer(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              item['gender'],
                                              style: GoogleFonts.notoSerifKhmer(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              item['price'],
                                              style: GoogleFonts.notoSerifKhmer(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Container(
                                      width: 80,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(item['imageUrl']),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                        Positioned(
                          right: index.isOdd ? 0 : null,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                AssetImage('assets/static_images/star.png'),
                            child: Text(
                              '${index + 1}',
                              style: GoogleFonts.notoSerifKhmer(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
