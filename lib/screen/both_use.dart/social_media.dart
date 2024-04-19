import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the package to launch URLs

class SocialMedia extends StatefulWidget {
  const SocialMedia({Key? key}) : super(key: key);

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  List<Map<String, dynamic>> data = [
    {'name': 'Facebook','img':'facebook', 'url': 'https://www.facebook.com/'},
    {'name': 'TikTok','img':'tiktok', 'url': 'https://www.tiktok.com/'},
    {'name': 'Telegram','img':'telegram', 'url': 'https://telegram.org/'},
    {'name': 'YouTube','img':'youtube', 'url': 'https://www.youtube.com/'},
    {'name': 'Website','img':'website', 'url': 'http://thearamot.epizy.com/'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social Media'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _launchURL(data[index]['url']); // Launch URL when tapped
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Image.asset('assets/static_images/${data[index]['img']}.png')
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Text(
                          data[index]['name'],
                          style: GoogleFonts.notoSerifKhmer(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Function to launch URL
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
