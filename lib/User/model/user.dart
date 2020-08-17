import 'package:flutter/material.dart';
import 'package:milanesapp/Milanesa/model/milanesa.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final String photoUrl;
  final List<Milanesa> myMilanesas;
  final List<Milanesa> myFavoriteMilanesas;

  User({
    Key key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoUrl,
    this.myMilanesas,
    this.myFavoriteMilanesas
});
}