
import 'package:doctory_flutter/Dashboard/model/AppontmentModel.dart';
import 'package:doctory_flutter/Dashboard/model/SpecialistModel.dart';
import 'package:doctory_flutter/Dashboard/resources/DashboardApiProvider.dart';

// ----- specialist repository-----

class SpecialistRepository{
  final specialistApiProvider= SpecialistApiProvider();

  Future<Specialist> specialist() => specialistApiProvider.getSpecialist();
}


//--------- appointments repository------

class AppointMentRepository{
  final appointmentApiProvider = AppointmentApiProvider();
  Future<AppointmentModel> appointment() => appointmentApiProvider.getAppointments();

}