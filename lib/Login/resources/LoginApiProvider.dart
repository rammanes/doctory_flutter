
import 'dart:convert';

import 'package:doctory_flutter/Login/model/LoginResponse.dart';
import 'package:http/http.dart' show Client;

import '../../APIs.dart';

class LoginApiProvider{

  Client client = Client();



  Future<LoginResponse> login(String email, String pass) async {

    Map body =  {
      "email": email,
      "password": pass
    };

    print(body.toString());
    Map <String,String> headers = {'content-type':'application/json'};
   //  'Authorization' : token};
    final response = await client
        .post(login_api,headers: headers, body: json.encode(body) );
    if (response.statusCode == 200) {
      print(response.body);
      // If the call to the server was successful, parse the JSON
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
     // throw Exception("INCORRECT EMAIL OR PASSWORD");

      return null;
    }
  }
}