import 'package:doctory_flutter/Login/model/LoginResponse.dart';
import 'package:doctory_flutter/Login/resources/LoginRepository.dart';

import 'package:rxdart/rxdart.dart';

class LoginBloc {

  final _repository = LoginRepository();
  final _userFetcher = PublishSubject<LoginResponse>();


 // Observable<LoginResponse> get usersData => _userFetcher.stream;


  Future<LoginResponse> login(String email, String pass) async {
    LoginResponse userModel = await _repository.login(email,pass);
    return userModel;
  //  _userFetcher.sink.add(userModel);
  }



  dispose() {
    _userFetcher.close();
  }

}

final loginBloc = LoginBloc();
