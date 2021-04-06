
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

Widget shadowTextField(TextEditingController _controller, String labelText){
  return  Container(
    height: 50,
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
    child: TextField(
      controller: _controller,
      autofocus: false,
    cursorColor: colorBlue,
    //  keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.go,
      decoration: new InputDecoration(
           border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(color: Colors.white)

        ),
        contentPadding: EdgeInsets.only( left: 32.0, right: 10.0),
        labelText: labelText,
        labelStyle: TextStyle(
          color: colorLightGray,
          fontSize: 15,
        ),
      ),
    ),
  );
}

Widget shadowTextView( String labelText, Function onClick){
  return  Container(
    height: 50,
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(left: 32),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 5), // changes position of shadow
        ),
      ],
    ),
    child:new GestureDetector(
      onTap: () {
        onClick();
      },
      child: Text(
        labelText,
        style: TextStyle(color: colorGray),

    ),
    ),
  );
}

Widget button(String text,double width, Color color, Color textColor, Color shadowColor, Function onClick){
  return  Container(
    height: 50,
    width: width,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
      boxShadow: [
        BoxShadow(
          color: shadowColor,
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 5), // changes position of shadow
        ),
      ],
    ),
    child:ClipRRect(
      borderRadius: BorderRadius.circular(25.0),

      child: RaisedButton(
          color: color,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 15.0,
                color: textColor,
                fontWeight: FontWeight.normal
            ),
          ),
          onPressed:(){
            onClick();
            // setState(() {
            //
            // });
          }
      ),
    ),
  );
}