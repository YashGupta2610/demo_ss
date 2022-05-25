
import 'package:demo_ss/widgets/catigories.dart';
import 'package:flutter/material.dart';
// import 'package:demo_ss/widgets/NavBar.dart';
class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
          Categories(categoryTitle: 'Category 1',)
          ],
        ),
      ),
    );

  }
}

