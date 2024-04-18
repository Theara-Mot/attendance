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
              image: DecorationImage(image: AssetImage('assets/static_images/logo.png'))
            ),
          ),
          if (isColapsed) const SizedBox(width: 10),
          if (isColapsed)
            Expanded(
              flex: 3,
              child: Text(
                'Smart HR',
                style: GoogleFonts.fascinate(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                maxLines: 1,
              ),
            ),
          if (isColapsed) const Spacer(),
        ],
      ),
    );
  }
}