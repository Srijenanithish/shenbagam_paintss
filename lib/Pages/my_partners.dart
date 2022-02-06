import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shenbagam_paints/Pages/db/database_helper.dart';
import 'package:shenbagam_paints/Pages/model/data.dart';
import 'package:shenbagam_paints/animation/fadeanimation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

import 'dart:convert';

class my_partners extends StatefulWidget {
  static const String routeName = "/my_partners";

  @override
  my_partnersValidationState createState() => my_partnersValidationState();
}

List<Entry> got = [];

class my_partnersValidationState extends State<my_partners> {
  Map partner_response = {};
  List parter_list = [];
  late List<Note> details;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    this.details = await NotesDatabase.instance.readAllNotes();

    partners(details[details.length - 1].api_key,
        details[details.length - 1].api_secret);
  }

  Future<void> partners(x, y) async {
    var headers = {
      'Authorization': 'token ' + x.toString() + ':' + y.toString(),
      'Content-Type': "application/json",
      'Accept': "*/*",
      'Connection': "keep-alive"
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://test_senbagam.aerele.in/api/method/senbagam_api.api.get_referral_tree'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      partner_response = await json.decode(res);
      print(partner_response['message']);

      setState(() {
        got = get_entry(partner_response['message'], "parent");
      });

      //print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  List<Entry> get_entry(Map data, key) {
    if (!data.containsKey(key)) {
      return [Entry("null")];
    }
    List<Entry> ret_data = [];
    for (var i = 0; i < data[key].length; i++) {
      String temp_title = data[key][i];
      List<Entry> temp = get_entry(data, data[key][i]);
      if (temp[0].title != "null") {
        ret_data.add(Entry(temp_title, temp));
      } else {
        ret_data.add(Entry(temp_title));
      }
    }
    return ret_data;
  }

  parse_entry(data) {
    print(data.title);
    for (var i = 0; i < data.children.length; i++) {
      parse_entry(data.children[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
            child: FadeAnimation(
              1.4,
              Text(
                "All Products",
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                      color: Colors.black54, fontSize: 23, letterSpacing: .5),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: FadeAnimation(
              1.4,
              ListView.builder(
                itemCount: got.length,
                itemBuilder: (BuildContext context, int index) => EntryItem(
                  got[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Entry {
  final String title;
  final List<Entry>
      children; // Since this is an expansion list ...children can be another list of entries
  Entry(this.title, [this.children = const <Entry>[]]);
}

// This is the entire multi-level list displayed by this app

final List<Entry> data = got;

// get_entry({
//   "parent": ["Senbagam Paints"],
//   "Senbagam Paints": ["Linux", "Mac", "Win"],
//   "Linux": ["Venkat"],
//   "Mac": ["Sudarshan"],
//   "Win": ["vijay", "dineshh"]
// }, 'parent');

// <Entry>[
//   Entry("Senbagam Paints", <Entry>[
//     Entry("Mac", <Entry>[Entry("Sudarshan")]),
//     Entry("Linux", <Entry>[Entry("Venkat")]),
//     Entry("Win", <Entry>[Entry("vijay"), Entry("dineshh")])
//   ])
// ];
//

// Create the Widget for the row
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  // This function recursively creates the multi-level list rows.
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return Container(
        decoration: BoxDecoration(color: Colors.white12),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(
                "assets/login/usericonn.png"), // no matter how big it is, it won't overflow
          ),
          title: Text(
            root.title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      );
    }
    print("----------" + root.title);
    return Container(
      decoration: BoxDecoration(color: Colors.white12),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(
              "assets/login/usericonn.png"), // no matter how big it is, it won't overflow
        ),
        key: PageStorageKey<Entry>(root),
        title: Text(
          root.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        children: root.children.map<Widget>(_buildTiles).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
