import 'dart:async';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shenbagam_paints/Pages/profile.dart';

import 'package:shenbagam_paints/animation/fadeanimation.dart';

class wallet extends StatefulWidget {
  static const String routeName = "/wallet";

  @override
  walletValidationState createState() => walletValidationState();
}

class walletValidationState extends State<wallet> {
  TextEditingController? _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black54,
          iconTheme: IconThemeData(color: Colors.black54),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: FadeAnimation(
              1.4,
              Text(
                "Wallet",
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                      color: Colors.black54, fontSize: 23, letterSpacing: .5),
                ),
              ),
            ),
          ),
          bottom: TabBar(
            tabs: [
              FadeAnimation(
                1.4,
                Column(
                  children: [
                    Icon(Icons.list, color: Colors.black54),
                    Text(
                      'Ledger',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              FadeAnimation(
                1.4,
                Column(
                  children: [
                    Icon(Icons.notes, color: Colors.black54),
                    Text(
                      'Orders',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              FadeAnimation(
                1.4,
                Column(
                  children: [
                    Icon(Icons.money_off_csred, color: Colors.black54),
                    Text(
                      'Invoices',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FadeAnimation(
              1.4,
              ListView.builder(
                  itemCount: 5,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: Center(
                                  child: Text(
                                    'Ledger Details',
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                                content: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("Invoice No :\n 123456789"),
                                        Text("date\n08-08-2020")
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            "Transport\nNEW MAHAVEER(C.C ATTACHED)"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text("No.of cartons: "),
                                            Text("6")
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Text("Packing Slip Nos: "),
                                            Text("SD -00034")
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Text("Order Nos  "),
                                            Text("291, 272")
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                        child: Text("Rupees : 1,37232.59",
                                            style: TextStyle(
                                              fontSize: 23,
                                            ))),
                                  ],
                                ),
                                actions: [
                                  Center(
                                    child: RaisedButton(
                                        child: Text("Claim Now"),
                                        onPressed: () {
                                          // your code
                                        }),
                                  )
                                ],
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black12,
                                Colors.black12,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          height: 90,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Click for Sample',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            FadeAnimation(
              1.4,
              ListView.builder(
                  itemCount: 5,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: Center(
                                  child: Text(
                                    'Outstanding Details',
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                                content: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("Invoice No :\n 123456789"),
                                        Text("date\n08-08-2020")
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            "Transport\nNEW MAHAVEER(C.C ATTACHED)"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text("No.of cartons: "),
                                            Text("6")
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Text("Packing Slip Nos: "),
                                            Text("SD -00034")
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Text("Order Nos  "),
                                            Text("291, 272")
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                        child: Text("Rupees : 1,37232.59",
                                            style: TextStyle(
                                              fontSize: 23,
                                            ))),
                                  ],
                                ),
                                actions: [
                                  Center(
                                    child: RaisedButton(
                                        child: Text("Claim Now"),
                                        onPressed: () {
                                          // your code
                                        }),
                                  )
                                ],
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black12,
                                Colors.black12,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          height: 90,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Click for Sample',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            FadeAnimation(
              1.4,
              ListView.builder(
                  itemCount: 5,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: Center(
                                  child: Text(
                                    'Invoice Summary',
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                                content: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("Invoice No :\n 123456789"),
                                        Text("date\n08-08-2020")
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            "Transport\nNEW MAHAVEER(C.C ATTACHED)"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text("No.of cartons: "),
                                            Text("6")
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Text("Packing Slip Nos: "),
                                            Text("SD -00034")
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Text("Order Nos  "),
                                            Text("291, 272")
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                        child: Text("Rupees : 1,37232.59",
                                            style: TextStyle(
                                              fontSize: 23,
                                            ))),
                                  ],
                                ),
                                actions: [
                                  Center(
                                    child: RaisedButton(
                                        child: Text("Claim Now"),
                                        onPressed: () {
                                          // your code
                                        }),
                                  )
                                ],
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black12,
                                Colors.black12,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          height: 90,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Click for Sample',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
