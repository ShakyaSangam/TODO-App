import 'package:flutter/material.dart';
import 'package:todo/logic/models/todo_model.dart';
import 'package:todo/logic/repository/repository.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  Repository _repository = Repository();
  TextEditingController title = TextEditingController();
  var formkey = GlobalKey<FormState>();
  List<ToDo> todolist = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      height: MediaQuery.of(context).size.height - 202,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: FutureBuilder(
          future: _repository.display(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              todolist = snapshot.data;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: todolist.length,
                itemBuilder: (BuildContext context, int index) {
                  ToDo td = todolist[index];
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.work,
                                  color: Colors.lightBlue,
                                ),
                                Wrap(
                                  children: <Widget>[
                                    Text("${td.title.toString()}"),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    _repository.deleterecord(td.id);
                                    setState(() {
                                      todolist.removeAt(index);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            return LinearProgressIndicator();
          },
        ),
      ),
    );
  }
}