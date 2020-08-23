import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:milanesapp/Milanesa/ui/screens/add_milanesa_screen.dart';
import 'package:milanesapp/User/bloc/bloc_user.dart';
import 'circle_button.dart';
import 'package:image_picker/image_picker.dart';

class ButtonsBar extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
            CircleButton(true, Icons.vpn_key, 20.0, Color.fromRGBO(255, 255, 255, 0.6), () => {}),
            // CircleButton(true, Icons.card_travel, 20.0, Color.fromRGBO(255, 255, 255, 0.6), () => {}),
            CircleButton(false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1),
                    () {
                      ImagePicker.pickImage(source: ImageSource.camera)
                      .then((File image) {
                          if(image != null) {
                            Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) => AddMilanesaScreen(image: image)));
                          }
                          })
                      .catchError((onError) => print("ERROR: ${onError}"));

                     }),
            // CircleButton(true, Icons.mail_outline, 20.0, Color.fromRGBO(255, 255, 255, 0.6), () => {}),
            CircleButton(true, Icons.exit_to_app, 20.0, Color.fromRGBO(255, 255, 255, 0.6),
                    () => {
                      userBloc.signOut()
                    })
          ],
        )
    );
  }

}