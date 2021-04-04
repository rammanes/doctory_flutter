import 'package:doctory_flutter/Login/blocs/LoginBlocs.dart';
import 'package:doctory_flutter/Login/model/LoginResponse.dart';
import 'package:doctory_flutter/Styles.dart';
import 'package:doctory_flutter/colors.dart';
import 'package:doctory_flutter/translation/language_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return LoginScreenState();
  }

}class LoginScreenState extends State<LoginScreen>{

  double screenWidth = 0.0 ;
  double screenHeight = 0.0;
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = "test@doctory.care";
    _passwordController.text = "Test!123";
  }



  @override
  Widget build(BuildContext context) {
    getScreenSize();

    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(32),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
             // width: screenWidth/1.5,
             // height: screenHeight/5,
              padding: EdgeInsets.fromLTRB(64, 64, 64, 0),
                child:Image.asset("assets/row/login/doctory_full_copy.png",)
            ),

            Container(
              padding: EdgeInsets.only(top: 32),
              child: Image.asset("assets/row/login/image_1.png"),
            ),

            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.fromLTRB(0, 8, 0, 40),
              child: Text(
                getTranslated(context, 'welcome'),
                style: TextStyle(
                  color: colorGray,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),

            Container(
            //  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: shadowTextField(_emailController,
                  getTranslated(context, 'user_name')              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(0,16,0, MediaQuery.of(context).viewInsets.bottom),
              child: shadowTextField(_passwordController, getTranslated(context, 'password')),

            ),

            Row(
              children: [
               Container(
                 alignment: Alignment.centerLeft,
                 padding: EdgeInsets.only(top: 32,right: 8),
                 child:button(getTranslated(context, 'register'),
                     screenWidth/2.6, Colors.white, colorBlue, Colors.grey.withOpacity(0.1),onClickRegister),
               ),

                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(top: 32, left: 8),
                  child:button(getTranslated(context, 'login'),
                      screenWidth/2.6, colorBlue, Colors.white, Colors.grey.withOpacity(0.2), onClickLogin),
                ),

              ],
            ),

            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(top: 16,bottom: 16),
              child:RichText(
                text: TextSpan(
                  style: TextStyle(color: colorGray,fontSize: 14,),
                  children: <TextSpan>[
                    TextSpan(text:  getTranslated(context, 'register_doctor_1')),
                    TextSpan(
                        text: getTranslated(context, 'register_doctor_2'),
                        style: TextStyle(color: colorBlue,fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // go to Doctor Registration
                          }),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  void onClickRegister(){
    // go to patient register
  }

  void onClickLogin() {
    checkInputs();
    print("login");

  }

  void checkInputs(){
    String email = _emailController.text.toString();
    String password = _passwordController.text.toString();
    if(email.isEmpty){
      alertDialog("Please enter your email");
    }else if(password.isEmpty){
      alertDialog("Please enter the password");
    }else{
      login();
    }
  }

  void login() async{
    LoginResponse loginResponse = new LoginResponse();
    loginResponse = await loginBloc.login(_emailController.text.toString(), _passwordController.text.toString());
    if(loginResponse == null){
      print ("failed");
    }else {
      String userId = loginResponse.data.user.id;
      String token = loginResponse.data.token;
      String role = loginResponse.data.user.role;
      saveUser(userId, role, token);
      if (role == "4") {
        // go to patient dashboard
      } else if (role == "6") {
        // go to Doctor Dashboard
      }
    }
  }


  saveUser(String userId, String role, String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userId", userId);
    prefs.setString("role",role);
    prefs.setString("token", token);
  }

  getScreenSize(){
    setState(() {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;
    });
  }

  alertDialog(String message){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            // title: Text("Pin"),
            content: Text(message),
          );
        }
    ); //end showDialog()
  }

}