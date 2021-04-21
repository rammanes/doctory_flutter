import 'package:doctory_flutter/Styles.dart';
import 'package:doctory_flutter/colors.dart';
import 'package:flutter/material.dart';

class DashboardBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 180,
        decoration: BoxDecoration(
          color: dBlue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset("assets/icons/65.png"),

                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom:0),
                    child: Text("COVID-19", style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 0.47,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.5,
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("All you need to know", style: TextStyle(
                      color: Colors.white,
                    ),),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(8.0),
                    child: button('Read more', 150, Colors.white, cBlack, colorBlue, onClick),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void onClick(){

  }
}
