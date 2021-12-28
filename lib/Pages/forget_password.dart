import 'dart:async';

import 'package:form_field_validator/form_field_validator.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shenbagam_paints/animation/fadeanimation.dart';

class Forgetpass extends StatefulWidget {
  static const String routeName = "/Forgetpass";

  @override
  ForgetpassValidationState createState() => ForgetpassValidationState();
}

class ForgetpassValidationState extends State<Forgetpass> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _hasBeenPressed = true;
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
  TextEditingController Mobilenum = TextEditingController();

  TextEditingController Otp = TextEditingController();
  TextEditingController password_ = TextEditingController();
  bool _passwordVisible = false;
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Forget Password",
              ),
              // backgroundColor: Colors.white10.withOpacity(0.01),
            ),
            // By defaut, Scaffold background is white
            // Set its value to transparent
            backgroundColor: Color(0xfff2f3f7),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/login/forgetbg.jpeg"),
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
                                margin: EdgeInsets.fromLTRB(25, 120, 25, 80),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Form(
                                  autovalidate: true,
                                  key: formkey,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: TextFormField(
                                            controller: Mobilenum,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                prefixIcon: prefixIcon ??
                                                    Icon(Icons.phone),
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
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 50.0,
                                        child: RaisedButton(
                                          onPressed: () {
                                            if (formkey.currentState!
                                                .validate()) {
                                              setState(() {
                                                _hasBeenPressed = false;
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
                                                    Colors.purple.shade300,
                                                    Colors.purple.shade300,
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
                                                "Get OTP",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Center(
                                          child: Container(
                                              width: 300,
                                              child: _hasBeenPressed
                                                  ? getOTP()
                                                  : getOTP()),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
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

  Widget getOTP() {
    if (_hasBeenPressed == false) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
                controller: Otp,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: prefixIcon ?? Icon(Icons.format_list_numbered),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
                    isDense: true,
                    fillColor: Colors.black12,
                    labelText: 'Enter OTP',
                    hintText: 'Enter your Generated OTP'),
                validator: MultiValidator([
                  RequiredValidator(errorText: "* Required"),
                  MinLengthValidator(4,
                      errorText: "OTP should be atleast 4 characters"),
                ])),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: TextFormField(
                controller: password_,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                    prefixIcon: prefixIcon ?? Icon(Icons.password_sharp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      child: Icon(_passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
                    fillColor: Colors.black12,
                    labelText: 'New Password',
                    hintText: 'Enter New secure password'),
                validator: MultiValidator([
                  RequiredValidator(errorText: "* Required"),
                  MinLengthValidator(4,
                      errorText: "Password should be atleast 6 characters"),
                  MaxLengthValidator(15,
                      errorText:
                          "Password should not be greater than 15 characters")
                ])),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50.0,
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  _hasBeenPressed = false;
                });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple.shade300,
                        Colors.purple.shade300,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Reset Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      );
    } else {
      return Center(
          child: Text(
        "Get OTP to Change your Password !",
        style: TextStyle(color: Colors.red),
      ));
    }
  }
}
