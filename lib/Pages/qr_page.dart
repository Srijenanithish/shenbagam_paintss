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
  String qrResult = '';
  bool pressed = true;
  bool pressed_ = true;
  Future _scanQR() async {
    try {
      qrResult = await BarcodeScanner.scan();
      setState(() {
        pressed = false;
        result = " Wow! Claim Your Rewards !";
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
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
                child: Stack(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 10),
                    child: Container(
                      child: Column(children: [
                        FadeAnimation(
                          1.4,
                          FadeAnimation(
                            1.4,
                            Text(
                              "Scan QR Code",
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 23,
                                    letterSpacing: .5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                          1.4,
                          Card(
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            borderOnForeground: true,
                            elevation: 0,
                            child: Text(
                              result,
                              style: new TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ]),
                    ),
                  ),
                  FadeAnimation(
                      1.4,
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width / 5,
                            0,
                            MediaQuery.of(context).size.width / 5,
                            0),
                        child: FlatButton(
                          minWidth: 190,
                          child: Text('SCAN'),
                          onPressed: pressed
                              ? () {
                                  _scanQR();
                                }
                              : null,
                          color: Colors.purple.shade200,
                          splashColor: Colors.green,
                          disabledColor: Colors.black12,
                          disabledTextColor: Colors.blueGrey,
                        ),
                      )),
                  FadeAnimation(
                      1.4,
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width / 5,
                            0,
                            MediaQuery.of(context).size.width / 5,
                            0),
                        child: FlatButton(
                          minWidth: 190,
                          child: Text('CLAIM REWARDS'),
                          onPressed: pressed_ ? () {} : null,
                          color: Colors.purple.shade200,
                          splashColor: Colors.green,
                          disabledColor: Colors.black12,
                          disabledTextColor: Colors.blueGrey,
                        ),
                      )),
                ],
              ),
            ])))

        //onPressed: _scanQR,
        );
  }
}
