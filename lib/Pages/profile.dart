import 'dart:async';

import 'dart:math';
import 'dart:io';
import 'dart:convert';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shenbagam_paints/Pages/edit_profile.dart';
import 'package:shenbagam_paints/Pages/qr_page.dart';

import 'package:shenbagam_paints/animation/fadeanimation.dart';

class profile extends StatefulWidget {
  static const String routeName = "/profile";

  @override
  profileValidationState createState() => profileValidationState();
}

class profileValidationState extends State<profile> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _hasBeenPressed = true;
  get prefixIcon => null;
  TextEditingController Mobilenum = TextEditingController();
  TextEditingController username_ = TextEditingController();
  final String _content =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum diam ipsum, lobortis quis ultricies non, lacinia at justo.';

  void _shareContent() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            content: Form(
              autovalidate: true,
              key: formkey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                        controller: Mobilenum,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            prefixIcon: prefixIcon ?? Icon(Icons.phone),
                            border: UnderlineInputBorder(),
                            contentPadding: EdgeInsets.all(16),
                            labelText: 'Mobile Number',
                            hintText: 'Enter your Mobile Number'),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                          MinLengthValidator(10,
                              errorText:
                                  "Mobile Number should be 10 characters"),
                        ])),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextFormField(
                        controller: username_,
                        decoration: InputDecoration(
                            prefixIcon: prefixIcon ?? Icon(Icons.person),
                            border: UnderlineInputBorder(),
                            contentPadding: EdgeInsets.all(16),
                            labelText: 'Name',
                            hintText: 'Enter your Name'),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                          MinLengthValidator(4,
                              errorText:
                                  "Username should be atleast 4 characters"),
                        ])),
                  ),
                ],
              ),
            ),
            actions: [
              Center(
                child: RaisedButton(
                    child: Text("Share"),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        Share.share(_content);
                      }
                    }),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 20, 190, 0),
                  child: FadeAnimation(
                    1.4,
                    Text(
                      "Profile",
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 23,
                            letterSpacing: .5),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(edit.routeName)
                        .then((result) async {
                      print(result);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: FadeAnimation(
                      1.4,
                      Icon(Icons.edit),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: FadeAnimation(
                    1.4,
                    Text("Edit"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            FadeAnimation(
              1.4,
              Container(
                child: FadeAnimation(
                  1.4,
                  Container(
                    width: double.infinity,
                    height: 100,
                    child: Container(
                      alignment: Alignment(0.0, 2.5),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage("assets/login/usericonn.png"),
                        radius: 60.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FadeAnimation(
              1.4,
              Text(
                "Jain Immanual Wilson",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.blueGrey,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FadeAnimation(
              1.4,
              Text(
                "Tamilnadu , India",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FadeAnimation(
              1.4,
              Text(
                "Painter",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            FadeAnimation(
              1.4,
              Row(
                children: [
                  Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Icon(
                                Icons.book,
                                size: 22,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Bank Account",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _shareContent();
                    },
                    child: Card(
                      color: Colors.white70,
                      margin:
                          EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 4, 40, 4),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Icon(
                                  Icons.share,
                                  size: 22,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "Share",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            FadeAnimation(
              1.4,
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(qr_page.routeName)
                          .then((result) async {
                        print(result);
                      });
                    },
                    child: Card(
                      color: Colors.white70,
                      margin:
                          EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Icon(
                                  Icons.qr_code,
                                  size: 22,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "Scan QR Code",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 8, 21, 8),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Icon(
                                Icons.comment_bank,
                                size: 22,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Feeb Back",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),

            // Card(
            //     color: Colors.blueGrey,
            //     margin:
            //         EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            //     elevation: 2.0,
            //     child: Padding(
            //         padding:
            //             EdgeInsets.symmetric(vertical: 12, horizontal: 30),
            //         child: Text(
            //           "Settings",
            //           style: TextStyle(
            //               color: Colors.white,
            //               letterSpacing: 2.0,
            //               fontWeight: FontWeight.w300),
            //         ))),
            // RaisedButton(
            //   onPressed: () {},
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(80.0),
            //   ),
            //   child: Ink(
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //           begin: Alignment.centerLeft,
            //           end: Alignment.centerRight,
            //           colors: [Colors.pink, Colors.redAccent]),
            //       borderRadius: BorderRadius.circular(30.0),
            //     ),
            //     child: Container(
            //       constraints: BoxConstraints(
            //         maxWidth: 100.0,
            //         maxHeight: 40.0,
            //       ),
            //       alignment: Alignment.center,
            //       child: Text(
            //         "Settings",
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 12.0,
            //             letterSpacing: 2.0,
            //             fontWeight: FontWeight.w300),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    ));
  }
}
