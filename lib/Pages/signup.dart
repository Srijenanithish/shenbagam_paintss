import 'dart:async';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shenbagam_paints/animation/fadeanimation.dart';

import 'dart:convert';

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
  get suffixIcon => null;

  String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 4) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else if (value.isEmpty) {
      return 'Please enter password';
    } else if (!regex.hasMatch(value)) {
      return 'Password should contains Special characters,numbers and letters.';
    } else
      return null;
  }

  @override
  Map Mapresponse_ref = {};
  Map Mapresponse = {};
  List dataResponse = [];
  TextEditingController username_ = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController Mobilenum = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController City = TextEditingController();
  TextEditingController District = TextEditingController();
  TextEditingController Pincode = TextEditingController();
  TextEditingController password_ = TextEditingController();
  TextEditingController gstn = TextEditingController();
  TextEditingController _controller = TextEditingController();
  bool _passwordVisible = false;
  bool isPressed = false;
  var items = ["Click ✓ in Mobile Number"];
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
                Container(
                  child: SingleChildScrollView(
                    child: FadeAnimation(
                      1.4,
                      Column(
                        children: [
                          FadeAnimation(
                            1.4,
                            Row(
                              children: [
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 60, 0, 0),
                                    child: new IconButton(
                                      icon: new Icon(Icons.arrow_back),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 60, 50, 0),
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
                              padding: const EdgeInsets.fromLTRB(0, 10, 170, 0),
                              child: Text(
                                'SIGN UP',
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
                            Form(
                              autovalidate: true,
                              key: formkey,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 20, 40, 0),
                                    child: TextFormField(
                                        controller: username_,
                                        decoration: InputDecoration(
                                            prefixIcon: prefixIcon ??
                                                Icon(Icons.person),
                                            border: UnderlineInputBorder(),
                                            contentPadding: EdgeInsets.all(16),
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
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 10, 40, 0),
                                      child: TextFormField(
                                        controller: dateinput,
                                        decoration: InputDecoration(
                                            prefixIcon: prefixIcon ??
                                                Icon(Icons.calendar_today),
                                            border: UnderlineInputBorder(),
                                            contentPadding: EdgeInsets.all(16),
                                            labelText: 'DOB',
                                            hintText:
                                                'Enter your DOB'), //set it true, so that user will not able to edit text
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(
                                                      1950), //DateTime.now() - not to allow to choose before today.
                                                  lastDate: DateTime.now());

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
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 0),
                                    child: TextFormField(
                                        controller: Mobilenum,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            prefixIcon:
                                                prefixIcon ?? Icon(Icons.phone),
                                            suffixIcon: suffixIcon ??
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isPressed = !isPressed;
                                                    });

                                                    if (isPressed == true) {
                                                      items.clear();
                                                      dataResponse.clear();
                                                      Referral(Mobilenum);
                                                    } else if (isPressed ==
                                                        false) {
                                                      setState(() {
                                                        items.clear();
                                                        dataResponse.clear();
                                                      });
                                                    }
                                                  },
                                                  icon: Icon(Icons.check,
                                                      color: (isPressed)
                                                          ? Colors.green
                                                          : Colors.red),
                                                ),
                                            border: UnderlineInputBorder(),
                                            contentPadding: EdgeInsets.all(16),
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
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 0),
                                    child: TextFormField(
                                        controller: email,
                                        decoration: InputDecoration(
                                            prefixIcon:
                                                prefixIcon ?? Icon(Icons.email),
                                            border: UnderlineInputBorder(),
                                            contentPadding: EdgeInsets.all(16),
                                            labelText: 'Email',
                                            hintText: 'Enter your Email ID'),
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: "* Required"),
                                        ])),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 0),
                                    child: TextFormField(
                                        controller: Address,
                                        maxLines: 2,
                                        decoration: InputDecoration(
                                            prefixIcon: prefixIcon ??
                                                Icon(Icons.landscape),
                                            border: UnderlineInputBorder(),
                                            contentPadding: EdgeInsets.all(16),
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
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 0),
                                    child: TextFormField(
                                        controller: City,
                                        decoration: InputDecoration(
                                            prefixIcon: prefixIcon ??
                                                Icon(Icons.location_city),
                                            border: UnderlineInputBorder(),
                                            contentPadding: EdgeInsets.all(16),
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
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 0),
                                    child: TextFormField(
                                        controller: District,
                                        decoration: InputDecoration(
                                            prefixIcon: prefixIcon ??
                                                Icon(Icons.pin_drop),
                                            border: UnderlineInputBorder(),
                                            contentPadding: EdgeInsets.all(16),
                                            labelText: 'District',
                                            hintText: 'Enter your District'),
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: "* Required"),
                                          MinLengthValidator(4,
                                              errorText:
                                                  "Username should be atleast 4 characters"),
                                        ])),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 0),
                                    child: TextField(
                                      controller: _controller,
                                      decoration: InputDecoration(
                                        prefixIcon:
                                            prefixIcon ?? Icon(Icons.person),
                                        labelText: 'Referred by ',
                                        suffixIcon: PopupMenuButton<String>(
                                          icon:
                                              const Icon(Icons.arrow_drop_down),
                                          onSelected: (String value) {
                                            _controller.text = value;
                                          },
                                          itemBuilder: (BuildContext context) {
                                            return items
                                                .map<PopupMenuItem<String>>(
                                                    (String value) {
                                              return new PopupMenuItem(
                                                  child: new Text(value),
                                                  value: value);
                                            }).toList();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 0),
                                    child: TextFormField(
                                        controller: gstn,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            prefixIcon: prefixIcon ??
                                                Icon(Icons.confirmation_number),
                                            border: UnderlineInputBorder(),
                                            contentPadding: EdgeInsets.all(16),
                                            labelText: 'GSTN',
                                            hintText: 'Enter your GSTN'),
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: "* Required"),
                                          MinLengthValidator(4,
                                              errorText:
                                                  "Username should be atleast 4 characters"),
                                        ])),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 0),
                                    child: TextFormField(
                                        controller: Pincode,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            prefixIcon:
                                                prefixIcon ?? Icon(Icons.code),
                                            border: UnderlineInputBorder(),
                                            contentPadding: EdgeInsets.all(16),
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
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 0),
                                    child: TextFormField(
                                      controller: password_,
                                      obscureText: !_passwordVisible,
                                      decoration: InputDecoration(
                                          prefixIcon: prefixIcon ??
                                              Icon(Icons.password_sharp),
                                          border: UnderlineInputBorder(),
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
                                          contentPadding: EdgeInsets.all(16),
                                          labelText: 'Password',
                                          hintText: 'Enter secure password'),
                                      validator: Validators.compose([
                                        Validators.patternString(
                                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                                            'Ensure Password contains\nSpecialcharacters,Numbers and Letters'),
                                        MultiValidator([
                                          RequiredValidator(
                                              errorText: "* Required"),
                                          MinLengthValidator(4,
                                              errorText:
                                                  "Password should be atleast 6 characters"),
                                          MaxLengthValidator(15,
                                              errorText:
                                                  "Password should not be greater than 15 characters")
                                        ])
                                      ]),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  FadeAnimation(
                                      1.4,
                                      FlatButton(
                                        minWidth: 190,
                                        child: Text('SIGN UP'),
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            backgroundColor: Colors.black26,
                                            duration:
                                                const Duration(seconds: 30),
                                            content: Text(
                                              "Please Wait while Loading .....",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ));
                                          Signup123(
                                              username_,
                                              dateinput,
                                              Mobilenum,
                                              email,
                                              Address,
                                              City,
                                              District,
                                              _controller,
                                              gstn,
                                              Pincode,
                                              password_);
                                        },
                                        color: Colors.purple.shade200,
                                        splashColor: Colors.green,
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
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

  void Referral(mobile_no) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://test_senbagam.aerele.in/api/method/senbagam_api.api.get_referrals'));
    request.body = json.encode({
      "args": {
        "mobile_no": mobile_no.text.toString().trim(),
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    // ignore: avoid_print

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();

      Mapresponse_ref = await json.decode(res);

      dataResponse = Mapresponse_ref['message']['refered_by'];

      setState(() {
        for (int i = 0; i < dataResponse.length; i++) {
          items.add(dataResponse[i].toString());
        }
      });

      //print(json.decode(await response.stream.bytesToString()));
    } else {
      print(response.reasonPhrase);
    }
  }

  Signup123(username_, dateinput, Mobilenum, email, Address, City, District,
      _controller, gstn, Pincode, password_) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://test_senbagam.aerele.in/api/method/senbagam_api.api.signup'));
    request.body = json.encode({
      "args": {
        "name": username_.text.toString().trim(),
        "dob": dateinput.text.toString().trim(),
        "mobile_no": Mobilenum.text.toString().trim(),
        "email": email.text.toString().trim(),
        "address": Address.text.toString().trim(),
        "city": City.text.toString().trim(),
        "district": District.text.toString().trim(),
        "refered_by": _controller.text.toString().trim(),
        "gstin": gstn.text.toString().trim(),
        "pincode": Pincode.text.toString().trim(),
        "password": password_.text.toString().trim()
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      Mapresponse = await json.decode(res);
      if (Mapresponse['message']['message'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black26,
          duration: const Duration(seconds: 30),
          content: Text(
            "Your response has taken Successfully ",
            style: TextStyle(color: Colors.white),
          ),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black26,
          duration: const Duration(seconds: 30),
          content: Text(
            " Please fill the correct information or\n The Password has already taken or\n The Password should be of Example@321.",
            style: TextStyle(color: Colors.white),
          ),
        ));
      }
    } else {
      print(response.reasonPhrase);
    }
  }
}
