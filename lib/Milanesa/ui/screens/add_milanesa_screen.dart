import 'dart:io';

import 'package:flutter/material.dart';
import 'package:milanesapp/Milanesa/ui/widgets/title_header.dart';
import 'package:milanesapp/widgets/gradient_back.dart';

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
          )
        ]
      ),
    );
  }
}