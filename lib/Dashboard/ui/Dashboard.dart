import 'package:doctory_flutter/Dashboard/widgets/appointmentsCarousel.dart';
import 'package:doctory_flutter/Dashboard/widgets/bottomNavigationBar.dart';
import 'package:doctory_flutter/Dashboard/widgets/dashboardBanner.dart';
import 'package:doctory_flutter/Dashboard/widgets/specialistCarousel.dart';
import 'package:doctory_flutter/Styles.dart';
import 'package:doctory_flutter/translation/language_constants.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double screenHeight = 0.0;
  double screenWidth = 0.0;
  int _selectedItem = 0;
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DashboardBanner(),
                SizedBox(
                  height: 10
                ),
                SpecialistCarousel(),
                SizedBox(
                    height: 10
                ),
                AppointmentCarousel(),
                // Rectangle 1
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                      width: 250,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(30)
                          ),
                          boxShadow: [BoxShadow(
                              color: const Color(0xffb6b8b9),
                              offset: Offset(0,3),
                              blurRadius: 9,
                              spreadRadius: 0
                          )] ,
                          color: const Color(0xff0971ce)
                      ),
                    child: Text(
                      getTranslated(context, 'schedule'), style: GoogleFonts.poppins(
                        color:  const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                        fontStyle:  FontStyle.normal,
                        fontSize: 15
                    ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
               /* Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(top: 32, left: 8, bottom: 32),
                  child: button(
                      getTranslated(context, 'schedule'),
                      250,
                      colorBlue,
                      Colors.white,
                      Colors.grey.withOpacity(0.2),
                      doSchedule),
                ),*/
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      buildNavBar('assets/icons/path_941.svg', 0),
                      buildNavBar("assets/icons/group_337.svg", 1),
                      buildNavBar("assets/icons/group_338.svg", 2),
                      buildNavBar(
                          "assets/icons/icons_file_records.svg", 3),
                      buildNavBar('assets/icons/notifications.svg', 4),
                    ],
                  ),
                )),
          )

          ),
    );
  }

  Widget buildNavBar(String location, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = index;
        });
      },
      child: SvgPicture.asset(
        location,
        color: index == _selectedItem ? colorBlue : null,
      ),
    );
  }

  Widget buildAppBar() {
    return PreferredSize(
      preferredSize: Size(screenWidth, 70),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: 20,
                        height: 23,
                        decoration: new BoxDecoration(),
                        child: Image(
                          image: AssetImage("assets/icons/1.png"),
                          color: null,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Hello Mosaab",
                        style: GoogleFonts.poppins(
                            color: const Color(0xff7c7c7c),
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 18),
                        textAlign: TextAlign.center)
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: SvgPicture.asset("assets/icons/drawable/bell.svg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: SvgPicture.asset("assets/icons/drawable/user.svg", color: iColor,),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void doSchedule() {}
}
