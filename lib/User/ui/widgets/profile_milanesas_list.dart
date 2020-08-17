import 'package:flutter/material.dart';
import 'profile_milanesa.dart';
import 'package:milanesapp/Milanesa/model/milanesa.dart';

class ProfileMilanesasList extends StatelessWidget {
  Milanesa milanga = new Milanesa(
      name: 'Milanesa de pollo',
      description: 'Milanesa simple de pollo',
      urlImage: 'Pollo',
      likes: 3
  );
  Milanesa milanga2 = new Milanesa(
      name: 'Milanesa de pollo',
      description: 'Milanesa simple de pollo',
      urlImage: 'Pollo',
      likes: 3
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          ProfileMilanesa('assets/img/milas.jpeg', milanga),
          ProfileMilanesa('assets/img/milas2.jpeg', milanga2),
        ],
      ),
    );
  }
}
