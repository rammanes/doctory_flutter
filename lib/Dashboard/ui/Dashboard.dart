import 'package:doctory_flutter/Dashboard/widgets/appointmentsCarousel.dart';
import 'package:doctory_flutter/Dashboard/widgets/dashboardBanner.dart';
import 'package:doctory_flutter/Dashboard/widgets/specialistCarousel.dart';
import 'package:doctory_flutter/Styles.dart';
import 'package:doctory_flutter/translation/language_constants.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double screenHeight = 0.0;
  double screenWidth = 0.0;
  int _selectedItem= 0;
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
              SpecialistCarousel(),
              AppointmentCarousel(),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(top: 32, left: 8, bottom: 32),
                child:button(getTranslated(context, 'schedule'),
                    250, colorBlue, Colors.white, Colors.grey.withOpacity(0.2), doSchedule),
              ),

            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildNavBar('assets/icons/path_941.png', 0),
              buildNavBar('assets/icons/group_338.png', 1),
              buildNavBar('assets/icons/group_337.png', 2),
              buildNavBar('assets/icons/icons_file_records.png', 3),
              buildNavBar('assets/icons/notifications.png', 4),
            ],
          ),
        ),
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
      child: ImageIcon(AssetImage(location,), color: index == _selectedItem ? colorBlue : iColor,
        size: 39,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child:Image(
                        image: AssetImage("assets/icons/1.png"),
                        color: null,
                      )
                    ),
                    Text(
                      "Hello Mosaab",
                      style: TextStyle(
                        color: colorGray,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ImageIcon(
                        AssetImage("assets/icons/bell.png"),
                        color: iColor,
                      )
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 15),
                      child: ImageIcon(AssetImage("assets/icons/user.png"), color: iColor,
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void doSchedule(){

  }

}