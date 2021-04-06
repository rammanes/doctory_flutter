import 'package:doctory_flutter/translation/language_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Styles.dart';
import '../../colors.dart';
import 'FirstStep.dart';

class ThirdStep extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ThirdStepState();
  }

}class ThirdStepState extends State<ThirdStep>{

  double screenWidth = 0.0 ;
  double screenHeight = 0.0;
  final _genderController = new TextEditingController();
  final _birthController = new TextEditingController();
  final _bloodController = new TextEditingController();

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
              padding: EdgeInsets.fromLTRB(0, 8, 16, 16),
              child: Image.asset("assets/row/registration/doctor.png",height: screenHeight/2.2,width: screenWidth/2,),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(8, 8, 8,8),
              child:shadowTextView( getTranslated(context, "gender"), selectGender),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 8, 8,8),
              child:shadowTextView( getTranslated(context, "birthday"), selectBirthday),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 8, 8,8),
              child:shadowTextView( getTranslated(context, "blood_type"), selectBloodType),
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
    // Route route = MaterialPageRoute(builder: (context) => ThirdStep());
    //Navigator.pushReplacement(context, route);
  }

  void onClickBack(){
    Route route = MaterialPageRoute(builder: (context) => FirstStep());
    Navigator.pushReplacement(context, route);
  }

  void selectGender(){
    print("select gender");
  }

  void selectBirthday(){
    print("select birthday");
  }

  void selectBloodType(){
    print("select blood Type");
  }

  getScreenSize(){
    setState(() {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;
    });
  }
}