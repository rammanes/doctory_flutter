import 'dart:async';

import 'package:devicelocale/devicelocale.dart';
import 'package:doctory_flutter/Login/ui/LoginScreen.dart';
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
  Timer timer;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,);
  }

  void getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    userId = prefs.getString("userId");
    print("UserID: "+userId.toString());
    role = prefs.getString("role");

    userId = null;


    checkUser();
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

            // Route route = MaterialPageRoute(builder: (context) => PatientDashboard());
            // Navigator.pushReplacement(context, route);
          });
        });
      } else if (role == "4") {
        timer = new Timer(const Duration(milliseconds: 4200), () {
          setState(() {
            // open patient dashboard

            // Route route = MaterialPageRoute(builder: (context) => DoctorDashboard());
            // Navigator.pushReplacement(context, route);
          });
        });
      }
    }
  }
  
}