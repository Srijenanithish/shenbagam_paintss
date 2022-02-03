import 'dart:convert';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shenbagam_paints/Pages/product_view.dart';
import 'package:shenbagam_paints/Pages/products.dart';
import 'package:shenbagam_paints/animation/fadeanimation.dart';
import 'package:shenbagam_paints/models/products.dart';

class ExplorePage extends StatefulWidget {
  static const String routeName = "/login";

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  List<ProductModel> products = [
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n1  Litre",
        "PU21-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n4  Litre",
        "PU21-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n10  Litre",
        "PU21-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n20  Litre",
        "PU21-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n1  Litre",
        "PU15-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n4  Litre",
        "PU15-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n10  Litre",
        "PU15-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n20  Litre",
        "PU15-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n1  Litre",
        "PU13-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n4  Litre",
        "PU13-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n10  Litre",
        "PU13-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n20  Litre",
        "PU13-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n1  Litre",
        "PU10-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n4  Litre",
        "PU10-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n10  Litre",
        "PU10-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n20  Litre",
        "PU10-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n1  Litre",
        "PU1-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n10  Litre",
        "PU1-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP1b7euDnl5smNxe7kv3PpIMdJdpTZB6wnfg&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n20  Litre",
        "PU1-20",
        false),
  ];

  List<ProductModel> products1 = [
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsHx2KqKOjjaRqnfp61bfqEfoyXneCTmqW-g&usqp=CAU",
        "",
        "Color 1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsHx2KqKOjjaRqnfp61bfqEfoyXneCTmqW-g&usqp=CAU",
        "",
        "Color 2",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsHx2KqKOjjaRqnfp61bfqEfoyXneCTmqW-g&usqp=CAU",
        "",
        "Color 3",
        false),
  ];

  List<ProductModel> selectedProducts = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 120, 0),
                    child: FadeAnimation(
                      1.4,
                      Text(
                        "All Products",
                        style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: 23,
                              letterSpacing: .5),
                        ),
                      ),
                    ),
                  ),
                  FadeAnimation(
                      1.4,
                      Column(
                        children: [
                          Icon(Icons.border_right),
                          InkWell(
                            onTap: () {
                              print(selectedProducts[0].color_type);
                            },
                            child: Text("Get Quotation"),
                          ),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Column(children: [
                FadeAnimation(
                  1.4,
                  Text(
                    "PUGAZH",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                FadeAnimation(
                  1.4,
                  Divider(
                    // thickness of the line
                    indent: 40, // empty space to the leading edge of divider.
                    endIndent: 40,
                    color: Colors.black45,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Container(
                    height: 190,
                    child: FadeAnimation(
                      1.4,
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                products[index].isSelected =
                                    !products[index].isSelected;
                                if (products[index].isSelected == true) {
                                  selectedProducts.add(ProductModel(
                                      products[index].name,
                                      products[index].code,
                                      products[index].color_type,
                                      true));
                                } else if (products[index].isSelected ==
                                    false) {
                                  selectedProducts.removeWhere((element) =>
                                      element.name == products[index].name);
                                }
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  height: 100,
                                  width: 100,
                                  child: Image.network(products[index].name,
                                      fit: BoxFit.cover),
                                ),
                                Text(products[index].code),
                                Container(
                                  child: products[index].isSelected
                                      ? Icon(
                                          Icons.check_circle,
                                          color: Colors.green[700],
                                        )
                                      : Icon(
                                          Icons.check_circle_outline,
                                          color: Colors.grey,
                                        ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  1.4,
                  Text(
                    "EZHIL",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                FadeAnimation(
                  1.4,
                  Divider(
                    // thickness of the line
                    indent: 40, // empty space to the leading edge of divider.
                    endIndent: 40,
                    color: Colors.black45,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Container(
                    height: 190,
                    child: FadeAnimation(
                      1.4,
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                products1[index].isSelected =
                                    !products1[index].isSelected;
                                if (products1[index].isSelected == true) {
                                  selectedProducts.add(ProductModel(
                                      products1[index].name,
                                      products[index].code,
                                      products1[index].color_type,
                                      true));
                                } else if (products1[index].isSelected ==
                                    false) {
                                  selectedProducts.removeWhere((element) =>
                                      element.name == products1[index].name);
                                }
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  height: 100,
                                  width: 100,
                                  child: Image.network(products1[index].name,
                                      fit: BoxFit.cover),
                                ),
                                Text(products1[index].color_type),
                                Container(
                                  child: products1[index].isSelected
                                      ? Icon(
                                          Icons.check_circle,
                                          color: Colors.green[700],
                                        )
                                      : Icon(
                                          Icons.check_circle_outline,
                                          color: Colors.grey,
                                        ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}


// CustomScrollView(slivers: [
//       SliverAppBar(
//         expandedHeight: 300.0,
//         elevation: 0,
//         pinned: true,
//         floating: true,
//         stretch: true,
//         flexibleSpace: FlexibleSpaceBar(
//           background: Image(
//             image: NetworkImage(
//                 "https://images.unsplash.com/photo-1508264443919-15a31e1d9c1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzV8fHBhaW50c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
//             fit: BoxFit.cover,
//           ),
//           collapseMode: CollapseMode.pin,
//           titlePadding:
//               EdgeInsets.only(left: 20, right: 30, bottom: 100, top: 90),
//           stretchModes: [StretchMode.zoomBackground, StretchMode.fadeTitle],
//           title: FadeAnimation(
//               0.1,
//               Text("Senbagam Paints",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 28.0,
//                   ))),
//         ),
//         bottom: AppBar(
//           toolbarHeight: 70,
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           title: Row(
//             children: [
//               Text("Back"),
//               SizedBox(width: 10),
//             ],
//           ),
//         ),
//       ),
//       SliverList(
//         delegate: SliverChildListDelegate([
//           Container(
//               color: Colors.white,
//               padding: EdgeInsets.only(top: 20, left: 20),
//               height: 330,
//               child: Column(children: [
//                 FadeAnimation(
//                     1.4,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Premium',
//                           style: TextStyle(
//                             fontStyle: FontStyle.normal,
//                             decoration: TextDecoration.none,
//                             color: Colors.black,
//                             fontSize: 18,
//                           ),
//                         ),
//                       ],
//                     )),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Expanded(
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: productList.length,
//                         itemBuilder: (context, index) {
//                           return productCart(productList[index]);
//                         }))
//               ])),
//           Container(
//               color: Colors.blueGrey.shade100,
//               padding: EdgeInsets.only(top: 20, left: 20),
//               height: 330,
//               child: Column(children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Advance',
//                       style: TextStyle(
//                           fontStyle: FontStyle.normal,
//                           decoration: TextDecoration.none,
//                           color: Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Expanded(
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: productList.length,
//                         itemBuilder: (context, index) {
//                           return productCart(productList[index]);
//                         }))
//               ])),
//           Container(
//               color: Colors.white,
//               padding: EdgeInsets.only(top: 20, left: 20),
//               height: 330,
//               child: Column(children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Basic',
//                       style: TextStyle(
//                           fontStyle: FontStyle.normal,
//                           decoration: TextDecoration.none,
//                           color: Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Expanded(
//                     child: ListView.builder(
//                         reverse: true,
//                         scrollDirection: Axis.horizontal,
//                         itemCount: productList.length,
//                         itemBuilder: (context, index) {
//                           return productCart(productList[index]);
//                         }))
//               ])),
//         ]),
//       )
//     ]);
//   }

//   Future<void> products() async {
//     final String response = await rootBundle.loadString('assets/products.json');
//     final data = await json.decode(response);

//     setState(() {
//       productList =
//           data['products'].map((data) => Product.fromJson(data)).toList();
//     });
//   }

//   productCart(Product product) {
//     return AspectRatio(
//       aspectRatio: 1 / 1,
//       child: FadeAnimation(
//           1.5,
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => ProductViewPage(
//                             product: product,
//                           )));
//             },
//             child: Container(
//               margin: EdgeInsets.only(right: 20, bottom: 25),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     offset: Offset(5, 10),
//                     blurRadius: 15,
//                     color: Colors.grey.shade200,
//                   )
//                 ],
//               ),
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: 150,
//                     child: Stack(
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           child: ClipRRect(
//                               borderRadius: BorderRadius.circular(15),
//                               child: Image.network(product.imageURL,
//                                   fit: BoxFit.cover)),
//                         ),
//                         // Add to cart button
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     product.name,
//                     style: TextStyle(
//                       decoration: TextDecoration.none,
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontStyle: FontStyle.normal,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "\₹ " + product.price.toString() + '.00',
//                     style: TextStyle(
//                         decoration: TextDecoration.none,
//                         color: Colors.black,
//                         fontStyle: FontStyle.normal,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w800),
//                   ),
//                 ],
//               ),
//             ),
//           )),
//     );