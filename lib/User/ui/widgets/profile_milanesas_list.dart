import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:milanesapp/User/bloc/bloc_user.dart';
import 'profile_milanesa.dart';
import 'package:milanesapp/Milanesa/model/milanesa.dart';

class ProfileMilanesasList extends StatelessWidget {
  UserBloc userBloc;

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
    userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: StreamBuilder(
        stream: userBloc.milanesasStream,
        builder: (context, AsyncSnapshot snapshot){
          switch(snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.done:
              return Column(
                children: userBloc.buildMilanesas(snapshot.data.documents)
              );
            case ConnectionState.active:
              return Column(
                  children: userBloc.buildMilanesas(snapshot.data.documents)
              );
            case ConnectionState.none:
              return CircularProgressIndicator();
          }
        }
      )
    );
  }
}

/*Column(
        children: <Widget>[
          ProfileMilanesa('assets/img/milas.jpeg', milanga),
          ProfileMilanesa('assets/img/milas2.jpeg', milanga2),
        ],
      ),*/