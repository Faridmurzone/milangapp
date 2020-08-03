import 'package:flutter/material.dart';
import 'profile_milanesa.dart';
import 'package:milanesapp/Milanesa/model/milanesa.dart';

class ProfileMilanesasList extends StatelessWidget {
  Milanesa milanga = new Milanesa(
      'Milanesa napolitana',
      'Milanesa de ternera elaborada con queso y tomate',
      'Muy buena',
      'Ternera, Muzzarella, Salsa de tomate');
  Milanesa milanga2 = new Milanesa(
      'Milanesa de pollo',
      'Milanesa simple de pollo',
      'Pollo',
      'Mucha papa frita, Ternera, Queso');

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
