import 'package:flutter/material.dart';

class AppRules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.yellowAccent,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Text(
                  "* ",
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  "Rules",
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "1. ",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                      Text(
                        "The List Must be less than 25 character.",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "2. ",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                      Text(
                        "The Empty List Will Not Be Stored.",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
