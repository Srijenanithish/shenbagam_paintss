import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shenbagam_paints/animation/fadeanimation.dart';

class my_partners extends StatefulWidget {
  static const String routeName = "/my_partners";

  @override
  my_partnersValidationState createState() => my_partnersValidationState();
}

class my_partnersValidationState extends State<my_partners> {
  @override
  Widget build(BuildContext context) {
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
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) => EntryItem(
                  data[index],
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
final List<Entry> data = <Entry>[
  Entry(
    'Owner',
    <Entry>[
      Entry(
        'Painters',
        <Entry>[
          Entry('Harish'),
          Entry('Kevin'),
          Entry('Jack'),
        ],
      ),
      Entry(
        'Customers',
        <Entry>[
          Entry('Harish'),
          Entry('Kevin'),
          Entry('Jack'),
        ],
      ),
    ],
  ),
  // Second Row
  Entry('Managers', <Entry>[
    Entry('Vijay'),
    Entry('Peter'),
  ]),
  Entry(
    'Suppliers',
    <Entry>[
      Entry('Anruth'),
      Entry('Akshay'),
      Entry(
        'Painters',
        <Entry>[
          Entry('Godwin'),
          Entry('Rose'),
          Entry('Wilson'),
          Entry('Immanual'),
        ],
      )
    ],
  ),
];

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
