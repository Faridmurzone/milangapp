import 'package:flutter/cupertino.dart';
import 'package:milanesapp/User/model/user.dart';

class Milanesa {
  String id;
  String name;
  String description;
  String urlImage;
  int likes;
  User userOwner;
  // Object ingredientes;

  Milanesa({
    Key key,
    @required this.name,
    @required this.description,
    @required this.urlImage,
    this.likes,
    @required userOwner
  });
}
