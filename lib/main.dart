// @dart=2.9
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shenbagam_paints/Pages/bank_details.dart';
import 'package:shenbagam_paints/Pages/db/database_helper.dart';
import 'package:shenbagam_paints/Pages/model/data.dart';
import 'package:shenbagam_paints/Pages/utils/constants.dart';
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
  List<Note> details;
  bool isLoading = false;

  @override
  void initState() {
    refreshNote();
  }

  Future refreshNote() async {
    this.details = await NotesDatabase.instance.readAllNotes();
  }

  var status;

  MyApp({
    key,
    this.status,
  }) : super(key: key);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    print(status);
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
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: status == true ? Homepage() : MyHomePage());
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
        color: Colors.white, child: Image.asset("assets/login/senn.gif"));
  }
}
