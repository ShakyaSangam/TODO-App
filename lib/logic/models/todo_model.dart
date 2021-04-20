import 'package:flutter/material.dart';

class ToDo {
  int id;
  String title;

  ToDo({this.id, @required this.title});

  Map<String, dynamic> toMap() {
    return {'title': this.title};
  }
}
