import 'package:doctory_flutter/Dashboard/blocs/DashboardBlocs.dart';
import 'package:doctory_flutter/Dashboard/model/AppontmentModel.dart';
import 'package:doctory_flutter/colors.dart';
import 'package:doctory_flutter/translation/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppointmentCarousel extends StatelessWidget {
  var dateFormat = new DateFormat("dd MMM yyyy,  hh:mm aa");
  String title = "Dr.";
  toLocal(var parsedDate){
    var utcDate= dateFormat.format(DateTime.parse(parsedDate));
    print("Here is the UTC date"+ utcDate);
    var localDate= dateFormat.parse(utcDate, true).toLocal().toString();
    String createdDate= dateFormat.format(DateTime.parse(localDate));
    print("Here is the converted date"+ createdDate);
    return createdDate;
  }
  @override
  Widget build(BuildContext context) {
    appointmentBloc.fetchAppointment();
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getTranslated(context, 'appointments'),
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.16,
                  color:  const Color(0xff4b4b4b),),
              ),
              GestureDetector(
                onTap: () => print("see all"),
                child: Text(
                  getTranslated(context, 'see'),
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.w500,
                    color:  const Color(0xff9e9e9e),),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          StreamBuilder(
              stream: appointmentBloc.allAppointment,
              builder: (context , AsyncSnapshot<AppointmentModel> snapshot){
                if(snapshot.hasData){
                  return buildAppointmentGrid(snapshot);
                }else if(snapshot.hasError){
                  return Text(snapshot.error.toString());
                }
                return CircularProgressIndicator();
              }
          ),

        ],
      ),
    );
  }
  Widget buildAppointmentGrid(AsyncSnapshot<AppointmentModel> snapshot){
    return // Rectangle 1869
      Container(
          height: 150,
         color: Colors.white,
        child: ListView.builder(
            itemCount: snapshot.data.appointment.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              AppointmentItem appointmentItem= snapshot.data.appointment[index];
              return Container(
                margin: EdgeInsets.all(8),
                width: 250,

                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(16)
                      ),
                      boxShadow: [BoxShadow(
                          color: const Color(0x26acacac),
                          offset: Offset(0,8),
                          blurRadius: 10,
                          spreadRadius: 0
                      )] ,
                    color: (index % 2 != 0)? cSkyBlue: Colors.white,
                  ),
                  child: (
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 25, right: 20),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Text(appointmentItem.doctor.department.name, style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.16,
                                        color:  const Color(0xff1e1e1e),), ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: [
                                      Text('$title ${appointmentItem.doctor.doctor_id.first_name} ${appointmentItem.doctor.doctor_id.last_name}', style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.16,
                                          color: cBlack), ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(toLocal(appointmentItem.date_time), style: GoogleFonts.poppins(
                                          fontSize: 13.5,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.16,
                                          color: const Color(0xff9e9e9e),), ),

                                      Icon(Icons.arrow_forward_ios_rounded, size: 15,)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              );
            }),
      );
    /*Container(
      height: 150,
      color: Colors.white,
      child: ListView.builder(
          itemCount: snapshot.data.appointment.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            AppointmentItem appointmentItem= snapshot.data.appointment[index];
            return Container(
              margin: EdgeInsets.all(8),
              width: 250,

              child: (Card(
                color: (index % 2 != 0)? cSkyBlue: Colors.white,
                elevation: 1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 25, right: 20),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Text(appointmentItem.doctor.department.name, style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.16,
                                    color: cBlack), ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text('$title ${appointmentItem.doctor.doctor_id.first_name} ${appointmentItem.doctor.doctor_id.last_name}', style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.16,
                                    color: cBlack), ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(toLocal(appointmentItem.date_time), style: TextStyle(
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0.16,
                                    color: dGrey), ),

                                Icon(Icons.arrow_forward_ios_rounded, size: 15,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
            );
          }),
    );*/
  }

}
