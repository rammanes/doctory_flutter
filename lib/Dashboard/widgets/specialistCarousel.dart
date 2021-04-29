import 'package:doctory_flutter/Dashboard/blocs/DashboardBlocs.dart';
import 'package:doctory_flutter/Dashboard/model/SpecialistModel.dart';
import 'package:doctory_flutter/colors.dart';
import 'package:doctory_flutter/translation/language_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialistCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    specialistBloc.fetchSpecialist();
    return Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getTranslated(context, 'specialist'),
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.16,
                  color: const Color(0xff4b4b4b)),
              ),
              GestureDetector(
                onTap: () => print("see all"),
                child: Text(
                  getTranslated(context, 'see'),
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.w500,
                    color:  const Color(0xff9e9e9e),
                ),
              ),),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          StreamBuilder(
              stream: specialistBloc.allSpecialist,
              builder: (context, AsyncSnapshot<Specialist> snapshot) {
                if (snapshot.hasData) {
                  return buildSpecialistGrid(snapshot);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ]));
  }

  Widget buildSpecialistGrid(AsyncSnapshot<Specialist> snapshot) {
    return Container(
      height: 350,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: snapshot.data.specialist.length,
        itemBuilder: (BuildContext context, int index) {
          SpecialistItem specialistItem = snapshot.data.specialist[index];
          return Container(
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              width: 55,
              height: 40.521484375,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0x0d000000),
                        offset: Offset(0, 10),
                        blurRadius: 20,
                        spreadRadius: 0)
                  ],
                  color: const Color(0xffffffff)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: iLightBlue.withOpacity(0.2),
                    ),
                    child: Container(
                      child: ImageIcon(
                        NetworkImage(specialistItem.avatar.data.thumbnail[3].url),
                        color: colorBlue,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(specialistItem.name,style: GoogleFonts.poppins(
                        color:  const Color(0xff1e1e1e),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.33
                    ),),
                  )
                ],
              ),
            ),
          );
          /* Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(8),
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: iLightBlue.withOpacity(0.2),
                      ),
                      child: Container(
                        child: ImageIcon(
                          NetworkImage(specialistItem.avatar.data.thumbnail[3].url),
                          color: colorBlue,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(specialistItem.name,style: TextStyle(
                          color: cBlack,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.33
                      ),),
                    )
                  ],
                ),
              ),
            ),
          );*/
        },
      ),
    );
  }
}
