// @dart=2.9
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shenbagam_paints/Pages/bank_details.dart';
import 'package:shenbagam_paints/utils/constants.dart';
import 'package:shenbagam_paints/Pages/edit_profile.dart';
import 'package:shenbagam_paints/Pages/explore_products.dart';
import 'package:shenbagam_paints/Pages/forget_password.dart';
import 'package:shenbagam_paints/Pages/home.dart';
import 'package:shenbagam_paints/Pages/home_page.dart';
import 'package:shenbagam_paints/Pages/login_form.dart';
import 'package:shenbagam_paints/Pages/my_partners.dart';
import 'package:shenbagam_paints/Pages/profile.dart';
import 'package:shenbagam_paints/Pages/qr_page.dart';
import 'package:shenbagam_paints/Pages/signup.dart';
import 'package:shenbagam_paints/Pages/wallet.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //sharedpreferences initialised....
  Constants.prefs = await SharedPreferences.getInstance();
  var status = (Constants.prefs.getBool('isLoggedIn') ?? false).toString();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp(
      status: status,
    ));
  });
}

class MyApp extends StatelessWidget {
  var status;

  MyApp({
    key,
    this.status,
  }) : super(key: key);
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
          home.routeName: (context) => home(),
          my_partners.routeName: (context) => my_partners(),
          ExplorePage.routeName: (context) => ExplorePage(),
          wallet.routeName: (context) => wallet(),
          profile.routeName: (context) => profile(),
          qr_page.routeName: (context) => qr_page(),
          edit.routeName: (context) => edit(),
          bank.routeName: (context) => bank()
        },
        title: 'Senbagam Paints',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          //google fonts lato theme...
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(status: status));
  }
}

class MyHomePage extends StatefulWidget {
  // status to set the logged in preference....
  var status;

  MyHomePage({
    Key key,
    this.status,
  }) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
//splashscreen ....
    Timer(
        Duration(seconds: 4),
        widget.status == 'true'
            ? () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => home()))
            : () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginForm())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Image.asset("assets/login/Splash_screen1.gif"));
  }
}
