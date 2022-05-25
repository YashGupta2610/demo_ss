import 'package:demo_ss/Home_Page.dart';
import 'package:demo_ss/widgets/razorpay.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shikhsha Setu',
      theme: mainTheme,

      debugShowCheckedModeBanner: false,
     home: Home_Page(),
     //  home: RazorPay(),
    );
  }
}