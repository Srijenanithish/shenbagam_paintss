import 'dart:convert';

import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:shenbagam_paints/db/database_helper.dart';
import 'package:shenbagam_paints/db/model/data.dart';
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
  late List<Note> details;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    this.details = await NotesDatabase.instance.readAllNotes();
    getitems(details[details.length - 1].api_key,
        details[details.length - 1].api_secret);
  }

  Map Mapresponse = {};
  Map Mapresponse_ = {};
  List Items = [];
  List Items_name = [];
  List<ProductModel> products1 = [
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "EL9G-20",
        "EL9G-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EL9G-10",
        " EL9G-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EL9G-4",
        " EL9G-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EL9G-1",
        " EL9G-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EL CW 20",
        " EL CW 20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n1 Litre",
        " EL21G-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EL 9G\n20 old",
        " EL 9G 20 old",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EL 21G 4",
        " EL 21G 4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EL 9G\n1 old",
        " EL 9G 1 old",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EL 9G\n4 old",
        " EL 9G 4 old",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EL 9G\n10 old",
        " EL 9G 10 old",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EL CW 1",
        " EL CW 1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EL CW 4",
        " EL CW 4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EL CW 10",
        " EL CW 10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EL CW\n20 OLD",
        " EL CW 20 OLD",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n4 Litre",
        " EL21G-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n10 Litre",
        " EL21G-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n20 Litre",
        " EL21G-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n1 Litre",
        " EL16G-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n4 Litre",
        " EL16G-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n10 Litre",
        " EL16G-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n20 Litre",
        " EL16G-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n1 Litre",
        " EL18C-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n4 Litre",
        " EL18C-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n10 Litre",
        " EL18C-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n20 Litre",
        " EL18C-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n1 Litre",
        " EL12G-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n4 Litre",
        " EL12G-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n10 Litre",
        " EL12G-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n20 Litre",
        " EL12G-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n1 Litre",
        " EL17G-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n4 Litre",
        " EL17G-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n10 Litre",
        " EL17G-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n20 Litre",
        " EL17G-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n1 Litre",
        " EL2G-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n4 Litre",
        " EL2G-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n10 Litre",
        " EL2G-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " EZHIL\n(EXTERIOR)\n20 Litre",
        " EL2G-20",
        false),
  ];

  List<ProductModel> products2 = [
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SALES\nKAPPAN 3\n(MULTI PRIMER)\n20 Litre",
        " KAPPAN3-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SALES\nKAPPAN 3\n(MULTI PRIMER)\n10 Litre",
        " KAPPAN3-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SALES\nKAPPAN 3\n(MULTI PRIMER)\n4 Litre	",
        " KAPPAN3-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SALES\nKAPPAN 3\n(MULTI PRIMER)\n1 Litre",
        " KAPPAN3-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " KAPPAN 2\n(EXTERIOR PRIMER)\n20 Litre",
        " KAPPAN2-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " KAPPAN 2\n(EXTERIOR PRIMER)\n10 Litre",
        " KAPPAN2-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " KAPPAN 2\n(EXTERIOR PRIMER)\n4 Litre",
        " KAPPAN2-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " KAPPAN 2\n(EXTERIOR PRIMER)\n1 Litre",
        " KAPPAN2-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " KAPPAN 1\n(INTERIOR PRIMER)\n20 Litre",
        " KAPPAN1-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " KAPPAN 1\n(INTERIOR PRIMER)\n10 Litre",
        " KAPPAN1-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " KAPPAN 1\n(INTERIOR PRIMER)\n4 Litre",
        " KAPPAN1-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " KAPPAN 1\n(INTERIOR PRIMER)\n1 Litre",
        " KAPPAN1-1",
        false),
  ];

  List<ProductModel> products3 = [
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " AZHAGI\n(EXTERIOR)\n1 Litre",
        " AZ21C-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " AZHAGI\n(EXTERIOR)\n4 Litre",
        " AZ21C-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " AZHAGI\n(EXTERIOR)\n10 Litre",
        " AZ21C-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " AZHAGI\n(EXTERIOR)\n20 Litre",
        " AZ21C-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " AZHAGI\n(EXTERIOR)\n1 Litre",
        " AZ15-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " AZHAGI\n(EXTERIOR)\n4 Litre",
        " AZ15-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " AZHAGI\n(EXTERIOR)\n10 Litre",
        " AZ15-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " AZHAGI\n(EXTERIOR)\n20 Litre",
        " AZ15-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " AZHAGI\n(EXTERIOR)\n1 Litre",
        " AZ18C-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " AZHAGI\n(EXTERIOR)\n4 Litre",
        " AZ18C-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " AZHAGI\n(EXTERIOR)\n10 Litre",
        " AZ18C-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " AZHAGI\n(EXTERIOR)\n20 Litre",
        " AZ18C-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " AZHAGI\n(EXTERIOR)\n1 Litre ",
        "AZ12-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "AZHAGI\n(EXTERIOR)\n4 Litre",
        "AZ12-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "AZHAGI\n(EXTERIOR)\n10 Litre",
        "AZ12-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "AZHAGI\n(EXTERIOR)\n20 Litre",
        "AZ12-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "AZHAGI\n(EXTERIOR)\n1 Litre",
        "AZ17C-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "AZHAGI\n(EXTERIOR)\n4 Litre",
        "AZ17C-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "AZHAGI\n(EXTERIOR)\n10 Litre",
        "AZ17C-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "AZHAGI\n(EXTERIOR)\n20 Litre",
        "AZ17C-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "AZHAGI\n(EXTERIOR)\n1 Litre",
        "AZ11-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "AZHAGI\n(EXTERIOR)\n4 Litre",
        "AZ11-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "AZHAGI\n(EXTERIOR)\n10 Litre",
        "AZ11-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "AZHAGI\n(EXTERIOR)\n20 Litre",
        "AZ11-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "AZHAGI\n(EXTERIOR)\n1 Litre",
        "AZ2-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "AZHAGI\n(EXTERIOR)\n4 Litre",
        "AZ2-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "AZHAGI\n(EXTERIOR)\n10 Litre",
        "AZ2-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " AZHAGI\n(EXTERIOR)\n20 Litre",
        " AZ2-20",
        false),
  ];
  List<ProductModel> products4 = [
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n1 Litre ",
        " IN20-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n4 Litre",
        " IN20-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n10 Litre",
        " IN20-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n20 Litre",
        " IN20-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n1 Litre",
        " IN16-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n4 Litre",
        " IN16-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n10 Litre",
        " IN16-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n20 Litre",
        " IN16-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n1 Litre",
        " IN13-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n4 Litre",
        " IN13-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n10 Litre",
        " IN13-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n20 Litre",
        " IN13-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n1 Litre",
        " IN17-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n4 Litre",
        " IN17-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n10 Litre",
        " IN17-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN \n(EXTERIOR)\n20 Litre",
        " IN17-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n1 Litre",
        " IN10-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n4 Litre",
        " IN10-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n10 Litre",
        " IN10-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n20 Litre",
        " IN10-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n1 Litre",
        " IN2-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n4 Litre",
        " IN2-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n10 Litre",
        " IN2-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " INIYAN\n(EXTERIOR)\n20 Litre",
        " IN2-20",
        false),
  ];
  List<ProductModel> products5 = [
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SEVVANTHI\n(INTERIOR)\n1 Litre",
        " SE22-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SEVVANTHI\n(INTERIOR)\n4 Litre",
        " SE22-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SEVVANTHI\n(INTERIOR)\n10 Litre",
        " SE22-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SEVVANTHI\n(INTERIOR)\n20 Litre",
        " SE22-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SEVVANTHI\n(INTERIOR)\n1 Litre",
        " SE15-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SEVVANTHI\n(INTERIOR)\n4 Litre",
        " SE15-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SEVVANTHI\n(INTERIOR)\n10 Litre",
        " SE15-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SEVVANTHI\n(INTERIOR)\n20 Litre",
        " SE15-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SEVVANTHI\n(INTERIOR)\n1 Litre",
        " SE13-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SEVVANTHI\n(INTERIOR)\n4 Litre",
        " SE13-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SEVVANTHI\n(INTERIOR)\n10 Litre",
        " SE13-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SEVVANTHI\n(INTERIOR)\n20 Litre",
        " SE13-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SEVVANTHI\n(INTERIOR)\n20 Litre",
        " SE3-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SEVVANTHI\n(INTERIOR)\n10 Litre",
        " SE3-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SEVVANTHI\n(INTERIOR)\n4 Litre",
        " SE3-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        " SEVVANTHI\n(INTERIOR)\n1 Litre",
        " SE3-1",
        false),
  ];

  List<ProductModel> products6 = [
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n1  Litre",
        "PU21-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n4  Litre",
        "PU21-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n10  Litre",
        "PU21-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n20  Litre",
        "PU21-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n1  Litre",
        "PU15-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n4  Litre",
        "PU15-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n10  Litre",
        "PU15-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n20  Litre",
        "PU15-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n1  Litre",
        "PU13-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n4  Litre",
        "PU13-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n10  Litre",
        "PU13-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n20  Litre",
        "PU13-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n1  Litre",
        "PU10-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n4  Litre",
        "PU10-4",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n10  Litre",
        "PU10-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n20  Litre",
        "PU10-20",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n1  Litre",
        "PU1-1",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n10  Litre",
        "PU1-10",
        false),
    ProductModel(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
        "PUGAZH\n(INTERIOR)\n20  Litre",
        "PU1-20",
        false),
  ];

  bool clear = false;

  List<ProductModel> selectedProducts = [];
  List<String> selected_items = [];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        floating: false,
        pinned: true,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
        title: FadeAnimation(
          0.1,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: FadeAnimation(
                    1.4,
                    InkWell(
                      onTap: () {
                        print(selected_items);
                        if (selected_items.length == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.black26,
                            content: Text(
                              "Select Something to get Quotation .",
                              style: TextStyle(color: Colors.white),
                            ),
                            margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height - 200,
                                right: 20,
                                left: 20),
                          ));
                        } else {
                          setState(() {
                            clear = true;
                          });

                          getquotation(
                              selected_items,
                              details[details.length - 1].api_key,
                              details[details.length - 1].api_secret);
                        }
                      },
                      child: Column(
                        children: [
                          Icon(Icons.check_outlined),
                          Text("Get Quotation"),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      SliverList(delegate:
          SliverChildBuilderDelegate((BuildContext context, int index) {
        if (Items.length != 0) {
          if (index > Items.length - 1) return null;
        } else {
          if (index > 3) return null;
        }
        return Container(
            color: Colors.white,
            padding: EdgeInsets.only(
              top: 10,
              left: MediaQuery.of(context).size.width / 30,
              right: MediaQuery.of(context).size.width / 25,
            ),
            height: MediaQuery.of(context).size.height / 2.3,
            child: Column(children: [
              Items.length == 0
                  ? Text(
                      "Loading...",
                      style: TextStyle(fontSize: 19),
                    )
                  : Text(
                      Items[index]['section_name'],
                      style: TextStyle(fontSize: 19),
                    ),
              SizedBox(
                height: 5,
              ),
              FadeAnimation(
                1.4,
                Items.length == 0
                    ? Text(
                        "Please Wait... !",
                        style: TextStyle(fontSize: 19),
                      )
                    : Text(
                        Items[index]['description'],
                      ),
              ),
              Divider(
                // thickness of the line
                indent: 40, // empty space to the leading edge of divider.
                endIndent: 40,
                color: Colors.black45,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width / 30, 0, 0, 0),
                child: Container(
                  height: 200,
                  child: FadeAnimation(
                    1.4,
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Items_name.length,
                      itemBuilder: (context, index1) {
                        //print(Items_name.length);
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (clear == true) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.black26,
                                  content: Text(
                                    "Please try after some time of your previous quotation.",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  margin: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height -
                                              200,
                                      right: 20,
                                      left: 20),
                                ));
                              }
                              Items_name[index][index1]['selected'] == 0
                                  ? Items_name[index][index1]['selected'] = 1
                                  : Items_name[index][index1]['selected'] = 0;
                              if (Items_name[index][index1]['selected'] == 1) {
                                selectedProducts.add(ProductModel(
                                    Items_name[index][index1]['item_name'],
                                    Items_name[index][index1]['item_code'],
                                    Items_name[index][index1]['image'],
                                    true));
                                selected_items.clear();
                                for (int i = 0;
                                    i < selectedProducts.length;
                                    i++) {
                                  setState(() {
                                    selected_items.add(
                                        (selectedProducts[i].code).toString());
                                  });
                                }
                              } else if (Items_name[index][index1]
                                      ['selected'] ==
                                  0) {
                                selectedProducts.removeWhere((element) =>
                                    element.name ==
                                    Items_name[index][index1]['item_name']);
                              }
                            });
                          },
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  height: 100,
                                  width: 100,
                                  child: Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvVmaCIuus40EIkFJdltxAOODXGl_QPnm8tA&usqp=CAU",
                                      fit: BoxFit.cover),
                                ),
                                Container(
                                  width: 70,
                                  child: Text(
                                      Items_name[index][index1]['item_name'],
                                      textAlign: TextAlign.center),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Items_name[index][index1]['show_price'] == 0
                                    ? Text("")
                                    : Row(
                                        children: [
                                          Text(
                                            "Price =",
                                            style: TextStyle(
                                                color: Colors.red.shade300),
                                          ),
                                          Text(
                                            (Items_name[index][index1]['price'])
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.red.shade300),
                                          ),
                                        ],
                                      ),
                                clear == true
                                    ? Container(
                                        child: Icon(
                                          Icons.check_circle_outline,
                                          color: Colors.grey,
                                        ),
                                      )
                                    : Container(
                                        child: Items_name[index][index1]
                                                    ['selected'] ==
                                                1
                                            ? Icon(
                                                Icons.check_circle,
                                                color: Colors.green[700],
                                              )
                                            : Icon(
                                                Icons.check_circle_outline,
                                                color: Colors.grey,
                                              ),
                                      ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ]));
      }))
    ]);
  }

  //   Scaffold(
  //     body: Container(
  //       child: SingleChildScrollView(
  //         child: Column(
  //           children: [
  //             SizedBox(
  //               height: 25,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 Padding(
  //                   padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
  //                   child: FadeAnimation(
  //                     1.4,
  //                     Text(
  //                       "All Products",
  //                       style: GoogleFonts.raleway(
  //                         textStyle: TextStyle(
  //                             color: Colors.black54,
  //                             fontSize: 23,
  //                             letterSpacing: .5),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
  //                   child: FadeAnimation(
  //                       1.4,
  //                       InkWell(
  //                         onTap: () {
  //                           if (selected_items.length == 0) {
  //                             ScaffoldMessenger.of(context)
  //                                 .showSnackBar(SnackBar(
  //                               backgroundColor: Colors.black26,
  //                               content: Text(
  //                                 "Select Something to get Quotation .",
  //                                 style: TextStyle(color: Colors.white),
  //                               ),
  //                             ));
  //                           } else {
  //                             setState(() {
  //                               clear = true;
  //                             });

  //                             getquotation(
  //                                 selected_items,
  //                                 details[details.length - 1].api_key,
  //                                 details[details.length - 1].api_secret);
  //                           }
  //                         },
  //                         child: Column(
  //                           children: [
  //                             Icon(Icons.check_outlined),
  //                             Text("Get Quotation"),
  //                           ],
  //                         ),
  //                       )),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 25,
  //             ),
  //             Column(children: [
  //               FadeAnimation(
  //                 1.4,
  //                 Text(
  //                   "EZHIL",
  //                   style: TextStyle(fontSize: 19),
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 5,
  //               ),
  //               FadeAnimation(
  //                 1.4,
  //                 Divider(
  //                   // thickness of the line
  //                   indent: 40, // empty space to the leading edge of divider.
  //                   endIndent: 40,
  //                   color: Colors.black45,
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
  //                 child: Container(
  //                   height: 190,
  //                   child: FadeAnimation(
  //                     1.4,
  //                     ListView.builder(
  //                       scrollDirection: Axis.horizontal,
  //                       itemCount: products1.length,
  //                       itemBuilder: (context, index) {
  //                         return InkWell(
  //                           onTap: () {
  //                             setState(() {
  //                               products1[index].isSelected =
  //                                   !products1[index].isSelected;
  //                               if (products1[index].isSelected == true) {
  //                                 selectedProducts.add(ProductModel(
  //                                     products1[index].name,
  //                                     products1[index].code,
  //                                     products1[index].color_type,
  //                                     true));
  //                                 selected_items.clear();
  //                                 for (int i = 0;
  //                                     i < selectedProducts.length;
  //                                     i++) {
  //                                   setState(() {
  //                                     selected_items.add(
  //                                         (selectedProducts[i].color_type)
  //                                             .toString());
  //                                   });
  //                                 }
  //                               } else if (products1[index].isSelected ==
  //                                   false) {
  //                                 selectedProducts.removeWhere((element) =>
  //                                     element.name == products1[index].name);
  //                               }
  //                             });
  //                           },
  //                           child: Column(
  //                             children: [
  //                               Container(
  //                                 margin: EdgeInsets.only(right: 15),
  //                                 height: 100,
  //                                 width: 100,
  //                                 child: Image.network(products1[index].name,
  //                                     fit: BoxFit.cover),
  //                               ),
  //                               Text(products1[index].code),
  // clear == true
  //     ? Container(
  //         child: Icon(
  //           Icons.check_circle_outline,
  //           color: Colors.grey,
  //         ),
  //       )
  //     : Container(
  //         child: products1[index].isSelected
  //             ? Icon(
  //                 Icons.check_circle,
  //                 color: Colors.green[700],
  //               )
  //             : Icon(
  //                 Icons.check_circle_outline,
  //                 color: Colors.grey,
  //               ),
  //       ),
  //                               SizedBox(
  //                                 height: 10,
  //                               ),
  //                             ],
  //                           ),
  //                         );
  //                       },
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ]),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Future<void> getitems(x, y) async {
    var headers = {
      'Authorization': 'token ' + x.toString() + ':' + y.toString(),
      'Content-Type': "application/json",
      'Accept': "*/*",
      'Connection': "keep-alive"
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://test_senbagam.aerele.in/api/method/senbagam_api.api.get_item'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res1 = await response.stream.bytesToString();
      Mapresponse_ = await json.decode(res1);
      setState(() {
        Items = Mapresponse_['message']['section'];
        Items_name = Mapresponse_['message']['items'];
      });
      // print(Items_name);
      //print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

//Get quotation API....
  void getquotation(selected_items, x, y) async {
    var headers = {
      'Authorization': 'token ' + x.toString() + ':' + y.toString(),
      'Content-Type': "application/json",
      'Accept': "*/*",
      'Connection': "keep-alive"
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://test_senbagam.aerele.in/api/method/senbagam_api.api.add_quotation'));
    request.body = json.encode({
      "args": [selected_items]
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      Mapresponse = await json.decode(res);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black26,
        content: Text(
          Mapresponse['message']['message'],
          style: TextStyle(color: Colors.white),
        ),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 200,
            right: 20,
            left: 20),
      ));

      //  print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
