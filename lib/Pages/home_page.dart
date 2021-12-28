import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shenbagam_paints/Pages/explore_products.dart';
import 'package:shenbagam_paints/Pages/my_partners.dart';
import 'package:shenbagam_paints/animation/fadeanimation.dart';
import 'package:shenbagam_paints/Pages/wallet.dart';

class Homepage extends StatefulWidget {
  static const String routeName = "/Homepage";

  @override
  HomepageValidationState createState() => HomepageValidationState();
}

class HomepageValidationState extends State<Homepage> {
  final List<String> imageList = [
    "assets/login/home1.jpg",
    "assets/login/home2.jpeg",
    "assets/login/home3.jpeg",
    "assets/login/home4.jpeg",
    "assets/login/home5.jpeg",
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Shenbagam Paints",
        ),
        // backgroundColor: Colors.white10.withOpacity(0.01),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/login/homebg1.jpeg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              FadeAnimation(
                1.4,
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          //enableInfiniteScroll: false,
                          autoPlay: true,
                        ),
                        items: imageList
                            .map((e) => ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: <Widget>[
                                      Image.asset(
                                        e,
                                        width: 1050,
                                        height: 350,
                                        fit: BoxFit.cover,
                                      )
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              FadeAnimation(
                1.4,
                Card(
                  elevation: 10,
                  clipBehavior: Clip.hardEdge,
                  margin: EdgeInsets.fromLTRB(0, 270, 0, 0),
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(15),
                  // ),
                  // clipBehavior: Clip.antiAlias,
                  child: Row(
                    children: [
                      FadeAnimation(
                        1.6,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 40, 0, 40),
                          child: Container(
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(ExplorePage.routeName)
                                    .then((result) async {
                                  print(result);
                                });
                              },
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 170.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 45, 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons
                                              .production_quantity_limits_sharp,
                                          color: Colors.black54,
                                        ),
                                        Center(
                                          child: Text(
                                            " Explore\nProducts",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      FadeAnimation(
                        1.6,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 40, 0, 40),
                          child: Container(
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(my_partners.routeName)
                                    .then((result) async {
                                  print(result);
                                });
                              },
                              // shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(80.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                // decoration: BoxDecoration(
                                //     gradient: LinearGradient(
                                //       colors: [
                                //         Colors.blueGrey.shade200,
                                //         Colors.blueGrey.shade400
                                //       ],
                                //       begin: Alignment.centerLeft,
                                //       end: Alignment.centerRight,
                                //     ),
                                //     borderRadius: BorderRadius.circular(30.0)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 150.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 15, 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.person_add,
                                          color: Colors.black54,
                                        ),
                                        Text(
                                          "My Partners",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FadeAnimation(
                1.4,
                Padding(
                  padding: const EdgeInsets.only(top: 480),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox.fromSize(
                        size: Size(90, 90), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.purple, // button color
                            child: InkWell(
                              splashColor: Colors.blueGrey, // splash color
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(wallet.routeName)
                                    .then((result) async {
                                  print(result);
                                });
                              }, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.wallet_giftcard,
                                    color: Colors.white,
                                  ), // icon
                                  Text(
                                    "Wallet",
                                    style: TextStyle(color: Colors.white),
                                  ), // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
      drawer: Container(
          width: 250.0,
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: ListTile.divideTiles(context: context, tiles: [
              Container(
                decoration: BoxDecoration(color: Colors.blueGrey.shade100),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  accountName: Text(
                    "Jain Immanual Wilson",
                    style: TextStyle(color: Colors.black),
                  ),
                  currentAccountPicture: CircleAvatar(
                    radius: 50.0,
                    child: Image.asset("assets/login/usericonn.png"),
                  ),
                  accountEmail: Text(
                    "Painter",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                borderOnForeground: true,
                elevation: 0,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: ListTile(
                  leading: Icon(Icons.production_quantity_limits_sharp),
                  title: const Text('Explore Products'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ),
              Card(
                color: Colors.blueGrey.shade100,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                borderOnForeground: true,
                elevation: 0,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: ListTile(
                  leading: Icon(Icons.wallet_giftcard),
                  title: const Text('Wallet'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ),
              Card(
                color: Colors.white,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                borderOnForeground: true,
                elevation: 0,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: const Text('My Partners'),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(my_partners.routeName)
                        .then((result) async {
                      print(result);
                    });
                  },
                ),
              ),
            ]).toList(),
          )),
    );
  }
}






// LiteRollingSwitch(
//                 value: true,
//                 textOn: 'active',
//                 textOff: 'inactive',
//                 colorOn: Colors.deepOrange,
//                 colorOff: Colors.blueGrey,
//                 iconOn: Icons.lightbulb_outline,
//                 iconOff: Icons.power_settings_new,
//                 onChanged: (bool state) {
//                   print('turned ${(state) ? 'on' : 'off'}');
//                 },
//               ),

// Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 350, 0, 0),
//                 child: Center(
//                   child: FlipCard(
//                     direction: FlipDirection.HORIZONTAL,
//                     front: Container(
//                       width: 200,
//                       height: 60,
//                       color: Colors.red,
//                     ),
//                     back: Container(
//                       width: 200,
//                       height: 60,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),
//               ),