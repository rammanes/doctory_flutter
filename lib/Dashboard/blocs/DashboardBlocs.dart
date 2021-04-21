
import 'package:doctory_flutter/Dashboard/model/AppontmentModel.dart';
import 'package:doctory_flutter/Dashboard/model/SpecialistModel.dart';
import 'package:doctory_flutter/Dashboard/resources/DashboardRepository.dart';
import 'package:rxdart/rxdart.dart';

class SpecialistBloc{
  final _respository= SpecialistRepository();
  final _specialistFetcher= PublishSubject<Specialist>();
  Observable<Specialist> get allSpecialist=> _specialistFetcher.stream;
  Future<Specialist> fetchSpecialist() async{
    Specialist specialistModel= await _respository.specialist();
    _specialistFetcher.sink.add(specialistModel);
  }
  dispose(){
    _specialistFetcher.close();
  }
}
final specialistBloc= SpecialistBloc();
// this section holds the appointment bloc data
class AppointmentBloc{
  final _repository = AppointMentRepository();
  final _appointmentFetcher = PublishSubject<AppointmentModel>();
  Observable<AppointmentModel> get allAppointment => _appointmentFetcher.stream;
  Future<AppointmentModel> fetchAppointment() async {
    AppointmentModel appointmentModel = await _repository.appointment();
    _appointmentFetcher.sink.add(appointmentModel);
  }
  dispose(){
    _appointmentFetcher.close();
  }

}
final appointmentBloc =AppointmentBloc();