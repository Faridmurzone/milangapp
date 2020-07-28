import 'package:flutter/material.dart';
import 'package:milangapp/profile_milas.dart';
import 'package:milangapp/search_milas.dart';
import 'home_milas.dart';


class MilangappMilas extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MilangappMilas();
    throw UnimplementedError();
  }
}

class _MilangappMilas extends State<MilangappMilas> {

  int indexTap = 0;

  final List<Widget> widgetsChildren = [
      HomeMilas(),
      SearchMilas(),
      ProfileMilas()
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.purple
        ),
        child: BottomNavigationBar(
            onTap: onTapTapped,
            currentIndex: indexTap,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  title: Text("")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text("")
              )
            ])
      )
    );
  }

}