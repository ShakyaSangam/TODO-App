import 'package:flutter/material.dart';

class TaskBtnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Row(
        children: <Widget>[
          IconButton(
            highlightColor: Colors.lightBlueAccent,
            onPressed: () {
              Navigator.pushNamed(context, "/addTask");
            },
            tooltip: "Add",
            icon: Icon(
              Icons.list,
              size: 52,
            ),
            color: Colors.white,
            // size: 52,
          )
        ],
      ),
    );
  }
}
