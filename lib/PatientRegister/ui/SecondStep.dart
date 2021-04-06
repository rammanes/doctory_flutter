import 'package:doctory_flutter/translation/language_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Styles.dart';
import '../../colors.dart';
import 'FirstStep.dart';
import 'ThirdStep.dart';

class SecondStep extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SecondStepState();
  }

}class SecondStepState extends State<SecondStep>{

  double screenWidth = 0.0 ;
  double screenHeight = 0.0;
  final _emailController = new TextEditingController();
  final _phoneController = new TextEditingController();
  final _passwordController = new TextEditingController();
  final _rePasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    getScreenSize();
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.topLeft,
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Image.asset("assets/row/login/doctory_full_copy.png",height: 50,width: screenWidth/4,),
            ),

            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0, 32, 16, 16),
              child: Image.asset("assets/row/registration/doctor.png",height: screenHeight/2.9,width: screenWidth/2,),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(8, 8, 8,8),
              child:shadowTextField(_emailController, getTranslated(context, "email")),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 8, 8,8),
              child:shadowTextField(_phoneController, getTranslated(context, "phone_number")),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 8, 8,8),
              child:shadowTextField(_passwordController, getTranslated(context, "password")),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 8, 8,8),
              child:shadowTextField(_rePasswordController, getTranslated(context, "repeat_password")),
            ),

            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 16,right: 8,left: 8),
                  child:button(getTranslated(context, "back"),
                      screenWidth/2.45, Colors.white, colorBlue, Colors.grey.withOpacity(0.1),onClickBack),
                ),

                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(top: 16, left: 8,right: 8),
                  child:button(getTranslated(context, "next"),
                      screenWidth/2.45, colorBlue, Colors.white, Colors.grey.withOpacity(0.2), onclickNext),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  void onclickNext() {
    Route route = MaterialPageRoute(builder: (context) => ThirdStep());
    Navigator.pushReplacement(context, route);
  }

  void onClickBack(){
    Route route = MaterialPageRoute(builder: (context) => FirstStep());
    Navigator.pushReplacement(context, route);
  }

  getScreenSize(){
    setState(() {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;
    });
  }
}