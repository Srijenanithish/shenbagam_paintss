import 'dart:async';
import 'package:intl/intl.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shenbagam_paints/animation/fadeanimation.dart';

class SignUp extends StatefulWidget {
  static const String routeName = "/Signup";

  @override
  SignupValidationState createState() => SignupValidationState();
}

class SignupValidationState extends State<SignUp> {
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

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
  TextEditingController username_ = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController Mobilenum = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController City = TextEditingController();
  TextEditingController District = TextEditingController();
  TextEditingController Pincode = TextEditingController();
  TextEditingController password_ = TextEditingController();
  bool _passwordVisible = false;
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "SignUp Section",
              ),
              //backgroundColor: Colors.transparent,
            ),
            backgroundColor: Color(0xfff2f3f7),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/login/signupbg.jpeg"),
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
                                margin: EdgeInsets.fromLTRB(25, 50, 25, 80),
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
                                            controller: username_,
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
                                                labelText: 'Name',
                                                hintText: 'Enter your Name'),
                                            validator: MultiValidator([
                                              RequiredValidator(
                                                  errorText: "* Required"),
                                              MinLengthValidator(4,
                                                  errorText:
                                                      "Username should be atleast 4 characters"),
                                            ])),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: TextFormField(
                                            controller: dateinput,
                                            decoration: InputDecoration(
                                                prefixIcon: prefixIcon ??
                                                    Icon(Icons.calendar_today),
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
                                                labelText: 'DOB',
                                                hintText:
                                                    'Enter your DOB'), //set it true, so that user will not able to edit text
                                            onTap: () async {
                                              DateTime? pickedDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(
                                                          2000), //DateTime.now() - not to allow to choose before today.
                                                      lastDate: DateTime(2101));

                                              if (pickedDate != null) {
                                                print(
                                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                                String formattedDate =
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(pickedDate);
                                                print(
                                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                                //you can implement different kind of Date Format here according to your requirement

                                                setState(() {
                                                  dateinput.text =
                                                      formattedDate; //set output date to TextField value.
                                                });
                                              } else {
                                                print("Date is not selected");
                                              }
                                            },
                                            validator: MultiValidator([
                                              RequiredValidator(
                                                  errorText: "* Required"),
                                            ]),
                                          )),
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
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: TextFormField(
                                            controller: username_,
                                            decoration: InputDecoration(
                                                prefixIcon: prefixIcon ??
                                                    Icon(Icons.email),
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
                                                labelText: 'Email',
                                                hintText:
                                                    'Enter your Email ID'),
                                            validator: MultiValidator([
                                              RequiredValidator(
                                                  errorText: "* Required"),
                                            ])),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: TextFormField(
                                            controller: Address,
                                            maxLines: 2,
                                            decoration: InputDecoration(
                                                prefixIcon: prefixIcon ??
                                                    Icon(Icons.landscape),
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
                                                labelText: 'Address',
                                                hintText: 'Enter your Address'),
                                            validator: MultiValidator([
                                              RequiredValidator(
                                                  errorText: "* Required"),
                                              MinLengthValidator(4,
                                                  errorText:
                                                      "Username should be atleast 4 characters"),
                                            ])),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: TextFormField(
                                            controller: City,
                                            decoration: InputDecoration(
                                                prefixIcon: prefixIcon ??
                                                    Icon(Icons.location_city),
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
                                                labelText: 'City',
                                                hintText: 'Enter your City'),
                                            validator: MultiValidator([
                                              RequiredValidator(
                                                  errorText: "* Required"),
                                              MinLengthValidator(4,
                                                  errorText:
                                                      "Username should be atleast 4 characters"),
                                            ])),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: TextFormField(
                                            controller: District,
                                            decoration: InputDecoration(
                                                prefixIcon: prefixIcon ??
                                                    Icon(Icons.pin_drop),
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
                                                labelText: 'District',
                                                hintText:
                                                    'Enter your District'),
                                            validator: MultiValidator([
                                              RequiredValidator(
                                                  errorText: "* Required"),
                                              MinLengthValidator(4,
                                                  errorText:
                                                      "Username should be atleast 4 characters"),
                                            ])),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: TextFormField(
                                            controller: Pincode,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                prefixIcon: prefixIcon ??
                                                    Icon(Icons.code),
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
                                                labelText: 'Pincode',
                                                hintText: 'Enter your Pincode'),
                                            validator: MultiValidator([
                                              RequiredValidator(
                                                  errorText: "* Required"),
                                              MinLengthValidator(6,
                                                  errorText:
                                                      "Username should be atleast 6 characters"),
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
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                backgroundColor: Colors.black26,
                                                content: Text(
                                                  "Your Response has taken,Thank you for Signing In !",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ));
                                              Navigator.pop(context);
                                            } else {
                                              print("Not Validated");
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
                                                "Sign UP",
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
