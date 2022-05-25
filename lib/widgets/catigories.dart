
import 'dart:ui';

import "package:flutter/material.dart";
import 'package:demo_ss/constants.dart';

import 'course_card.dart';

class Categories extends StatelessWidget{
  final String categoryTitle;

  Categories({this.categoryTitle=''});
  // this.title='IIT Master Course',
  // this.description= 'Test Description',
  // this.startTime='09:00 am',
  // this.endTime='11:00 am',
  // this.rating='5.0',
  // this.thumbnailUrl='00',
  // this.endDate='1-12-2022',
  // this.startDate='1-1-2022',
  // this.monthlyFees=5500.0,
  // this.oneTimeFees=12000.0,
  // this.seats=60});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: kBackgrounCol,
      body: Container(
        decoration: BoxDecoration(
          color: kBackgrounCol,
        ),
        child: SafeArea(
          child: GestureDetector(
              onTap: (){
                Navigator.push((context), MaterialPageRoute(builder: (context) =>
                    cardCourse()));},
              child: categoryList(categoryTitle)
          ),
        ),
      ),
    );
  }
  Card categoryList(String categoryTitle){

    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 2.0,
      color: Colors.orangeAccent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: ListTile(
        leading: Icon(Icons.my_library_books,
          color: Colors.white,),
        title: Text(categoryTitle,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),),
      ),
    );
  }
  Scaffold cardCourse(){

    return Scaffold(
      backgroundColor: kBackgrounCol,
      body: SingleChildScrollView(
      child: Column(
        children: [
          RecipeCard(title: 'Computer Application',description: 'Test Description' ,startTime: '07:00', endTime: '08:00 am',rating: '5.0',startDate: '01-01-2022',endDate: '01-12-2022',monthlyFees:  5000.0,oneTimeFees: 50000.0,seats: 60,thumbnailUrl: 'https://sparc.org.in/wp-content/uploads/2018/12/cca-course-in-gtb-nagar-sparc-academy.png',),
          RecipeCard(title: 'IIT Master Course',description: 'Test Description' ,startTime: '08:00', endTime: '09:00 am',rating: '4.3',startDate: '01-01-2022',endDate: '01-12-2022',monthlyFees:  5000.0,oneTimeFees: 50000.0,seats: 60,thumbnailUrl: 'https://d2cyt36b7wnvt9.cloudfront.net/exams/wp-content/uploads/2021/04/21171137/IIT-Courses.png',),
          RecipeCard(title: 'Maths',description: 'Test Description' ,startTime: '09:00', endTime: '11:00 am',rating: '4.7',startDate: '01-01-2022',endDate: '01-12-2022',monthlyFees:  5000.0,oneTimeFees: 50000.0,seats: 60,thumbnailUrl: 'https://studiousguy.com/wp-content/uploads/2019/10/maths-applications.jpg',),
          RecipeCard(title: 'English',description: 'Test Description' ,startTime: '12:00', endTime: '02:00 pm',rating: '4.5',startDate: '01-01-2022',endDate: '01-12-2022',monthlyFees:  5000.0,oneTimeFees: 50000.0,seats: 60,thumbnailUrl: '',),
          RecipeCard(title: 'History',description: 'Test Description' ,startTime: '03:00', endTime: '05:00 pm',rating: '4.6',startDate: '01-01-2022',endDate: '01-12-2022',monthlyFees:  5000.0,oneTimeFees: 50000.0,seats: 60,thumbnailUrl: '',),
          RecipeCard(title: 'Biology',description: 'Test Description' ,startTime: '06:00', endTime: '08:00 pm',rating: '4.7',startDate: '01-01-2022',endDate: '01-12-2022',monthlyFees:  5000.0,oneTimeFees: 50000.0,seats: 60,thumbnailUrl: '',),
      ],),),
    );
  }
}
