import 'package:flutter/material.dart';
import 'review_list.dart';

import 'description_milanesa.dart';
import 'header_appbar.dart';

class HomeMilas extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
        children: <Widget>[
          ListView(
            children: [
              DescriptionMilanesa("Milanesa Napolitana", 4, "Alta milanesa de la farola. Realmente sublime, con una salsa de tomate digna de entrar al panteon de las milanesas. El queso fantastico, no escatimaron en nada, aplausos."),
              ReviewList()
            ],
          ),
          HeaderAppBar(),
        ]
    );
}
}
