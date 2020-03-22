import 'dart:ui';

import 'models/sport_model.dart';

class HomeRepository {
  List<SportModel> getSports() {
    return [
      SportModel()
        ..name = "Diving"
        ..imageUrl = "https://imgur.com/4AY5G2z.png"
        ..value = "\$230/person"
        ..colors = [
          Color(0xFF01F2DF),
          Color(0xFF09C5C6),
          Color(0xFF01F2DF),
        ],
      SportModel()
        ..name = "Hiking"
        ..imageUrl = "https://i.imgur.com/9DseTKd.png"
        ..value = "\$360/person"
        ..colors = [
          Color(0xFFFDD7D6),
          Color(0xFFF0A0A3),
          Color(0xFFFDD7D6),
        ],
    ];
  }
}
