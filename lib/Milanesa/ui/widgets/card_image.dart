import 'package:flutter/material.dart';
import 'package:milanesapp/widgets/floating_action_button_green.dart';

class CardImage extends StatelessWidget {

  final String pathImage;
  final double height;
  final double width;
  double left;
  final VoidCallback onPressedFabIcon;
  final IconData iconData;

  CardImage({
    Key key,
    @required this.pathImage,
    @required this.height,
    @required this.width,
    @required this.onPressedFabIcon,
    @required this.iconData,
    this.left
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(left: left),
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage)),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );

    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(iconData: iconData, onPressed: onPressedFabIcon)
      ],
    );
  }
}
