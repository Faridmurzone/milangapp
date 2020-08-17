import 'package:flutter/material.dart';
import 'package:milanesapp/Milanesa/model/milanesa.dart';
import 'package:milanesapp/widgets/floating_action_button_green.dart';

class ProfileMilanesaInfo extends StatelessWidget {
  Milanesa milanga;

  ProfileMilanesaInfo(this.milanga);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final milanga = Text(
      this.milanga.name,
      style: TextStyle(
          fontFamily: 'Mulish', fontSize: 20.0, fontWeight: FontWeight.bold),
    );

    final milangaInfo = Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.milanga.name,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    fontFamily: 'Mulish',
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                this.milanga.description,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    fontFamily: 'Lato',
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold),
              )
            ]));

    final steps = Text(
      'Ingredientes: ${this.milanga.likes}',
      style: TextStyle(
          fontFamily: 'Mulish',
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.amber),
    );

    final card = Container(
      width: screenWidth * 0.65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0))
          ]),
      child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[milanga, milangaInfo, steps],
          )),
    );

    return Stack(
      alignment: Alignment(0.8, 1.25),
      children: <Widget>[card, FloatingActionButtonGreen()],
    );
  }
}
