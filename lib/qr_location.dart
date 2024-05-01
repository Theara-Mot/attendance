import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  String scannedResult = 'No QR code scanned';
  double qrCodeLat = 0;
  double qrCodeLong = 0;
  String qrLocation = '';
  String data = '';
  String test = '';
  String resultdistance='';
  void checkLocation()async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    double currentLatitude = position.latitude;
    double currentLongitude = position.longitude;
    double distanceInMeters = await Geolocator.distanceBetween(
      11.5673583,
      104.9144438,
      currentLatitude,
      currentLongitude,
    );

    setState(() {
      test = '$position';
      resultdistance = '$distanceInMeters';
      print(position);
      print(distanceInMeters);
    });

  }
  @override
  void initState() {
    checkLocation();
    super.initState();
  }

  Future<void> _scanQR() async {
    try {
      String qrResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      setState(() {
        scannedResult = qrResult;
      });
      List<String> locationData = qrResult.split(',');
      double qrLatitude = double.parse(locationData[0]);
      double qrLongitude = double.parse(locationData[1]);
      LocationPermission permission = await Geolocator.requestPermission();
      LocationPermission permissionn = await Geolocator.checkPermission();
      PermissionStatus permissionStatus = await Permission.location.request();
      if (permissionStatus.isGranted) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        double currentLatitude = position.latitude;
        double currentLongitude = position.longitude;
        double distanceInMeters = await Geolocator.distanceBetween(
          qrLatitude,
          qrLongitude,
          currentLatitude,
          currentLongitude,
        );
        print('distanceIn-meters: $distanceInMeters');

        // Assuming a threshold distance of 100 meters
        // if (distanceInMeters <= 1) {
        //   setState(() {
        //     scannedResult = qrResult;
        //     data = 'Successfully';
        //   });
        // } else {
        //   setState(() {
        //     scannedResult = 'Invalid QR code scanned for the current location';
        //     data = 'Incorrect Locaion';
        //   });
        // }
      } else {
        setState(() {
          scannedResult = 'Location permission denied';
        });
      }
    } catch (e) {
      setState(() {
        scannedResult = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String locationData = '${qrCodeLat.toString()},${qrCodeLong.toString()}';
    print(locationData);
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('allow scan'),
            Text('Latitude: $qrCodeLat'),
            Text('Long: $qrCodeLong'),
            QrImageView(
              data:locationData,
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(height: 20.0),
            CupertinoButton(
              onPressed: _scanQR,
              child: Text('Scan QR Code'),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Text(
                'Result: $scannedResult',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'QR Code: 11.5673583, 104.9144438',
            ),
            Text(
              '$test',
            ),
            CupertinoButton(
              onPressed: ()async {
                await Geolocator.requestPermission();
                checkLocation();
              },
              child: Text('DistanceInMeter: $resultdistance'),
            ),
          ],
        ),
      ),
    );
  }
}