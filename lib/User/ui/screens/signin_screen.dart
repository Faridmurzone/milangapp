import 'package:flutter/material.dart';
import 'package:milanesapp/widgets/gradient_back.dart';
import 'package:milanesapp/widgets/button_green.dart';
import 'package:milanesapp/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:milanesapp/milanesapp_cupertino.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // snapshot contiene nuestra data / objeto user
          if(!snapshot.hasData || snapshot.hasError) {
              return signInGoogleUI();
          } else {
              return MilanesappCupertino();
          }
        }
    );
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
                  text: "Login con Gmail",
                  onPressed: () {
                    userBloc.signIn().then((FirebaseAuth user) => print("El user es ${user}"));
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
