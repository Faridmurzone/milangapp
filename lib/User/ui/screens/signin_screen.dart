import 'package:flutter/material.dart';
import 'package:milanesapp/widgets/gradient_back.dart';
import 'package:milanesapp/widgets/button_green.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return signInGoogleUI();
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bienvenido \nal lugar de los milanesios",
                style: TextStyle(
                  fontSize: 37.0,
                  fontFamily: "Mulish",
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                )
              ),
              ButtonGreen(
                  text: "Login with Gmail",
                  onPressed: () {

                  },
                  width: 300.0,
                  height: 50.0,
              )
            ],
          )
        ]
      )
    );
  }

}
