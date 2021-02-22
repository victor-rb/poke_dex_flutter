import 'package:flutter/material.dart';
import 'package:poke_dex/models/StatsModel.dart';

import 'AbilityModel.dart';

class Pokemon {
  String name = "MissingNo";
  String sprites =
      "https://vignette.wikia.nocookie.net/pokemonet/images/1/19/Missingno..png/revision/latest/scale-to-width-down/340?cb=20130505210537&path-prefix=pt-br";
  List<Stats> stats = [];
  List<String> type = [];
  int weight = 00;
  String description = "";
  MaterialColor color = Colors.red;
  List<Ability> ability = [];
}
