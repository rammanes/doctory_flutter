

import 'dart:convert';

import 'package:doctory_flutter/APIs.dart';
import 'package:doctory_flutter/Dashboard/model/AppontmentModel.dart';
import 'package:doctory_flutter/Dashboard/model/SpecialistModel.dart';
import 'package:doctory_flutter/Dashboard/resources/Network.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' show Client, Response;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
// Api provider for the specialist class

class SpecialistApiProvider{
  //Client client= Client();

  Future<Specialist> getSpecialist() async{
    print ("entered");
    Map <String,String> headers = {'content-type':'application/json'};

   NetworkCall networkCall=  NetworkCall(specialist_api, headers);
    //if(response.statusCode==200){
   //   print(response.body);
    //    return Specialist.fromJson(json.decode(response.body));
     //  }else{
    //     return null;
   // }
    var specialistData= await networkCall.getRequest();
    return Specialist.fromJson(json.decode(specialistData));
  }
}

// Appointment API provider class

class AppointmentApiProvider {
  //Client client= Client();
  Future<AppointmentModel> getAppointments() async {
  //  Map <String, String> headers = {'content-type': 'application/json',
   //   'Authorization': 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6NCwiZXhwIjoxNjIwMzY5MzE0LCJ0dGwiOjQzODAwLCJ0eXBlIjoiYXV0aCIsImtleSI6IjI3MDQ2MGMwLWQ2MTYtNGU1Yi04NmIxLWYwYjIyMGM1ZDM2OSIsInByb2plY3QiOiJkb2N0b3J5In0.IeH2nOhxapAl20NV1PSQLvkHu7vtOGKUfWixL0vhqkg'};
  //  NetworkCall networkCall = NetworkCall(appointment_api, headers);
  //  var appointmentData = await networkCall.getRequest();
  //  return AppointmentModel.fromJson(json.decode(appointmentData));

    final response = await http.get(
      Uri.parse('https://doctory.s2.rocksoft.io/public/doctory/items/appointments?fields=id,status,video_room_id,rating,type,date,time,date_time,medical_file,doctor.department.name,doctor.doctor_id.first_name,doctor.doctor_id.last_name,doctor.doctor_id.avatar.data,doctor.doctor_id.id,rating&filter[medical_file.owner]=4&filter[status][in]=progress,pending&sort=-date_time'),
      headers: {HttpHeaders.authorizationHeader: 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6NCwiZXhwIjoxNjIwMzY5MzE0LCJ0dGwiOjQzODAwLCJ0eXBlIjoiYXV0aCIsImtleSI6IjI3MDQ2MGMwLWQ2MTYtNGU1Yi04NmIxLWYwYjIyMGM1ZDM2OSIsInByb2plY3QiOiJkb2N0b3J5In0.IeH2nOhxapAl20NV1PSQLvkHu7vtOGKUfWixL0vhqkg'},
    );
    final responseJson = jsonDecode(response.body);
    print(response.body);

    return AppointmentModel.fromJson(responseJson);
  }
}
