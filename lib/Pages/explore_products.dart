import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shenbagam_paints/Pages/product_view.dart';
import 'package:shenbagam_paints/animation/fadeanimation.dart';
import 'package:shenbagam_paints/models/products.dart';

class ExplorePage extends StatefulWidget {
  static const String routeName = "/login";

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  List<dynamic> productList = [];

  @override
  void initState() {
    products();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        expandedHeight: 300.0,
        elevation: 0,
        pinned: true,
        floating: true,
        stretch: true,
        backgroundColor: Colors.blueGrey.shade100,
        flexibleSpace: FlexibleSpaceBar(
          background: Image(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1508264443919-15a31e1d9c1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzV8fHBhaW50c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
            fit: BoxFit.cover,
          ),
          collapseMode: CollapseMode.pin,
          titlePadding:
              EdgeInsets.only(left: 20, right: 30, bottom: 100, top: 90),
          stretchModes: [StretchMode.zoomBackground, StretchMode.fadeTitle],
          title: FadeAnimation(
              0.1,
              Text("Shenbagam Paints",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                  ))),
        ),
        bottom: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Text("Back"),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 20, left: 20),
              height: 330,
              child: Column(children: [
                FadeAnimation(
                    1.4,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Premium',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.none,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productList.length,
                        itemBuilder: (context, index) {
                          return productCart(productList[index]);
                        }))
              ])),
          Container(
              color: Colors.blueGrey.shade100,
              padding: EdgeInsets.only(top: 20, left: 20),
              height: 330,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Advance',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productList.length,
                        itemBuilder: (context, index) {
                          return productCart(productList[index]);
                        }))
              ])),
          Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 20, left: 20),
              height: 330,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Basic',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.builder(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: productList.length,
                        itemBuilder: (context, index) {
                          return productCart(productList[index]);
                        }))
              ])),
        ]),
      )
    ]);
  }

  Future<void> products() async {
    final String response = await rootBundle.loadString('assets/products.json');
    final data = await json.decode(response);

    setState(() {
      productList =
          data['products'].map((data) => Product.fromJson(data)).toList();
    });
  }

  productCart(Product product) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: FadeAnimation(
          1.5,
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductViewPage(
                            product: product,
                          )));
            },
            child: Container(
              margin: EdgeInsets.only(right: 20, bottom: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5, 10),
                    blurRadius: 15,
                    color: Colors.grey.shade200,
                  )
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(product.imageURL,
                                  fit: BoxFit.cover)),
                        ),
                        // Add to cart button
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    product.name,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\₹ " + product.price.toString() + '.00',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
