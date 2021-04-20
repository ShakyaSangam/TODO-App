import 'package:flutter/material.dart';
import 'package:todo/router/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final AccessRouter _accessRouter = AccessRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TO-DO",
      // home: TodoScreen(),
      initialRoute: '/',
      onGenerateRoute: _accessRouter.generateRoute,
    );
  }
}
