import 'package:doctory_flutter/Login/model/LoginResponse.dart';
import 'package:doctory_flutter/Login/resources/LoginApiProvider.dart';


class LoginRepository{

  final loginApiProvider = LoginApiProvider();


  Future<LoginResponse> login(String email,String pass) => loginApiProvider.login(email, pass);

}