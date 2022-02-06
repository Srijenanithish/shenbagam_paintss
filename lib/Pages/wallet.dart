import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shenbagam_paints/Pages/db/database_helper.dart';
import 'package:shenbagam_paints/Pages/model/data.dart';
import 'package:shenbagam_paints/Pages/profile.dart';

import 'package:shenbagam_paints/animation/fadeanimation.dart';

class wallet extends StatefulWidget {
  static const String routeName = "/wallet";

  @override
  walletValidationState createState() => walletValidationState();
}

class walletValidationState extends State<wallet> {
  late List<Note> details;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    this.details = await NotesDatabase.instance.readAllNotes();
    print(details[details.length - 1].api_key);
    print(details[details.length - 1].api_secret);
    wallet_call(details[details.length - 1].api_key,
        details[details.length - 1].api_secret);
  }

  TextEditingController? _textEditingController = TextEditingController();
  Map leger_response = {};
  List ledger_details = [];

  List order_details = [];
  List invoice_details = [];
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
                  itemCount: ledger_details.length,
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
                                    ledger_details[index]['voucher_no'],
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                                content: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Date : ',
                                          style: TextStyle(fontSize: 19),
                                        ),
                                        Text(
                                          ledger_details[index]['date'],
                                          style: TextStyle(fontSize: 17),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Amount : ',
                                          style: TextStyle(fontSize: 19),
                                        ),
                                        Text(
                                          ledger_details[index]['amount'],
                                          style: TextStyle(fontSize: 17),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Earning : ',
                                          style: TextStyle(fontSize: 19),
                                        ),
                                        Text(
                                          ledger_details[index]
                                              ['amount_earned'],
                                          style: TextStyle(fontSize: 17),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Credited : ',
                                          style: TextStyle(fontSize: 19),
                                        ),
                                        Text(
                                          ledger_details[index]
                                              ['credited_amount'],
                                          style: TextStyle(fontSize: 17),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Balance : ',
                                          style: TextStyle(fontSize: 19),
                                        ),
                                        Text(
                                          ledger_details[index]['balance'],
                                          style: TextStyle(fontSize: 17),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
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
                          height: 80,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 30, 0),
                                    child: Text(
                                        ledger_details[index]['voucher_no'],
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 35, 0, 10),
                                    child: Text(
                                        ' -   ' + ledger_details[index]['date'],
                                        style: TextStyle(fontSize: 15)),
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
                  itemCount: order_details.length,
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
                          height: 150,
                          child: Column(
                            children: [
                              Text(ledger_details[index]['voucher_no'],
                                  style: TextStyle(fontSize: 20)),
                              Text(ledger_details[index]['date'],
                                  style: TextStyle(fontSize: 15)),
                              Row(
                                children: [
                                  Text(
                                    'Amount : ',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                  Text(
                                    ledger_details[index]['amount'],
                                    style: TextStyle(fontSize: 1),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Earning : ',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                  Text(
                                    ledger_details[index]['amount_earned'],
                                    style: TextStyle(fontSize: 1),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Credited : ',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                  Text(
                                    ledger_details[index]['credited_amount'],
                                    style: TextStyle(fontSize: 1),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Balance : ',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                  Text(
                                    ledger_details[index]['balance'],
                                    style: TextStyle(fontSize: 1),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
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

  void wallet_call(x, y) async {
    var headers = {
      'Authorization': 'token ' + x.toString() + ':' + y.toString(),
      'Content-Type': "application/json",
      'Accept': "*/*",
      'Connection': "keep-alive"
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://test_senbagam.aerele.in/api/method/senbagam_api.api.get_wallet'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      leger_response = await json.decode(res);

      setState(() {
        ledger_details = leger_response['message']['ledger'];
        order_details = leger_response['message']['quotation'];
        invoice_details = leger_response['message']['sales_invoice'];
      });
      print(leger_response['message']);
      print(order_details);
      print(invoice_details);
      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
