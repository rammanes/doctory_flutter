import 'dart:async';

import 'package:devicelocale/devicelocale.dart';
import 'file:///C:/doctory_flutter/lib/Dashboard/ui/Dashboard.dart';
import 'package:doctory_flutter/Login/ui/LoginScreen.dart';
import 'package:doctory_flutter/colors.dart';
import 'package:doctory_flutter/translation/language_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
  
}class SplashState extends State<Splash>{

  String userId;
  String role;
  String token;
  Timer timer;
  double screenWidth = 0.0 ;
  double screenHeight = 0.0;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  getScreenSize(){
    setState(() {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;
    });
  }


  @override
  Widget build(BuildContext context) {
    getScreenSize();
    return Scaffold(
      body: Container(
      color: Colors.white,
    alignment: Alignment.center,
      child: Container(
      width: screenWidth,
        height: screenHeight/4,
        child: Column(
          children: [
            Image.asset("assets/row/login/doctory_full_copy.png",height: screenHeight/7,width: screenWidth/2,),
            Text(
                getTranslated(context, 'splash'),
                style:  TextStyle(
                    color:   colorBlue,
                    fontWeight: FontWeight.w900,
                   // fontStyle:  FontStyle.normal,
                    fontSize: 27.0
                ),
               // textAlign: TextAlign.left
            )
          ],
        ),
      ),
      ),
    );
  }

  void getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    userId = prefs.getString("userId");
    print("UserID: "+userId.toString());
    role = prefs.getString("role");
    token = prefs.get("token");
    print("UserToken   "+token.toString());

    //userId = null;
    setState(() {
      checkUser();
    });

  }

  void checkUser() async{
    if (userId == null || role == null || userId == "0") {
      timer = new Timer(const Duration(milliseconds: 2200), () {
        setState(()  {
        print("user is null");
        // open login screen
        Route route = MaterialPageRoute(builder: (context) => LoginScreen());
        Navigator.pushReplacement(context, route);

         });
      });
    } else if (userId != null && role != null) {
      if (role == "6") {
        timer = new Timer(const Duration(milliseconds: 4200), () {
          setState(() {
            // open doctor dashboard

             Route route = MaterialPageRoute(builder: (context) => Dashboard());
             Navigator.pushReplacement(context, route);
          });
        });
      } else if (role == "4") {
        timer = new Timer(const Duration(milliseconds: 4200), () {
          setState(() {
            // open patient dashboard

             Route route = MaterialPageRoute(builder: (context) => Dashboard());
             Navigator.pushReplacement(context, route);
          });
        });
      }
    }
  }
  
}