import 'package:flutter/material.dart';
import 'dart:math';
import '../constants.dart';

import 'tiemSlots.dart';

class SubjectsScroller extends StatelessWidget {

  // const CategoriesScroller();
  final String title;
  final String description;
  final String rating;
  final String startTime;
  final String endTime;
  final String startDate;
  final String endDate;
  final double monthlyFees;
  final double oneTimeFees;
  final String thumbnailUrl;
  final int seats;
  SubjectsScroller({
    this.title='IIT Master Course',
    this.description= 'Test Description',
    this.startTime='09:00 am',
    this.endTime='11:00 am',
    this.rating='5.0',
    this.thumbnailUrl='00',
    this.endDate='1-12-2022',
    this.startDate='1-1-2022',
    this.monthlyFees=5500.0,
    this.oneTimeFees=12000.0,
    this.seats=60});
  @override
  Widget build(BuildContext context) {

    final double categoryHeight = MediaQuery.of(context).size.height * 0.20 ;

    return  Scaffold(
      backgroundColor: kBackgrounCol,
      body:  SafeArea(

          child: Expanded(

            // margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            // child: FittedBox(
            //   fit: BoxFit.fill,
            //   alignment: Alignment.topCenter,
            child: Wrap(

              runSpacing: 15.0,
              children: <Widget>[

                SubjectCard("Subject 1", "8hrs", "7", categoryHeight, context),
                SubjectCard("Subject 2", "9hrs", "15", categoryHeight, context),
                SubjectCard("Subject 3", "5hrs", "4", categoryHeight, context),
                SubjectCard("Subject 4", "9hrs", "9", categoryHeight,context),
                SubjectCard("Subject 5", "8hrs", "8", categoryHeight,context),
              ],
            ),
            // ),
          ),
        ),


    );
  }

  Container SubjectCard(
      String subjectName,
      String duration,
      String totalTimeSlots,
      double categoryHeight,
      BuildContext context
      )

  {
    final List items = [ Colors.orange.shade400,   Colors.orangeAccent.shade400, Colors.orangeAccent.shade700];
    var rand =Random();
    int colroNumber = rand.nextInt(3);
    return Container(

      width: 150,
      margin: EdgeInsets.only(right: 20),

      height: categoryHeight,
      decoration: BoxDecoration(color: items[colroNumber], borderRadius: BorderRadius.all(Radius.circular(20.0)
      ),
          boxShadow: [ BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),]

      ),
      child: GestureDetector(
        onTap: (){

          Navigator.push(context,  MaterialPageRoute(builder: (context) => CourseDetails(
            title: title,
            description : description,
            startTime: startTime,
            endTime: endTime,
            rating:rating,
            thumbnailUrl : thumbnailUrl,
            endDate: endDate,
            startDate : startDate,
            monthlyFees : monthlyFees,
            oneTimeFees: oneTimeFees,
            seats : seats,)));

        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  subjectName,
                  style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Duration of class : $duration",
                  style: TextStyle(fontSize: 16, color: Colors.white),

                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Time Slots Available : $totalTimeSlots",
                  style: TextStyle(fontSize: 12, color: Colors.white),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



