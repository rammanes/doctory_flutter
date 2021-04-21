

class AppointmentModel{
  List<AppointmentItem> _appointmentItem;
  AppointmentModel.fromJson(Map <String, dynamic> appointmentJson){
    List<AppointmentItem> appointments = [];
    for(int index= 0; index < appointmentJson["data"].length; index++){
      AppointmentItem appointmentItem= AppointmentItem(appointmentJson["data"][index]);
      appointments.add(appointmentItem);
    }
    _appointmentItem = appointments;
  }
  List<AppointmentItem> get appointment => _appointmentItem;
}

class AppointmentItem{
  Doctor _doctor;
  int _id;
  String _datetime;
  String _status;

  AppointmentItem(appointmentItem){
    _id = appointmentItem["id"];
    _datetime = appointmentItem["date_time"];
    _status = appointmentItem["status"];
    _doctor = Doctor(appointmentItem["doctor"]);

  }
  int get id => _id;
  String get status => _status;
  String get date_time => _datetime;
  Doctor get doctor => _doctor;

}

class Doctor{
  DoctorId _doctorId;
  Department _department;
  Doctor(doctor){
    _doctorId = DoctorId(doctor["doctor_id"]);
    _department= Department(doctor["department"]);
  }
  DoctorId get doctor_id => _doctorId;
  Department get department => _department;
}
class Department{
  String _name;
  Department(department){
    _name = department["name"];
  }
  String get name => _name;
}
class DoctorId{
  int _id;
  String _firstname;
  String _lastname;
  String _avatar;

  DoctorId(doctorId){
    _id = doctorId["id"];
    _firstname = doctorId["first_name"];
    _lastname = doctorId["last_name"];
    _avatar = doctorId["avatar"];
  }

  int get id => _id;
  String get first_name => _firstname;
  String get last_name => _lastname;
  String get avatar => _avatar;
}