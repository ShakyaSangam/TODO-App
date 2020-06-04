import 'package:flutter/material.dart';
import '../db/dbmanager.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TextEditingController title = TextEditingController();
  var formkey = GlobalKey<FormState>();
  ToDo todo;
  DbManager dbManager = DbManager();

  _submitform(BuildContext context) {
    if (formkey.currentState.validate()) {
      if (todo == null) {
        ToDo td = ToDo(title: title.text);
        dbManager.insertRecord(td).then((id) {
          title.clear();
          print(" ID: $id");
        });
      }
    }
  }

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
                Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: title,
                        decoration: InputDecoration(labelText: "Add List"),
                        validator: (value) {
                          if (value.length > 25) {
                            return "The text is large in size";
                          }
                          if (value.isEmpty) {
                            return "The text field is  empty";
                          }
                          return null;
                        },
                      ),
                      MaterialButton(
                        onPressed: () {
                          _submitform(context);
                        },
                        color: Colors.lightBlue,
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
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
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54),
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
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
