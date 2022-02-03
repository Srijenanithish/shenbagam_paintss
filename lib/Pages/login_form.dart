import 'dart:async';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shenbagam_paints/Pages/forget_password.dart';
import 'package:shenbagam_paints/Pages/home.dart';
import 'package:shenbagam_paints/Pages/signup.dart';
import 'package:shenbagam_paints/animation/fadeanimation.dart';

class LoginForm extends StatefulWidget {
  static const String routeName = "/login";

  @override
  LoginFormValidationState createState() => LoginFormValidationState();
}

class LoginFormValidationState extends State<LoginForm> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  get prefixIcon => null;

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 4) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }

  @override
  String stringResponse = '0';
  Map Mapresponse = {};
  Map dataResponse = {};
  TextEditingController mobilenum = TextEditingController();

  TextEditingController password_ = TextEditingController();
  bool _passwordVisible = false;
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(

            // By defaut, Scaffold background is white
            // Set its value to transparent

            body: Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: SingleChildScrollView(
                    child: FadeAnimation(
                      1.4,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FadeAnimation(
                            1.4,
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 100, 0, 0),
                              child: Text(
                                'Senbagam Paints',
                                style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 40,
                                      letterSpacing: .5),
                                ),
                              ),
                            ),
                          ),
                          FadeAnimation(
                            1.4,
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 150, 0),
                              child: Text(
                                'LOGIN',
                                style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      letterSpacing: .5),
                                ),
                              ),
                            ),
                          ),
                          FadeAnimation(
                            1.4,
                            Container(
                              width: double.infinity,
                              height: 150,
                              child: FadeAnimation(
                                1.4,
                                Container(
                                  alignment: Alignment(0.0, 2.5),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(
                                        "assets/login/usericonn.png"),
                                    radius: 60.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Form(
                              autovalidate: true,
                              key: formkey,
                              child: Column(children: <Widget>[
                                FadeAnimation(
                                  1.4,
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 50, 40, 0),
                                    child: TextFormField(
                                      controller: mobilenum,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          prefixIcon: prefixIcon ??
                                              Icon(
                                                Icons.person,
                                                color: Colors.purple.shade200,
                                              ),
                                          border: UnderlineInputBorder(
                                              borderSide: new BorderSide(
                                                  color: Colors.red)),
                                          labelText: 'Mobile Number',
                                          contentPadding: EdgeInsets.all(16),
                                          hintText: 'Enter your Mobile Number'),
                                      validator: MultiValidator([
                                        RequiredValidator(
                                            errorText: "* Required"),
                                        MinLengthValidator(10,
                                            errorText:
                                                "Mobile Number should be 10 characters"),
                                      ]),
                                    ),
                                  ),
                                ),
                                FadeAnimation(
                                  1.4,
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40,
                                        right: 40,
                                        top: 15,
                                        bottom: 0),
                                    child: TextFormField(
                                        controller: password_,
                                        obscureText: !_passwordVisible,
                                        decoration: InputDecoration(
                                            prefixIcon: prefixIcon ??
                                                Icon(
                                                  Icons.password_sharp,
                                                  color: Colors.purple.shade200,
                                                ),
                                            border: UnderlineInputBorder(),
                                            labelText: 'Password',
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _passwordVisible =
                                                      !_passwordVisible;
                                                });
                                              },
                                              child: Icon(
                                                _passwordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: Colors.purple.shade200,
                                              ),
                                            ),
                                            contentPadding: EdgeInsets.all(16),
                                            fillColor: Colors.black12,
                                            hintText: 'Enter secure password'),
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: "* Required"),
                                          MinLengthValidator(4,
                                              errorText:
                                                  "Password should be atleast 6 characters"),
                                          MaxLengthValidator(15,
                                              errorText:
                                                  "Password should not be greater than 15 characters")
                                        ])),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Container(
                                      child: FlatButton(
                                    child: Text('Forget Password ?'),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed(Forgetpass.routeName)
                                          .then((result) async {
                                        print(result);
                                      });
                                    },
                                    textColor: Colors.blueAccent,
                                  )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                FadeAnimation(
                                    1.4,
                                    FlatButton(
                                      minWidth: 190,
                                      child: Text('LOGIN'),
                                      onPressed: () {
                                        if (formkey.currentState!.validate()) {
                                          loginup(mobilenum, password_);
                                          // Navigator.of(context)
                                          //     .pushNamed(Homepage.routeName)
                                          //     .then((result) async {
                                          //   print(result);
                                          // });
                                        }
                                      },
                                      color: Colors.purple.shade200,
                                      splashColor: Colors.green,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    child: FlatButton(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blueGrey,
                                      wordSpacing: 4,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(SignUp.routeName)
                                        .then((result) async {
                                      print(result);
                                    });
                                  },
                                  textColor: Colors.blueGrey,
                                )),
                              ])),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    )));
  }

  loginup(mobilenum, password_) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://test_senbagam.aerele.in/api/method/senbagam_api.api.login'));
    request.body = json.encode({
      "args": {
        "username": mobilenum.text.toString().trim(),
        "password": password_.text.toString().trim()
      }
    });

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      Mapresponse = await json.decode(res);
      dataResponse = Mapresponse['message'];
      print(dataResponse['name']);
      Navigator.of(context).pushNamed(Homepage.routeName, arguments: {
        "api_key": dataResponse['api_key'],
        "api_secret": dataResponse['api_secret'],
        "name": dataResponse['name'],
        "dob": dataResponse['dob'],
        "mobile": dataResponse['mobile_no'],
        "email": dataResponse['email'],
        "address": dataResponse['address'],
        "city": dataResponse['city'],
        "district": dataResponse['district'],
        "referred_by": dataResponse['Refered_by'],
        "gstin": dataResponse['gstin'],
        "pincode": dataResponse['pincode'],
        "roles": dataResponse['roles']
      }).then((result) async {
        print(result);
      });

      //  print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
// var headers = {
//       'Content-Type': 'application/json',
//       'Cookie':
//           'full_name=Sudarshan; sid=16236599778de0894ec7d32a8dc5dcea121bafe45db44cf5ec5772d4; system_user=no; user_id=frankel9675%40gmail.com; user_image='
//     };
//     var request = http.Request(
//         'GET',
//         Uri.parse(
//             'http://test_senbagam.aerele.in/api/method/senbagam.api.login'));
//     request.body = json.encode({
//       "args": [
//         [
//           {
//             "usr": mobilenum.text.toString().trim(),
//             "pwd": password_.text.toString().trim(),
//           }
//         ]
//       ]
//     });

//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200) {
//       print(await response.stream.bytesToString());
//       Navigator.of(context).pushNamed(Homepage.routeName).then((result) async {
//         print(result);
//       });
//     } else {
//       print(response.reasonPhrase);
//     }
}
