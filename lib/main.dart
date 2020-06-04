import 'package:flutter/material.dart';
import 'screen/todoscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TO-DO",
      home: TodoScreen(),
    );
  }
}