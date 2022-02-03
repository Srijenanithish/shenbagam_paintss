import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shenbagam_paints/animation/fadeanimation.dart';

class home extends StatefulWidget {
  static const String routeName = "/homee";

  @override
  homeValidationState createState() => homeValidationState();
}

class homeValidationState extends State<home> {
  List<String> images = [
    'assets/login/homee1.jpg',
    'assets/login/homee2.jpg',
    'assets/login/homee3.png',
  ];
  List<String> image_name = [
    'Grey Mark One Color',
    'BlueGrey Shade Color',
    'Pista Green Color'
  ];

  List<List> color_list = [
    [
      Colors.grey.shade50,
      Colors.grey.shade100,
      Colors.grey.shade200,
      Colors.grey.shade300,
      Colors.grey.shade400,
    ],
    [
      Colors.blueGrey.shade50,
      Colors.blueGrey.shade100,
      Colors.blueGrey.shade200,
      Colors.blueGrey.shade300,
      Colors.blueGrey.shade400,
    ],
    [
      Colors.green.shade50,
      Colors.green.shade100,
      Colors.green.shade200,
      Colors.green.shade300,
      Colors.green.shade400,
    ],
  ];

  int _selectedColor = 0;
  int _selectedSize = 1;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black54,
              title: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: FadeAnimation(
                  1.4,
                  Text(
                    "Shenbagam Paints Welcomes You !",
                    style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          letterSpacing: .5),
                    ),
                  ),
                ),
              ),
              bottom: TabBar(
                tabs: [
                  FadeAnimation(
                    1.4,
                    Text(
                      'WELCOME',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ),
                  FadeAnimation(
                    1.4,
                    Text(
                      'STORES',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(children: [
              FadeAnimation(
                1.4,
                ListView.builder(
                    itemCount: images.length,
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            height: 400,
                            child: Column(
                              children: [
                                Image.asset(
                                  images[index],
                                  width: 600.0,
                                  height: 240.0,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 150, 0),
                                  child: Text(
                                    image_name[index],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Container(
                                    height: 60,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: color_list[index].length,
                                      itemBuilder: (context, index1) {
                                        return GestureDetector(
                                          onTap: () {},
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 300),
                                            margin: EdgeInsets.only(right: 10),
                                            decoration: BoxDecoration(
                                                color: color_list[index]
                                                    [index1],
                                                shape: BoxShape.circle),
                                            width: 40,
                                            height: 40,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
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
                    itemCount: images.length,
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            height: 400,
                            child: Column(
                              children: [
                                Image.asset(
                                  images[index],
                                  width: 600.0,
                                  height: 240.0,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 150, 0),
                                  child: Text(
                                    image_name[index],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Container(
                                    height: 60,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: color_list[index].length,
                                      itemBuilder: (context, index1) {
                                        return GestureDetector(
                                          onTap: () {},
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 300),
                                            margin: EdgeInsets.only(right: 10),
                                            decoration: BoxDecoration(
                                                color: color_list[index]
                                                    [index1],
                                                shape: BoxShape.circle),
                                            width: 40,
                                            height: 40,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ])));
  }
}
