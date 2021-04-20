import 'package:flutter/material.dart';
import 'package:todo/presentation/widgets/form_widget.dart';
import 'package:todo/presentation/widgets/rules/app_rules.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: Text("ADD List"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.8),
            child: Column(
              children: <Widget>[
                FormWidget(),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          AppRules()
        ],
      ),
    );
  }
}
