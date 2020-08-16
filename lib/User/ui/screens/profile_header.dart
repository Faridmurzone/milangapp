import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:milanesapp/User/model/user.dart';
import 'package:milanesapp/User/ui/widgets/button_bar.dart';
import 'package:milanesapp/User/bloc/bloc_user.dart';
import 'package:milanesapp/User/ui/widgets/user_info.dart';

class ProfileHeader extends StatelessWidget {
  UserBloc userBloc;
  User user;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return StreamBuilder(
      stream: userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snap) {
    if(!snap.hasData || snap.hasError) {
      print("No logueado");
      return Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
          child: Column(
              children: <Widget>[
              CircularProgressIndicator(),
              Text("No estas logueado. No se puede acceder a esta informacion")
            ]));
    } else {
    print("Logueado");
    print(snap.data);

    user = User(
      name: snap.data.displayName,
      email: snap.data.email,
      photoUrl: snap.data.photoUrl
    );
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
          UserInfo(user),
          ButtonsBar()
          ],
      ),
    );
    }
  }
}
