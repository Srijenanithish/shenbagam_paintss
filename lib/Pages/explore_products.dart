import 'dart:convert';

import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shenbagam_paints/Pages/db/database_helper.dart';
import 'package:shenbagam_paints/Pages/model/data.dart';
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
  }

  Map Mapresponse = {};
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

  List<ProductModel> selectedProducts = [];
  List<String> selected_items = [];

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
                              // selected_items.clear();
                              // for (int i = 0;
                              //     i < selectedProducts.length;
                              //     i++) {
                              //   setState(() {
                              //     selected_items.add(selectedProducts[i]
                              //         .color_type
                              //         .toString());
                              //   });
                              // }
                              print(selected_items);
                              getquotation(
                                  selected_items,
                                  details[details.length - 1].api_key,
                                  details[details.length - 1].api_secret);
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
                        itemCount: products1.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                products1[index].isSelected =
                                    !products1[index].isSelected;
                                if (products1[index].isSelected == true) {
                                  selectedProducts.add(ProductModel(
                                      products1[index].name,
                                      products1[index].code,
                                      products1[index].color_type,
                                      true));
                                  selected_items.clear();
                                  for (int i = 0;
                                      i < selectedProducts.length;
                                      i++) {
                                    setState(() {
                                      selected_items.add(
                                          (selectedProducts[i].color_type)
                                              .toString());
                                    });
                                  }
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
                                Text(products1[index].code),
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
                SizedBox(
                  height: 15,
                ),
                FadeAnimation(
                  1.4,
                  Text(
                    "KAPPAN",
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
                    height: 200,
                    child: FadeAnimation(
                      1.4,
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products2.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                products2[index].isSelected =
                                    !products2[index].isSelected;
                                if (products2[index].isSelected == true) {
                                  selectedProducts.add(ProductModel(
                                      products2[index].name,
                                      products2[index].code,
                                      products2[index].color_type,
                                      true));
                                  selected_items.clear();
                                  for (int i = 0;
                                      i < selectedProducts.length;
                                      i++) {
                                    setState(() {
                                      selected_items.add(selectedProducts[i]
                                          .color_type
                                          .toString());
                                    });
                                  }
                                } else if (products2[index].isSelected ==
                                    false) {
                                  selectedProducts.removeWhere((element) =>
                                      element.name == products2[index].name);
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
                                Text(products2[index].code),
                                Container(
                                  child: products2[index].isSelected
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
                  height: 25,
                ),
                FadeAnimation(
                  1.4,
                  Text(
                    "AZHAGI",
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
                        itemCount: products3.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                products3[index].isSelected =
                                    !products3[index].isSelected;
                                if (products3[index].isSelected == true) {
                                  selectedProducts.add(ProductModel(
                                      products3[index].name,
                                      products3[index].code,
                                      products3[index].color_type,
                                      true));
                                  selected_items.clear();
                                  for (int i = 0;
                                      i < selectedProducts.length;
                                      i++) {
                                    setState(() {
                                      selected_items.add(selectedProducts[i]
                                          .color_type
                                          .toString());
                                    });
                                  }
                                } else if (products3[index].isSelected ==
                                    false) {
                                  selectedProducts.removeWhere((element) =>
                                      element.name == products3[index].name);
                                }
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  height: 100,
                                  width: 100,
                                  child: Image.network(products3[index].name,
                                      fit: BoxFit.cover),
                                ),
                                Text(products3[index].code),
                                Container(
                                  child: products3[index].isSelected
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
                    "INIYAN",
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
                        itemCount: products4.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                products4[index].isSelected =
                                    !products4[index].isSelected;
                                if (products4[index].isSelected == true) {
                                  selectedProducts.add(ProductModel(
                                      products4[index].name,
                                      products4[index].code,
                                      products4[index].color_type,
                                      true));
                                  selected_items.clear();
                                  for (int i = 0;
                                      i < selectedProducts.length;
                                      i++) {
                                    setState(() {
                                      selected_items.add(selectedProducts[i]
                                          .color_type
                                          .toString());
                                    });
                                  }
                                } else if (products4[index].isSelected ==
                                    false) {
                                  selectedProducts.removeWhere((element) =>
                                      element.name == products4[index].name);
                                }
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  height: 100,
                                  width: 100,
                                  child: Image.network(products4[index].name,
                                      fit: BoxFit.cover),
                                ),
                                Text(products4[index].code),
                                Container(
                                  child: products4[index].isSelected
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
                    "SEVVANTHI",
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
                        itemCount: products5.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                products5[index].isSelected =
                                    !products5[index].isSelected;
                                if (products5[index].isSelected == true) {
                                  selectedProducts.add(ProductModel(
                                      products5[index].name,
                                      products5[index].code,
                                      products5[index].color_type,
                                      true));
                                  selected_items.clear();
                                  for (int i = 0;
                                      i < selectedProducts.length;
                                      i++) {
                                    setState(() {
                                      selected_items.add(selectedProducts[i]
                                          .color_type
                                          .toString());
                                    });
                                  }
                                } else if (products5[index].isSelected ==
                                    false) {
                                  selectedProducts.removeWhere((element) =>
                                      element.name == products5[index].name);
                                }
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  height: 100,
                                  width: 100,
                                  child: Image.network(products5[index].name,
                                      fit: BoxFit.cover),
                                ),
                                Text(products5[index].code),
                                Container(
                                  child: products5[index].isSelected
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
                        itemCount: products6.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                products6[index].isSelected =
                                    !products6[index].isSelected;
                                if (products6[index].isSelected == true) {
                                  selectedProducts.add(ProductModel(
                                      products6[index].name,
                                      products6[index].code,
                                      products6[index].color_type,
                                      true));
                                  selected_items.clear();
                                  for (int i = 0;
                                      i < selectedProducts.length;
                                      i++) {
                                    setState(() {
                                      selected_items.add(selectedProducts[i]
                                          .color_type
                                          .toString());
                                    });
                                  }
                                } else if (products6[index].isSelected ==
                                    false) {
                                  selectedProducts.removeWhere((element) =>
                                      element.name == products6[index].name);
                                }
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  height: 100,
                                  width: 100,
                                  child: Image.network(products6[index].name,
                                      fit: BoxFit.cover),
                                ),
                                Text(products6[index].code),
                                Container(
                                  child: products6[index].isSelected
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
              ]),
            ],
          ),
        ),
      ),
    );
  }

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
        backgroundColor: Colors.black26,
        content: Text(
          Mapresponse['message']['message'],
          style: TextStyle(color: Colors.white),
        ),
      ));

      //  print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
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