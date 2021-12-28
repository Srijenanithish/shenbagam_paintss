// @dart=2.9
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shenbagam_paints/Pages/explore_products.dart';
import 'package:shenbagam_paints/Pages/forget_password.dart';
import 'package:shenbagam_paints/Pages/home_page.dart';
import 'package:shenbagam_paints/Pages/login_form.dart';
import 'package:shenbagam_paints/Pages/my_partners.dart';
import 'package:shenbagam_paints/Pages/signup.dart';
import 'package:shenbagam_paints/Pages/wallet.dart';
import 'package:shenbagam_paints/Pages/wallet_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //routes
      routes: {
        LoginForm.routeName: (context) => LoginForm(),
        SignUp.routeName: (context) => SignUp(),
        Forgetpass.routeName: (context) => Forgetpass(),
        Homepage.routeName: (context) => Homepage(),
        my_partners.routeName: (context) => my_partners(),
        ExplorePage.routeName: (context) => ExplorePage(),
        wallet.routeName: (context) => wallet(),
        wallet_view.routeName: (context) => wallet_view(),
      },

      title: 'Shenbagam Paints',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 7),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginForm())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white, child: Image.asset("assets/login/shenbagam.gif"));
  }
}
