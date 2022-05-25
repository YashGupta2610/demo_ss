import 'dart:ui';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'verification.dart';

import 'package:flutter/material.dart';
import 'package:demo_ss/constants.dart';



class NumberVerification extends StatefulWidget {
  const NumberVerification({Key? key}) : super(key: key);

  @override
  State<NumberVerification> createState() => _NumberVerificationState();
}

class _NumberVerificationState extends State<NumberVerification> {
  @override
  String initialCountry = 'US';
  PhoneNumber number = PhoneNumber(isoCode: 'US');
  final TextEditingController controller = TextEditingController();

  bool _isLoading=false;//verification check veriable


  //final  GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey();
  TextEditingController phone=TextEditingController();
  TextEditingController name=TextEditingController();


  Widget build(BuildContext context) {
    return
      // Scaffold(
      // backgroundColor: kBackgrounCol,
      // body:
      SingleChildScrollView(
        //key:_scaffoldKey,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(

              children: <Widget>[
                Center(child: Image.asset('images/OTP Image.png',
                  width: 300.0,
                  height: 300.0,),),
                SizedBox(
                  height: 10.0,
                ),
                Text('Verify Your Number',
                    style: kHeadText),
                SizedBox(height: 10.0,),
                Text("Please enter your mobile number to recieve a verification code.No carrier rater will be applied.",
                    textAlign: TextAlign.center,
                    style: kParagraphText),
                SizedBox(height: 10,),
                //         Stack(
                //           children: [
                //
                //
                //
                //
                //
                //             InternationalPhoneNumberInput(onInputChanged: (PhoneNumber number) {
                // print(number.phoneNumber);
                //
                //
                // },
                //
                //     countrySelectorScrollControlled: false,
                //               locale: 'India',
                //     onInputValidated: (bool value) {
                //     print(value);
                //   },
                //
                //   selectorConfig: SelectorConfig(selectorType: PhoneInputSelectorType.BOTTOM_SHEET,),
                //
                //
                //
                //   ignoreBlank: false,
                //   autoValidateMode: AutovalidateMode.disabled,
                //   selectorTextStyle: TextStyle(color: Colors.black),
                //   textFieldController: controller,
                //   formatInput: false,
                //   maxLength: 10,
                //
                //   keyboardType:
                //   TextInputType.numberWithOptions(signed: true, decimal: true),
                //   cursorColor: Colors.black,
                //
                //   inputDecoration: InputDecoration(
                //     contentPadding: EdgeInsets.only(bottom: 15, left: 0),
                //     border: InputBorder.none,
                //
                //     hintText: 'Phone Number',
                //     hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                //   ),
                //   onSaved: (PhoneNumber number) {
                //     print('On Saved: $number');
                //   },
                // ),
                // Positioned(
                //   left: 90,
                //   top: 8,
                //   bottom: 8,
                //   child: Container(
                //     height: 40,
                //     width: 1,
                //     color: Colors.black.withOpacity(0.13),
                //   ),
                // ),],),


                TextField(
                  cursorColor: Colors.black,
                  onTap: (){
                    setState(() {
                      //_validate_email=false;
                    });
                  },
                  autofocus: true,

                  style: TextStyle(
                      color:Colors.black
                  ),
                  controller: phone,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: 3,color:Color. fromRGBO(203, 182,130, 1.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Color. fromRGBO(203, 182,130, 1.0), width:2.0),
                    ),
                    hintStyle: TextStyle(
                        color: Colors.black45
                    ),
                    prefixStyle:TextStyle(
                        color: Colors.black
                    ),



                    prefix: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("+91"),
                    ),
                    //errorText:_validate_email ?'Field can\'t be empty':null,
                    hintText: 'Enter Phone number',

                    border: OutlineInputBorder( borderSide: const BorderSide(color: Colors.white, ),),

                  ),
                ),




                SizedBox(height: 10,),
                MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    setState(() {
                      if(phone != ''){
                        _isLoading = true;}
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Verificatoin()));
                    });

                    // Future.delayed(Duration(seconds: 2), () {
                    //   setState(() {
                    //     _isLoading = false;
                    //   });
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => Verificatoin()));
                    // });
                  },
                  color: Colors.orangeAccent[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: _isLoading  ? Container(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      color: Colors.orangeAccent[400],
                      strokeWidth: 2,
                    ),
                  ) :
                  Text("Request OTP", style: TextStyle(color: Colors.white),),
                ),

              ],
            ),
          ),
        ),
      // ),
    );


  }
  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
    await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'IN');

    setState(() {
      this.number = number;
    });
  }
}
