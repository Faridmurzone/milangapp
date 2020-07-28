import 'package:flutter/material.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(15.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage("assets/img/milas.jpeg"),
          CardImage("assets/img/milas2.jpeg"),
          CardImage("assets/img/milas.jpeg"),
          CardImage("assets/img/milas2.jpeg")
        ]
      )
    );
  }
}