import 'package:flutter/material.dart';
import 'package:todo/db/dbmanager.dart';
import 'package:todo/screen/detailscreen.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  DbManager dbManager = DbManager();
  TextEditingController title = TextEditingController();
  var formkey = GlobalKey<FormState>();
  List<ToDo> todolist = [];
  // int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(30),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        highlightColor: Colors.lightBlueAccent,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen()));
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
                ),
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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                  ),
                  height: MediaQuery.of(context).size.height - 202,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: FutureBuilder(
                      future: dbManager.display(),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                dbManager.deleterecord(td.id);
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
