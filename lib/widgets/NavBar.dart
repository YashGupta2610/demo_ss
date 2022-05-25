import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo_ss/pages/course_p2.dart';
import 'package:demo_ss/pages/ebook_p3.dart';
import 'package:demo_ss/pages/more_p5.dart';
import 'package:demo_ss/pages/test_p4.dart';
import 'package:flutter/material.dart';
import 'package:demo_ss/pages/home_p1.dart';
class NavBar extends StatefulWidget {
  // const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
  late BuildContext context;
  NavBar(){
    this.context = context;
  }
}

class _NavBarState extends State<NavBar> {


  int pageIndex = 0;

  final pages = [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
    Page5(),
  ];


  Widget build(BuildContext context) {
    return buildMyNavBar(context);
  }

  CurvedNavigationBar buildMyNavBar(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.orangeAccent,
      backgroundColor: Color(0xffC4DFCB),
      animationCurve: Curves.easeInOutCubicEmphasized,
      items: <Widget>[
        Icon(Icons.home_filled, color: Colors.white,
          size: 35,
          semanticLabel: "HOME",),
        Icon(Icons.menu_book_outlined, color: Colors.white,
          size: 35,
          semanticLabel: "COURSES",),
        Icon(Icons.widgets_rounded, color: Colors.white,
          size: 35,
          semanticLabel: "E-BOOKS",),
        Icon(
          Icons.person, color: Colors.white, size: 35, semanticLabel: "TEST",),
        Icon(Icons.menu, color: Colors.white, size: 35, semanticLabel: "MORE",),


      ],
      onTap: (index) {
        setState(() {
          print('On page $index');
          pageIndex = index;
        });
      },
    );
  }


}
