import 'package:doctory_flutter/Dashboard/blocs/DashboardBlocs.dart';
import 'package:doctory_flutter/Dashboard/model/SpecialistModel.dart';
import 'package:doctory_flutter/colors.dart';
import 'package:doctory_flutter/translation/language_constants.dart';
import 'package:flutter/material.dart';

class SpecialistCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    specialistBloc.fetchSpecialist();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getTranslated(context, 'specialist'),
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
            stream: specialistBloc.allSpecialist,
            builder: (context, AsyncSnapshot<Specialist> snapshot){
              if(snapshot.hasData){
                return buildSpecialistGrid(snapshot);
              }else if(snapshot.hasError){
                return Text(snapshot.error.toString());
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }

          ),

        ]));
  }
  Widget buildSpecialistGrid(AsyncSnapshot<Specialist> snapshot){
    return  Container(
      height: 350,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:2,
        ),
        itemCount: snapshot.data.specialist.length,
        itemBuilder: (BuildContext context, int index){
          SpecialistItem specialistItem= snapshot.data.specialist[index];
          return Container(
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
          );
        },
      ),

    );
  }
}
