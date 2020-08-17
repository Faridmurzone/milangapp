import 'package:flutter/material.dart';
import 'package:milanesapp/User/model/user.dart';
import 'package:milanesapp/User/repository/firebase_auth.dart';
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
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    screenWidth = MediaQuery.of(context).size.width;
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
          GradientBack(height: null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                    width: screenWidth,
                    child: Text(
                    "Bienvenido a MILANESAPP\nCarga tus milas\nAHORA!",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: "Mulish",
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    )
                  )
                )
              ),
              ButtonGreen(
                  text: "Login con Gmail",
                  onPressed: () {
                    userBloc.signIn().then((FirebaseUser user) {
                        userBloc.updateUserData(
                            User(
                                uid: user.uid,
                                name: user.displayName,
                                email: user.email,
                                photoUrl: user.photoUrl)
                        );
                    });
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
