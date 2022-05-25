
import 'dart:ui';

import 'package:flutter/material.dart';

final TextStyle kHeadText= TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final Color kBackgrounCol = Color(0xffC4DFCB);

final TextStyle kParagraphText = TextStyle(fontSize: 16, color: Colors.grey.shade500, height: 1.5);

ThemeData mainTheme = ThemeData(
  primaryColor: Colors.orangeAccent[400],
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,);


final String title='';
final String description='';
final String rating='';
final String startTime='';
final String endTime='';
final String startDate='';
final String endDate='';
final double monthlyFees=0.0;
final double oneTimeFees=0.0;
final String thumbnailUrl='';
final int seats=0;

final InputDecoration kFeildDecorate = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(width: 3,color:Color. fromRGBO(203, 182,130, 1.0)),
  ),
  enabledBorder: const OutlineInputBorder(
    borderSide: const BorderSide(color: Color. fromRGBO(203, 182,130, 1.0), width:2.0),
  ),);

