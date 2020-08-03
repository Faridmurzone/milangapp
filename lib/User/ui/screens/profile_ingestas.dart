import 'package:flutter/material.dart';
import 'package:milanesapp/User/ui/screens/profile_header.dart';
import 'package:milanesapp/User/ui/widgets/profile_milanesas_list.dart';
import 'package:milanesapp/User/ui/widgets/profile_background.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*return Container(
      color: Colors.indigo,
    );*/
    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[ProfileHeader(), ProfileMilanesasList()],
        ),
      ],
    );
  }
}
