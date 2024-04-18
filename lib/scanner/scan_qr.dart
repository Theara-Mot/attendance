import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/scanner/found_screen.dart';
import 'package:attendance/scanner/qrOverlay.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;
  int _currentIndex = 2;
  void _foundBarCode(Barcode barcode,MobileScannerArguments? args){
    print(barcode);
    if(!_screenOpened){
      final String code = barcode.rawValue??"---";
      _screenOpened = false;
       Navigator.push(context, MaterialPageRoute(builder: (context)=> FoundScreen(value: code, screenClose: _screenWasClosed))).then((value) => print(value));
    }
  }
  void _screenWasClosed(){
    _screenOpened = false;
  }
  @override
  void initState() {
    this._screenWasClosed();
    if (_currentIndex == 3) {
      cameraController.start();
    }else{
      cameraController.stop();
    }
    super.initState();
  }
  @override
  void dispose() {
    cameraController.dispose(); // Dispose the MobileScannerController
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(title: 'Scan Attendance', 
    isShowBack: false,
    centerTitle: true,
    bodyWidget: Stack(
      children: [
        MobileScanner(
              controller: cameraController,
              onDetect: _foundBarCode,
            ),
        QRScannerOverlay(overlayColour: Colors.grey.withOpacity(0.7),)
      ],
    )
    );
  }
}