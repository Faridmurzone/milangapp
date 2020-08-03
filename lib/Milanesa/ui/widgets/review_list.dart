import 'package:flutter/material.dart';
import 'review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review("assets/img/people.jpg", "Un hippie cualquiera", "1 review · 5 photos",
            "There is an amazing milanga in Buenos Aires"),
        Review("assets/img/avatar.jpg", "Farid Murzone", "2 review · 5 photos",
            "There is an amazing milanga in Sri Lanka"),
        Review("assets/img/girl.jpg", "Gissele", "2 review · 2 photos",
            "There is an amazing milanga in UMA"),
      ],
    );
  }
}
