import 'dart:async';

import 'package:form_field_validator/form_field_validator.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shenbagam_paints/Pages/forget_password.dart';
import 'package:shenbagam_paints/Pages/home_page.dart';
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
  TextEditingController mobilenum = TextEditingController();

  TextEditingController password_ = TextEditingController();
  bool _passwordVisible = false;
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            // By defaut, Scaffold background is white
            // Set its value to transparent
            backgroundColor: Color(0xfff2f3f7),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/login/loginbg.jpeg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6), BlendMode.dstATop),
                ),
              ),
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
                              Card(
                                elevation: 30,
                                margin: EdgeInsets.fromLTRB(25, 140, 25, 25),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Form(
                                  autovalidate: true,
                                  key: formkey,
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 1.0),
                                        child: Center(
                                          child: Container(
                                              width: 200,
                                              height: 150,
                                              child: Image.asset(
                                                  "assets/login/usericonn.png")),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: TextFormField(
                                            controller: mobilenum,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                prefixIcon: prefixIcon ??
                                                    Icon(Icons.person),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                                filled: true,
                                                contentPadding:
                                                    EdgeInsets.all(16),
                                                isDense: true,
                                                fillColor: Colors.black12,
                                                labelText: 'Mobile Number',
                                                hintText:
                                                    'Enter your Mobile Number'),
                                            validator: MultiValidator([
                                              RequiredValidator(
                                                  errorText: "* Required"),
                                              MinLengthValidator(10,
                                                  errorText:
                                                      "Mobile Number should be 10 characters"),
                                            ])),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0,
                                            right: 15.0,
                                            top: 15,
                                            bottom: 0),
                                        child: TextFormField(
                                            controller: password_,
                                            // obscureText: true,
                                            obscureText: !_passwordVisible,
                                            decoration: InputDecoration(
                                                prefixIcon: prefixIcon ??
                                                    Icon(Icons.password_sharp),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                                suffixIcon: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _passwordVisible =
                                                          !_passwordVisible;
                                                    });
                                                  },
                                                  child: Icon(_passwordVisible
                                                      ? Icons.visibility
                                                      : Icons.visibility_off),
                                                ),
                                                filled: true,
                                                contentPadding:
                                                    EdgeInsets.all(16),
                                                fillColor: Colors.black12,
                                                labelText: 'Password',
                                                hintText:
                                                    'Enter secure password'),
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
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 50.0,
                                        child: RaisedButton(
                                          onPressed: () {
                                            if (formkey.currentState!
                                                .validate()) {
                                              Navigator.of(context)
                                                  .pushNamed(Homepage.routeName)
                                                  .then((result) async {
                                                print(result);
                                              });
                                            }
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(80.0)),
                                          padding: EdgeInsets.all(0.0),
                                          child: Ink(
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.blueGrey.shade200,
                                                    Colors.blueGrey.shade400
                                                  ],
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0)),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                  maxWidth: 100.0,
                                                  minHeight: 50.0),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Login",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                6, 0, 0, 0),
                                            child: Container(
                                                child: FlatButton(
                                              child: Text('Forget Password'),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pushNamed(
                                                        Forgetpass.routeName)
                                                    .then((result) async {
                                                  print(result);
                                                });
                                              },
                                              textColor: Colors.blueAccent,
                                            )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                60, 0, 0, 0),
                                            child: Container(
                                                child: FlatButton(
                                              child: Text('Login With OTP'),
                                              onPressed: () {},
                                              textColor: Colors.blueAccent,
                                            )),
                                          ),
                                        ],
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
                                    ],
                                  ),
                                ),
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
}
