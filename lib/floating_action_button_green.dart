import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _FloatingActionButtonGreen();
  }
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {

  void onPressedFav() {
    Scaffold.of(context).showSnackBar(
        SnackBar(content: Text("Agregado a favoritos"))
    );
  }

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: onPressedFav,
      child: Icon(
        Icons.favorite_border
      ),
    );
  }
}