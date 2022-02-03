import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
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
  Map Mapresponse = {};
  Map dataResponse = {};
  TextEditingController Mobilenum = TextEditingController();

  TextEditingController Otp = TextEditingController();
  TextEditingController password_ = TextEditingController();
  bool _passwordVisible = false;
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            body: Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeAnimation(
                  1.4,
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                          child: new IconButton(
                            icon: new Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 60, 50, 0),
                        child: Text(
                          'Senbagam Paints',
                          style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                                color: Colors.black54,
                                fontSize: 35,
                                letterSpacing: .5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FadeAnimation(
                  1.4,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 100, 0),
                    child: Text(
                      'FORGET PASSWORD',
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            letterSpacing: .5),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: SingleChildScrollView(
                    child: FadeAnimation(
                      1.4,
                      Card(
                        margin: EdgeInsets.fromLTRB(25, 40, 25, 80),
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
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: TextFormField(
                                    controller: Mobilenum,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        prefixIcon:
                                            prefixIcon ?? Icon(Icons.phone),
                                        border: UnderlineInputBorder(),
                                        contentPadding: EdgeInsets.all(16),
                                        labelText: 'Mobile Number',
                                        hintText: 'Enter your Mobile Number'),
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
                              FadeAnimation(
                                  1.4,
                                  FlatButton(
                                    minWidth: 170,
                                    child: Text('SEND OTP'),
                                    onPressed: () {
                                      if (formkey.currentState!.validate()) {
                                        forget(Mobilenum);
                                        setState(() {
                                          _hasBeenPressed = false;
                                        });
                                      }
                                      ;
                                    },
                                    color: Colors.purple.shade200,
                                    splashColor: Colors.green,
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.all(16),
                    labelText: 'Enter OTP',
                    hintText: 'Enter your Generated OTP'),
                validator: MultiValidator([
                  RequiredValidator(errorText: "* Required"),
                  MinLengthValidator(4,
                      errorText: "OTP should be atleast 4 characters"),
                ])),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 0),
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
                          _passwordVisible = !_passwordVisible;
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
          FlatButton(
            minWidth: 170,
            child: Text('RESET PASSWORD'),
            onPressed: () {},
            color: Colors.purple.shade200,
            splashColor: Colors.green,
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

  void forget(mobile_no) async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Sudarshan; sid=eeac97f12794ef7c8c1fc70f82ffddf19327d27d6686b022f549bff1; system_user=yes; user_id=frankel9675%40gmail.com; user_image='
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://test_senbagam.aerele.in/api/method/senbagam.api.send_otp'));
    request.body = json.encode({
      "args": [
        [
          {
            "mobile_no": mobile_no.text.toString().trim(),
          }
        ]
      ]
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      Mapresponse = await json.decode(res);
      // dataResponse = Mapresponse['message'];
      print(Mapresponse);

      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
