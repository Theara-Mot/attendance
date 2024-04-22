import 'package:attendance/const/app_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawerHeader extends StatelessWidget {
  final bool isColapsed;

  const CustomDrawerHeader({
    Key? key,
    required this.isColapsed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 60,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/static_images/s_logo.jpg'))
            ),
          ),
          const SizedBox(width: 5),
          if (isColapsed)
            Expanded(
              flex: 5,
              child: Text(
                'វិទ្យាល័យសម្តេចឪ សម្តេចម៉ែ',
                style: GoogleFonts.notoSerifKhmer(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                maxLines: 1,
              ),
            ),
        ],
      ),
    );
  }
}