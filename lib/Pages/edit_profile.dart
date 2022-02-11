import 'dart:async';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shenbagam_paints/Pages/db/database_helper.dart';
import 'package:shenbagam_paints/Pages/model/data.dart';
import 'package:shenbagam_paints/animation/fadeanimation.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class edit extends StatefulWidget {
  static const String routeName = "/edit";

  @override
  editValidationState createState() => editValidationState();
}

class editValidationState extends State<edit> {
  late List<Note> details;
  bool isLoading = false;

  @override
  void initState() {
    dateinput.text = "";
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    this.details = await NotesDatabase.instance.readAllNotes();
    setState(() {
      name1 = details[details.length - 1].name;
      dob1 = details[details.length - 1].dob;
      mobile1 = details[details.length - 1].mobile;
      email1 = details[details.length - 1].email;
      address1 = details[details.length - 1].address;
      city1 = details[details.length - 1].city;
      district1 = details[details.length - 1].district;
      referred_by1 = details[details.length - 1].referred_by;
      gstin1 = details[details.length - 1].gstin;
      pincode1 = details[details.length - 1].pincode;
    });
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  get prefixIcon => null;
  String name1 = '';
  String dob1 = '';
  String mobile1 = '';
  String email1 = '';
  String address1 = '';
  String city1 = '';
  String district1 = '';
  String referred_by1 = '';
  String gstin1 = '';
  String pincode1 = '';
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
  TextEditingController email = TextEditingController();
  TextEditingController _controller = TextEditingController();
  TextEditingController Mobilenum = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController City = TextEditingController();
  TextEditingController District = TextEditingController();
  TextEditingController Pincode = TextEditingController();
  TextEditingController password_ = TextEditingController();
  TextEditingController gstn = TextEditingController();
  bool _passwordVisible = false;
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            body: Container(
      width: double.infinity,
      height: double.infinity,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage("assets/login/SignUpBG.jpg"),
      //     fit: BoxFit.cover,
      //     colorFilter: ColorFilter.mode(
      //         Colors.black.withOpacity(0.6), BlendMode.dstATop),
      //   ),
      // ),
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
                                'EDIT PROFILE',
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
                                  Container(
                                    child: FadeAnimation(
                                      1.4,
                                      Container(
                                        alignment: Alignment(0.0, 2.5),
                                        width: double.infinity,
                                        height: 100,
                                        child: Stack(children: <Widget>[
                                          CircleAvatar(
                                              radius: 80.0,
                                              backgroundColor: Colors.white,
                                              backgroundImage: AssetImage(
                                                  "assets/login/usericonn.png")),
                                          Positioned(
                                            bottom: 20.0,
                                            right: 20.0,
                                            child: InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: ((builder) =>
                                                      bottomSheet()),
                                                );
                                              },
                                              child: Icon(
                                                Icons.camera_alt,
                                                color: Colors.teal,
                                                size: 28.0,
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 20, 40, 0),
                                    child: TextFormField(
                                      controller: username_,
                                      decoration: InputDecoration(
                                          prefixIcon:
                                              prefixIcon ?? Icon(Icons.person),
                                          border: UnderlineInputBorder(),
                                          contentPadding: EdgeInsets.all(16),
                                          labelText: name1,
                                          hintText: 'Enter your Name'),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 10, 40, 0),
                                      child: TextFormField(
                                        enabled: false,
                                        controller: dateinput,
                                        decoration: InputDecoration(
                                            prefixIcon: prefixIcon ??
                                                Icon(Icons.calendar_today),
                                            border: UnderlineInputBorder(),
                                            contentPadding: EdgeInsets.all(16),
                                            labelText: dob1,
                                            hintText:
                                                'Enter your DOB'), //set it true, so that user will not able to edit text
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
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
                                          border: UnderlineInputBorder(),
                                          contentPadding: EdgeInsets.all(16),
                                          labelText: mobile1,
                                          hintText: 'Enter your Mobile Number'),
                                    ),
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
                                          labelText: email1,
                                          hintText: 'Enter your Email ID'),
                                    ),
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
                                          labelText: address1,
                                          hintText: 'Enter your Address'),
                                    ),
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
                                          labelText: city1,
                                          hintText: 'Enter your City'),
                                    ),
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
                                          labelText: district1,
                                          hintText: 'Enter your District'),
                                    ),
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
                                          labelText: pincode1,
                                          hintText: 'Enter your Pincode'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 0),
                                    child: TextField(
                                      enabled: false,
                                      controller: _controller,
                                      decoration: InputDecoration(
                                          prefixIcon:
                                              prefixIcon ?? Icon(Icons.person),
                                          labelText: referred_by1),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 0),
                                    child: TextFormField(
                                      enabled: false,
                                      controller: gstn,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          prefixIcon: prefixIcon ??
                                              Icon(Icons.confirmation_number),
                                          border: UnderlineInputBorder(),
                                          contentPadding: EdgeInsets.all(16),
                                          labelText: gstin1,
                                          hintText: 'Enter your GSTN'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  FadeAnimation(
                                      1.4,
                                      FlatButton(
                                        minWidth: 190,
                                        child: Text('SAVE'),
                                        onPressed: () {},
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

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = PickedFile as PickedFile;
    });
  }

  Signup123(username_, dateinput, Mobilenum, Address, City, District, Pincode,
      password_, email) async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'sid=0036eae681f1a55d3a8e3f21b13ad4c82d0dc54044a519d750355095'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://test_senbagam.aerele.in/api/method/senbagam.api.sign_up'));
    request.body = json.encode({
      "args": [
        [
          {
            "name": dateinput.text.toString().trim(),
            "dob": Mobilenum.text.toString().trim(),
            "mobile_no": Address.text.toString().trim(),
            "address": City.text.toString().trim(),
            "city": District.text.toString().trim(),
            "district": Pincode.text.toString().trim(),
            "pincode": password_.text.toString().trim(),
            "email": username_.text.toString().trim(),
            "password": email.text.toString().trim(),
          }
        ]
      ]
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
