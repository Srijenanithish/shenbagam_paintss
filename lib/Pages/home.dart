import 'dart:async';
import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shenbagam_paints/Pages/edit_profile.dart';
import 'package:shenbagam_paints/Pages/explore_products.dart';
import 'package:shenbagam_paints/Pages/home_page.dart';
import 'package:shenbagam_paints/Pages/my_partners.dart';
import 'package:shenbagam_paints/Pages/profile.dart';
import 'package:shenbagam_paints/Pages/signup.dart';
import 'package:shenbagam_paints/animation/fadeanimation.dart';
import 'package:shenbagam_paints/Pages/wallet.dart';

class Homepage extends StatefulWidget {
  static const String routeName = "/Homepage";

  @override
  HomepageValidationState createState() => HomepageValidationState();
}

class HomepageValidationState extends State<Homepage> {
  late PageController _pageController;
  int _selectedPage = 0;

  List<Widget> pages = [
    home(),
    ExplorePage(),
    wallet(),
    my_partners(),
    profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

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
      body: PageView(
        onPageChanged: (index) => setState(() {
          _selectedPage = index;
        }),
        controller: _pageController,
        children: [...pages],
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedPage,
        showElevation: false,
        onItemSelected: (index) => _onItemTapped(index),
        items: [
          FlashyTabBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 23,
              color: Colors.purple.shade500,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.purple.shade500),
            ),
          ),
          FlashyTabBarItem(
            icon: Icon(
              Icons.production_quantity_limits_sharp,
              size: 23,
              color: Colors.purple.shade500,
            ),
            title: Text(
              'Products',
              style: TextStyle(color: Colors.purple.shade500),
            ),
          ),
          FlashyTabBarItem(
            icon: Icon(
              Icons.wallet_giftcard,
              size: 23,
              color: Colors.purple.shade500,
            ),
            title: Text(
              'Wallet',
              style: TextStyle(color: Colors.purple.shade500),
            ),
          ),
          FlashyTabBarItem(
            icon: Icon(
              Icons.person_add,
              size: 23,
              color: Colors.purple.shade500,
            ),
            title: Text(
              'Partners',
              style: TextStyle(color: Colors.purple.shade500),
            ),
          ),
          FlashyTabBarItem(
            icon: Icon(
              Icons.settings,
              size: 23,
              color: Colors.purple.shade500,
            ),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.purple.shade500),
            ),
          ),
        ],
      ),
      drawer: Container(
          width: 250.0,
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: ListTile.divideTiles(context: context, tiles: [
              Container(
                decoration: BoxDecoration(color: Colors.blueGrey.shade50),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  accountName: Text(
                    "Jain Immanual Wilson",
                    style: TextStyle(color: Colors.black),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50.0,
                    child: Image.asset("assets/login/usericonn.png"),
                  ),
                  accountEmail: Text(
                    "Painter",
                    style: TextStyle(color: Colors.black),
                  ),
                  onDetailsPressed: () {
                    Navigator.of(context)
                        .pushNamed(edit.routeName)
                        .then((result) async {
                      print(result);
                    });
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
                  leading: Icon(Icons.feedback),
                  title: const Text('Feedback'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ),
              Card(
                color: Colors.blueGrey.shade50,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                borderOnForeground: true,
                elevation: 0,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: const Text('Sign Out'),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(profile.routeName)
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