import 'dart:async';

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:shenbagam_paints/animation/fadeanimation.dart';

class profile extends StatefulWidget {
  static const String routeName = "/profile";

  @override
  profileValidationState createState() => profileValidationState();
}

class profileValidationState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "My Partners",
          ),
          // backgroundColor: Colors.white10.withOpacity(0.01),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/login/usericonn.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    width: double.infinity,
                    height: 200,
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
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Jain Immanual Wilson",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blueGrey,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Tamilnadu , India",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black45,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Painter",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black45,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                    color: Colors.blueGrey,
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    elevation: 2.0,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                        child: Text(
                          "Scan QR code",
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w300),
                        ))),
                SizedBox(
                  height: 15,
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
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
                                    color: Colors.purple,
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
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Icon(
                                Icons.plus_one,
                                size: 22,
                                color: Colors.purple,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "Add Bank Account",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  color: Colors.black12,
                  child: Row(
                    children: [
                      InkWell(
                        child: Container(
                            height: 40,
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 0, 0, 0),
                                  child: Icon(
                                    Icons.settings,
                                    size: 22,
                                    color: Colors.purple,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text(
                                    "Sign Out",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ],
                            )),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                            height: 40,
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 0, 0, 0),
                                  child: Icon(
                                    Icons.feedback,
                                    size: 22,
                                    color: Colors.purple,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text(
                                    "Feedback",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ],
                            )),
                        onTap: () {},
                      ),
                    ],
                  ),
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
