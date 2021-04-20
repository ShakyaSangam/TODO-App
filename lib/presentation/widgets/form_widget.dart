import 'package:flutter/material.dart';
import 'package:todo/logic/models/todo_model.dart';
import 'package:todo/logic/repository/repository.dart';

// ignore: must_be_immutable
class FormWidget extends StatelessWidget {
  final TextEditingController title = TextEditingController();
  var formkey = GlobalKey<FormState>();
  ToDo todo;
  final Repository _repository = Repository();

  _submitform(BuildContext context) {
    if (formkey.currentState.validate()) {
      if (todo == null) {
        ToDo td = ToDo(title: title.text);
        _repository.insertRecord(td).then((id) {
          title.clear();
          print(" ID: $id");
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
    );
  }
}
