import 'dart:ui';
import 'EmailVerification.dart';
import 'package:flutter/material.dart';
import 'package:demo_ss/constants.dart';

import 'dart:core';



class EmailInput extends StatefulWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  String str = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgrounCol,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              children: <Widget>[

                Center(child: Image.asset('images/Mail-rafiki.png',
                  width: 300.0,
                  height: 300.0,),),

                Padding(
                  padding: EdgeInsets.all(15),

                  child:  TextField(
                    controller: firstNameController,



                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 3,color:Color. fromRGBO(203, 182,130, 1.0)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Color. fromRGBO(203, 182,130, 1.0), width:2.0),
                      ),
                      labelText: 'First Name',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Enter First Name',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),


                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 3,color:Color. fromRGBO(203, 182,130, 1.0)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Color. fromRGBO(203, 182,130, 1.0), width:2.0),
                      ),
                      labelText: 'Last Name',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Enter First Name',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                      controller: emailController,

                      onChanged: (text) {
                        setState(() {
                          str = validateEmail(text);
                          Text(str);
                          print("here");
                          //you can access nameController in its scope to get
                          // the value of text entered as shown below
                          //fullName = nameController.text;
                        });
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(width: 3,color:Color. fromRGBO(203, 182,130, 1.0)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Color. fromRGBO(203, 182,130, 1.0), width:2.0),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter Your Email Address',
                        hintStyle: TextStyle(color: Colors.black),
                      )
                  ),
                ),
                SizedBox(height: 10.0,),

                FlatButton(
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.08,

                  textColor: Colors.white,
                  color: Colors.orangeAccent[400],
                  child: Text('Verify Email'),
                  onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context) => EmailVerification()));

                  },
                )

              ],),
          ),
        ),
      ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value) || value == null)
      return 'Enter a valid email address';
    else
      return '';
  }
}



