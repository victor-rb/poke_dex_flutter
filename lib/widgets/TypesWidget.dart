import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> typeList({List<String> types}) {
  List<Widget> list = [];
  for (var type in types) {
    list.add(Image.asset('assets/types/$type.png'));
  }
  return list;
}
