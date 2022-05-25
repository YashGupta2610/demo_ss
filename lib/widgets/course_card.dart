
import 'dart:ui';


import 'package:flutter/material.dart';
import 'subjects.dart';


class RecipeCard extends StatelessWidget {
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
  RecipeCard({
    this.title='',
    this.description= '',
    this.startTime='',
    this.endTime='',
    this.rating='',
    this.thumbnailUrl='',
    this.endDate='',
    this.startDate='',
    this.monthlyFees=0.0,
    this.oneTimeFees=0.0,
    this.seats=0,});
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(context,  MaterialPageRoute(builder: (context) => SubjectsScroller(title: title,
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
        //CourseDetails(
        //   title: title,
        //   description : description,
        //   startTime: startTime,
        //   endTime: endTime,
        //   rating:rating,
        //   thumbnailUrl : thumbnailUrl,
        //   endDate: endDate,
        //   startDate : startDate,
        //   monthlyFees : monthlyFees,
        //   oneTimeFees: oneTimeFees,
        //   seats : seats,)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.multiply,
            ),
            image: NetworkImage(thumbnailUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              alignment: Alignment.center,
            ),
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                          size: 18,
                        ),
                        SizedBox(width: 7),
                        Text(rating,
                          style: TextStyle(
                            color: Colors.white,
                          ),),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Colors.yellow,
                          size: 12,
                        ),
                        SizedBox(width: 5),
                        Text(startTime,
                          style: TextStyle(
                            color: Colors.white,
                          ),),
                        SizedBox(width: 2.0,),
                        Text('-', style: TextStyle(color: Colors.white,),),
                        SizedBox(width: 2.0,),
                        Text(endTime,
                          style: TextStyle(
                            color: Colors.white,
                          ),),
                      ],
                    ),
                  )
                ],
              ),
              alignment: Alignment.bottomLeft,
            ),
          ],
        ),
      ),


    );
  }

}