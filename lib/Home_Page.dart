import 'package:demo_ss/pages/home_p1.dart';
import 'pages/course_p2.dart';
import 'pages/test_p4.dart';
import 'pages/more_p5.dart';
import 'pages/ebook_p3.dart';

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {


  int pageIndex=0;
  var pages = <Widget>[
    Page1(),
    Page2(),
    Page3(),
    Page4(),
    Page5(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      appBar: AppBar(
        title: Text("Shiksha Setu",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Theme
                .of(context)
                .primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w500,),
        ),
        actions: [
          IconButton(
            tooltip: 'Notifications',
            icon: Icon(Icons.notifications_none_rounded,
              color: Theme
                  .of(context)
                  .primaryColor,
            ),
            onPressed: () {},),
          IconButton(
            tooltip: 'Search',
            icon: Icon(Icons.search,
              color: Theme
                  .of(context)
                  .primaryColor,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,

      ),

     body:pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }
    CurvedNavigationBar buildMyNavBar(BuildContext context) {
      return CurvedNavigationBar(
        color: Colors.orangeAccent,
        backgroundColor: Color(0xffC4DFCB),
        animationCurve: Curves.easeInOutCubicEmphasized,
        items: <Widget>[
          Icon(Icons.home_filled, color: Colors.white, size: 35, semanticLabel: "HOME",),
          Icon(Icons.menu_book_outlined, color: Colors.white, size: 35, semanticLabel: "COURSES",),
          Icon(Icons.widgets_rounded , color: Colors.white, size: 35, semanticLabel: "E-BOOKS",),
          Icon(Icons.person, color: Colors.white, size: 35, semanticLabel: "TEST",),
          Icon(Icons.menu, color: Colors.white, size: 35,semanticLabel: "MORE",),


        ],
        onTap: (index){
          setState(() {
            print('On page $index');
            pageIndex=index;
          });

        },
      );

    }
}
