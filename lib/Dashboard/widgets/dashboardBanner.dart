import 'package:doctory_flutter/Styles.dart';
import 'package:doctory_flutter/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: dBlue,
          borderRadius: BorderRadius.circular(20),
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
                    child: Text(
                        "COVID-19",
                        style: GoogleFonts.poppins(
                            color:  const Color(0xffffffff),
                            fontWeight: FontWeight.w600,
                            fontStyle:  FontStyle.normal,
                            fontSize: 18.7
                        ),
                        textAlign: TextAlign.left
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text("All you need to know",
                      style: GoogleFonts.poppins(
                      color: Colors.white,
                        fontSize: 10.7
                    ),),
                  ),
                  // Rectangle 1843
                  Container(
                      width: 120,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(25)
                          ),
                          color: const Color(0xfffbfdff)
                      ),
                    child: // Read more
                    Text(
                        "Read more",
                        style: GoogleFonts.poppins(
                            color:  const Color(0xff1e1e1e),
                            fontWeight: FontWeight.w500,
                            fontStyle:  FontStyle.normal,
                            fontSize: 13.7
                        ),
                        textAlign: TextAlign.center
                    )
                  ),
                 /* Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(8.0),
                    child: button('Read more', 150, Colors.white, cBlack, colorBlue, onClick),
                  ),*/
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
