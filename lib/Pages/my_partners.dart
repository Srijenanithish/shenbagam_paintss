import 'package:flutter/material.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Partners",
        ),
        // backgroundColor: Colors.white10.withOpacity(0.01),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/login/partnersbg.jpeg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white30.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        child: FadeAnimation(
          1.4,
          Card(
            color: Colors.white.withOpacity(0.2),
            semanticContainer: true,

            //color: Colors.black.withOpacity(0.2),
            elevation: 100,
            margin: EdgeInsets.fromLTRB(45, 80, 45, 85),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            clipBehavior: Clip.antiAlias,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) => EntryItem(
                data[index],
              ),
            ),
          ),
        ),
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
        decoration: BoxDecoration(color: Colors.black12),
        child: ListTile(
          title: Text(
            root.title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(color: Colors.black26),
      child: ExpansionTile(
        key: PageStorageKey<Entry>(root),
        title: Text(
          root.title,
          style: TextStyle(
            color: Colors.white,
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
