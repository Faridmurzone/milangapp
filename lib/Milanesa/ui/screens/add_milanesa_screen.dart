import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:milanesapp/Milanesa/model/milanesa.dart';
import 'package:milanesapp/Milanesa/ui/widgets/card_image.dart';
import 'package:milanesapp/Milanesa/ui/widgets/title_header.dart';
import 'package:milanesapp/Milanesa/ui/widgets/type_input_location.dart';
import 'package:milanesapp/User/bloc/bloc_user.dart';
import 'package:milanesapp/old/button_purple.dart';
import 'package:milanesapp/widgets/gradient_back.dart';
import 'package:milanesapp/widgets/text_input.dart';

class AddMilanesaScreen extends StatefulWidget {
  File image;
  AddMilanesaScreen({Key key, this.image});
  @override
  State createState() {
    return _AddMilanesaScreen();
  }
}

class _AddMilanesaScreen extends State<AddMilanesaScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final _controllerTitleMilanesa = TextEditingController();
    final _controllerDescriptionMilanesa = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          GradientBack(height: 300.0),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 25.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                  )
                )
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
                  child: TitleHeader(title: "Agregar una milanesa")
                )
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              children: <Widget> [
                Container(
                  alignment: Alignment.center,
                  child: CardImage(
                    pathImage: widget.image.path, //"assets/img/beach_palm.jpeg", // widget.image.path,
                    iconData: Icons.camera_alt,
                    width: 350.0,
                    height: 250.0,
                    left: 0
                  )
                ), // foto
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextInput(
                    hintText: "Titulo de la milanesa",
                    inputType: null,
                    maxLines: 1,
                    controller: _controllerTitleMilanesa,
                  ),
                ),
                TextInput(
                  hintText: "Describe la milanesa (tipo, empanizado, condimentos, guarnicion, etc)",
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller: _controllerDescriptionMilanesa
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    hintText: "De donde es la milanga?",
                    iconData: Icons.location_on
                  )
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                      buttonText: "Agregar Mila",
                      onPressed: () {
                        // Firebase Storage
                        // URL
                        userBloc.currentUser.then((FirebaseUser user) {
                          if(user != null) {
                            String uid = user.uid;
                            String path = "${uid}/${DateTime.now().toString()}.jpg";
                            userBloc.uploadFile(path, widget.image)
                              .then((StorageUploadTask upload) {
                                upload.onComplete.then((StorageTaskSnapshot snapshot){
                                  snapshot.ref.getDownloadURL().then((urlImage){
                                    print("URL IMAGEN: ${urlImage}");
                                    userBloc.updateMilanesaData(
                                        Milanesa(
                                          name: _controllerTitleMilanesa.text,
                                          description:  _controllerDescriptionMilanesa.text,
                                          urlImage: urlImage,
                                          likes: 0))
                                          .whenComplete(() {
                                            print("TERMINO");
                                            Navigator.pop(context);
                                          });
                                  });
                                });
                            });
                          }
                        });
                      }
                  )
                )
              ]
            )
          )
        ]
      ),
    );
  }
}