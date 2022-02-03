import 'dart:async';

import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shenbagam_paints/animation/fadeanimation.dart';

class qr_page extends StatefulWidget {
  @override
  static const String routeName = "/qr_page";
  qr_pageState createState() {
    return new qr_pageState();
  }
}

class qr_pageState extends State<qr_page> {
  String result = "Scan For Rewards !";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything ";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        // centerTitle: true,
        title: Text(
          "Senbagam Paints",
          style: GoogleFonts.raleway(
            textStyle: TextStyle(
                color: Colors.black54, fontSize: 25, letterSpacing: .5),
          ),
        ),

        // backgroundColor: Colors.white10.withOpacity(0.01),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          FadeAnimation(
            1.4,
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
              child: FadeAnimation(
                1.4,
                Text(
                  "Scan QR Code",
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        color: Colors.black54, fontSize: 23, letterSpacing: .5),
                  ),
                ),
              ),
            ),
          ),
          FadeAnimation(
            1.4,
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Card(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                borderOnForeground: true,
                elevation: 0,
                margin: EdgeInsets.fromLTRB(60, 0, 60, 40),
                child: Text(
                  result,
                  style: new TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ),
          FadeAnimation(
              1.4,
              FlatButton(
                minWidth: 190,
                child: Text('Scan'),
                onPressed: () {
                  _scanQR();
                },
                color: Colors.purple.shade200,
                splashColor: Colors.green,
              )),
        ],
      ),

      //onPressed: _scanQR,
    );
  }
}
