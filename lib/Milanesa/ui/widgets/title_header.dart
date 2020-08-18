import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String title;

  TitleHeader({Key, key, @required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double screenWidth = MediaQuery.of(context).size.width;
    // width: screenWidth,
    return Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.bold
        )
    );
    throw UnimplementedError();
  }
}