import 'package:flutter/material.dart';
import 'review.dart';

class ReviewList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        new Review("assets/img/avatar.jpg", "Farid Murzone", "3 reviews 4 fotos", "Muy buena"),
        new Review("assets/img/profilepic.jpeg", "Farid Murzone", "1 review 4 fotos", "Alta milanesa"),
      ],
    );
  }
}