// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'dart:convert';
import 'dart:ui' as ui;
import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_snackbar.dart';
import 'package:attendance/const/app_variable.dart';
import 'package:flutter/services.dart';
import 'package:attendance/const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassfQrCode extends StatefulWidget {
  final String name;
  const ClassfQrCode({Key? key, required this.name}) : super(key: key);

  @override
  State<ClassfQrCode> createState() => _ClassfQrCodeState();
}

class _ClassfQrCodeState extends State<ClassfQrCode>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late ScreenshotController _screenshotController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );

    double beginScale = 1.0;
    double middleScale = 1.0;
    double endScale = 1.05;

    // Create separate tweens for each step
    Tween<double> beginTween = Tween<double>(
      begin: beginScale,
      end: middleScale,
    );

    Tween<double> middleTween = Tween<double>(
      begin: middleScale,
      end: endScale,
    );

    Tween<double> endTween = Tween<double>(
      begin: endScale,
      end: beginScale,
    );

    Interval beginInterval = Interval(0.0, 0.33, curve: Curves.easeOut);
    Interval middleInterval = Interval(0.33, 0.67, curve: Curves.easeInOut);
    Interval endInterval = Interval(0.67, 1.00, curve: Curves.easeIn);

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: beginTween.chain(CurveTween(curve: beginInterval)),
        weight: 1.0,
      ),
      TweenSequenceItem<double>(
        tween: middleTween.chain(CurveTween(curve: middleInterval)),
        weight: 1.0,
      ),
      TweenSequenceItem<double>(
        tween: endTween.chain(CurveTween(curve: endInterval)),
        weight: 1.0,
      ),
    ]).animate(_animationController);

    _animationController.forward();

    _screenshotController = ScreenshotController();
    getCurrentlocation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  void _exportAsImage() async {
    final ui.Image? image =
    await _screenshotController.captureAsUiImage(pixelRatio: 15);
    final ByteData? byteData =
    await image!.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List bytes = byteData!.buffer.asUint8List();

    try {
      await ImageGallerySaver.saveImage(bytes);
      BuildSnackbar.showSnackbar(context, 'Image saved to gallery');
    } catch (e) {
      BuildSnackbar.showSnackbar(context, 'Failed: $e');
    }
  }
  double latitude = 0;
  double longitude = 0;
  Future<void> getCurrentlocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      // latitude = position.latitude;
      // longitude = position.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
        title: 'QR Code',
        notificationIcon: Icons.save_alt_rounded,
        check: true,
        centerTitle: true,
        onTapNotification: (){
          if(latitude == 0 && longitude ==0){
            BuildSnackbar.showSnackbar(context, 'Unable to reach location, please restart app and allow the allow location');
          }else{
            _exportAsImage();
          }
        },
        bodyWidget: Screenshot(
          controller: _screenshotController,
          child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: ui.Color.fromARGB(255, 12, 82, 126),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset('assets/static_images/s_logo.jpg'),
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Text(
                          '${GlobalVariable.appName} ${GlobalVariable.companyName}',
                          style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        Text('High School',
                            style: GoogleFonts.philosopher(
                                fontWeight: FontWeight.bold, fontSize: 18)
                        ),
                      ],
                    ),
                  ),

                  Spacer(),
                  Center(
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (BuildContext context, Widget? child) {
                        return Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 20,
                                  spreadRadius: 10,
                                  color: AppColor.primaryColor.withOpacity(0.3),
                                )
                              ],
                              border: Border.all(
                                  width: 1, color: AppColor.primaryColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: PrettyQrView.data(
                              data: jsonEncode({
                                'latitude':latitude,
                                'longitude':longitude,
                                'className':widget.name
                              }),
                              errorCorrectLevel: QrErrorCorrectLevel.Q,
                              decoration: const PrettyQrDecoration(
                                image: PrettyQrDecorationImage(
                                  image: AssetImage(
                                      'assets/static_images/s_logo.jpg'),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Scan your attendance here!',
                          style: GoogleFonts.kurale()),
                      Text('QRCODE',
                          style: GoogleFonts.firaCode(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColor.primaryColor)),
                      Text('Hotline: 071 553 8000 | 096 553 8000',
                          style: GoogleFonts.ubuntu()),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: ui.Color.fromARGB(255, 12, 82, 126),
                  ),
                ],
              )),
        ));
  }
}
