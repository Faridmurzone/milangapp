import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  String profilePic;
  String name;
  String details;
  String comment;

  Review(this.profilePic, this.name, this.details, this.comment);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final userComment = Container(
      margin: EdgeInsets.only(
          left: 10.0
      ),
      child: Text(
          comment,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: "Mulish",
              fontSize: 13,
              fontWeight: FontWeight.w900
          )
      ),
    );

    final userInfo = Container(
        margin: EdgeInsets.only(
            left: 10.0
        ),
        child: Text(
          details,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: "Mulish",
              fontSize: 13,
              color: Color(0xFFa3a5a7)
          ),
        )
    );

    final userName = Container(
        margin: EdgeInsets.only(
            left: 10.0
        ),
        child: Text(
          name,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: "Mulish",
            fontSize: 14,
          ),
        )
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        userInfo,
        userComment
      ],
    );

    final photo = Container(
      margin: EdgeInsets.only(
          top: 20.0,
          left: 20.0
      ),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(profilePic)
          )
      ),
    );

    return Row(
      children: <Widget>[
        photo,
        userDetails
      ],
    );
  }
}
