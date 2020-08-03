import 'package:flutter/material.dart';
import 'package:milanesapp/widgets/button_purple.dart';

class DescriptionPlace extends StatelessWidget {
  String nameMilanesa;
  int stars;
  String descriptionPlace;

  DescriptionPlace(this.nameMilanesa, this.stars, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final star_half = Container(
      margin: EdgeInsets.only(top: 353.0, right: 3.0),
      child: Icon(
        Icons.star_half,
        color: Color(0xFFf2C611),
      ),
    );

    final star_border = Container(
      margin: EdgeInsets.only(top: 353.0, right: 3.0),
      child: Icon(
        Icons.star_border,
        color: Color(0xFFf2C611),
      ),
    );

    final star = Container(
      margin: EdgeInsets.only(top: 353.0, right: 3.0),
      child: Icon(
        Icons.star,
        color: Color(0xFFf2C611),
      ),
    );

    final title_stars = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 350.0, left: 20.0, right: 20.0),
          child: Text(
            nameMilanesa,
            style: TextStyle(
                fontFamily: "Mulish",
                fontSize: 30.0,
                fontWeight: FontWeight.w900),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: <Widget>[star, star, star, star, star_half],
        )
      ],
    );

    final description = Container(
      margin: new EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: new Text(
        descriptionPlace,
        style: const TextStyle(
            fontFamily: "Mulish",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[title_stars, description, ButtonPurple("Detalles")],
    );
  }
}
