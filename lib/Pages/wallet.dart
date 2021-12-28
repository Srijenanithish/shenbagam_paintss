import 'dart:async';

import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:shenbagam_paints/animation/fadeanimation.dart';

class wallet extends StatefulWidget {
  static const String routeName = "/wallet";

  @override
  walletValidationState createState() => walletValidationState();
}

class walletValidationState extends State<wallet> {
  TextEditingController? _textEditingController = TextEditingController();
  List<String> Partystatus = [
    'Order Taken',
    'Missing',
    'Order Taken',
    'Missing',
    'Missing',
    'Order Taken',
    'Missing'
  ];
  List<String> PartyList = [
    'Order Taken',
    'Missing',
    'Order Taken',
    'Missing',
    'Missing',
    'Order Taken',
    'Missing'
  ];
  List<String> Location = [
    'Order Taken',
    'Missing',
    'Order Taken',
    'Missing',
    'Missing',
    'Order Taken',
    'Missing'
  ];
  List<String>? PartyListSearch;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  // do something
                },
              )
            ],
            title: Text(
              "Wallet",
            ),
            backgroundColor: Colors.purple,
            bottom: TabBar(
              tabs: [
                Column(
                  children: [
                    Icon(Icons.list),
                    Text(
                      'Ledger',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.notes),
                    Text(
                      'Outstanding',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.money_off_csred),
                    Text(
                      'Invoices',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: _textEditingController!.text.isNotEmpty
                        ? PartyListSearch!.length
                        : PartyList.length,
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
                              children: [],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _textEditingController!.text.isNotEmpty
                        ? PartyListSearch!.length
                        : PartyList.length,
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
                              children: [],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _textEditingController!.text.isNotEmpty
                        ? PartyListSearch!.length
                        : PartyList.length,
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
                              children: [],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
