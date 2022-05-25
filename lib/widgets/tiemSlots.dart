
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:demo_ss/constants.dart';


class CourseDetails extends StatelessWidget {


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
  CourseDetails({
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
    return Scaffold(
      backgroundColor: kBackgrounCol,
      body: SingleChildScrollView(
        // child: Container(
        //   padding: EdgeInsets.all(10.0),
        //   margin: EdgeInsets.all(10.0),
          // width: MediaQuery.of(context).size.width * 1,
          // height: MediaQuery.of(context).size.height * 0.4,
          child: Wrap(
            children : [ Card(

              clipBehavior: Clip.antiAlias,
              color: Colors.orangeAccent[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10.0,
              shadowColor: Colors.grey[800],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      child: Wrap(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 35.0,
                            backgroundImage: AssetImage('images/city_background.jpg'),
                          ),
                          SizedBox(width: 15.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text('$title',
                                  textAlign: TextAlign.left,
                                  style : TextStyle(

                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                              Text(description),
                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 10.0,),


                    Wrap(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        detailBox('Date', startDate, endDate),



                        detailBox('Time', startTime, endTime),
                      ],
                    ),
                    SizedBox(height: 10.0,),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text("OneTime Fee",style : TextStyle(

                              fontSize: 15.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.black, ),),
                            Text('$oneTimeFees',
                              style: TextStyle(fontSize: 16, color: Colors.black, height: 1.5),),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Monthly  Fee",style : TextStyle(

                              fontSize: 15.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,),),
                            Text("$monthlyFees",
                              style: TextStyle(fontSize: 16, color: Colors.black, height: 1.5),),
                          ],
                        ),
                        Column(

                          children: [
                            Text('Available Seats ',
                              style : TextStyle(

                                fontSize: 15.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,),),
                            Text("$seats",
                              style: TextStyle(fontSize: 16, color: Colors.black, height: 1.5),),
                          ],
                        ),
                      ],
                    ),



                  ],
                ),
              ),

            ),],
          ),
        ),
      // ),
    );
  }
  Container detailBox(String x, String start, String end){
    return Container(
      margin: EdgeInsets.all(5.0),
      padding:  EdgeInsets.all(10.0),

      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          new BoxShadow(color: Colors.green.shade200, offset: new Offset(3.0, 3.0),),
        ],
      ),

      //  color: Colors.orange[100],


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$x : ',
            style : TextStyle(

              fontSize: 20.0,
              fontWeight: FontWeight.w900,
              color: Colors.black,),),
          SizedBox(height: 8,),
          Row(
            children: <Widget>[

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Starting $x",),
                  SizedBox(height: 4,),
                  Text('$start'),
                ],
              ),
              const VerticalDivider(
                thickness: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Ending $x',),
                  SizedBox(height: 4,),
                  Text('$end'),
                ],
              )

            ],
          ),
        ],
      ),
    );
  }
}
