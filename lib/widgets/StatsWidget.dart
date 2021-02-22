import 'package:flutter/material.dart';
import 'package:poke_dex/models/StatsModel.dart';

List<Widget> statsList(List<Stats> stats) {
  List<Widget> list = [];

  for (var stat in stats) {
    list.add(
      Row(
        children: [
          Text(
            stat.statusName + ": ",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            stat.value.toString(),
            style: TextStyle(fontSize: 18, color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
  return list;
}
