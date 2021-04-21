import 'package:doctory_flutter/Dashboard/blocs/DashboardBlocs.dart';
import 'package:doctory_flutter/Dashboard/model/AppontmentModel.dart';
import 'package:doctory_flutter/colors.dart';
import 'package:doctory_flutter/translation/language_constants.dart';
import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getTranslated(context, 'appointments'),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.16,
                    color: dBlack),
              ),
              GestureDetector(
                onTap: () => print("see all"),
                child: Text(
                  getTranslated(context, 'see'),
                  style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.w800,
                      color: dGrey),
                ),
              ),
            ],
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
    return  Container(
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
    );
  }

}
