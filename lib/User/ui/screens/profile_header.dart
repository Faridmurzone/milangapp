import 'package:flutter/material.dart';
import 'package:milanesapp/User/ui/widgets/user_info.dart';
import 'package:milanesapp/User/ui/widgets/button_bar.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = Text(
      'Perfil',
      style: TextStyle(
          fontFamily: 'Mulish',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0),
    );

    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[title],
          ),
          UserInfo('assets/img/profilepic.jpeg', 'Farid Murzone', 'faridmurzone@gmail.com'),
          ButtonsBar()
        ],
      ),
    );
  }
}
