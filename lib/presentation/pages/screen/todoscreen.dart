import 'package:flutter/material.dart';
import 'package:todo/presentation/widgets/task_btn_widget.dart';
import 'package:todo/presentation/widgets/task_list_widget.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                // * TASK BUTTON
                TaskBtnWidget(),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "TO-DO",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      SizedBox(width: 14),
                      Text(
                        "List",
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                // * TASK LIST
                TaskList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
