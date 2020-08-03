import 'package:flutter/material.dart';
import 'button_purple.dart';

class DescriptionMilanesa extends StatelessWidget {

  String titleMilanesa;
  int stars;
  String  descriptionMilanesa;

  DescriptionMilanesa(this.titleMilanesa, this.stars, this.descriptionMilanesa);

  @override
  Widget build(BuildContext context) {
    // implement build
    final star = Container(
      margin: EdgeInsets.only(
        top: 323.0,
        right: 3.0
      ),
      child: Icon(
          Icons.star,
          color: Color(0xFFF2C611)
      ),
    );

    final star_half = Container(
      margin: EdgeInsets.only(
          top: 323.0,
          right: 3.0
      ),
      child: Icon(
          Icons.star_half,
          color: Color(0xFFF2C611)
      ),
    );

    final star_border = Container(
      margin: EdgeInsets.only(
          top: 323.0,
          right: 3.0
      ),
      child: Icon(
          Icons.star_border,
          color: Color(0xFFF2C611)
      ),
    );

    final description = Container(
      margin: new EdgeInsets.only(
        top: 10.0,
        left: 20.0,
        right: 20.0
      ),
      child: new Text(
        descriptionMilanesa,
        style: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF56575A)
        )
      )
    );

    final title_stars = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Text(
            titleMilanesa,
            style: TextStyle(
                fontFamily: "Mulish",
                fontSize: 20.0,
                fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.left,
          )
        ),
        Row(
          children: <Widget> [
            star,
            star,
            star,
            star,
            star_border
          ],
        ),

      ],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title_stars,
        description,
        ButtonPurple("Detalles")
      ],
    );
  }
}