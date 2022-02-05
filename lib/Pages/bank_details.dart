import 'dart:async';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shenbagam_paints/Pages/profile.dart';

import 'package:shenbagam_paints/animation/fadeanimation.dart';

class bank extends StatefulWidget {
  static const String routeName = "/bank";

  @override
  bankValidationState createState() => bankValidationState();
}

class bankValidationState extends State<bank> {
  TextEditingController? _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
        iconTheme: IconThemeData(color: Colors.black54),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: FadeAnimation(
            1.4,
            Text(
              "Bank Details",
              style: GoogleFonts.raleway(
                textStyle: TextStyle(
                    color: Colors.black54, fontSize: 23, letterSpacing: .5),
              ),
            ),
          ),
        ),
      ),
      body: FadeAnimation(
        1.4,
        Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Row(
            children: [
              Container(
                height: 150,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(bank.routeName)
                        .then((result) async {
                      print(result);
                    });
                  },
                  child: Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 8),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Icon(
                                Icons.add,
                                size: 22,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Add Bank account",
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
              ),
              Container(
                height: 150,
                child: InkWell(
                  onTap: () {},
                  child: Card(
                    color: Colors.white70,
                    margin:
                        EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 4),
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
                            "View Existing\nAccount",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
