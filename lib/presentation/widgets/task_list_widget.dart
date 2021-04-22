import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/todo_cubit.dart';
import 'package:todo/logic/models/todo_model.dart';

class TaskList extends StatelessWidget {
  var formkey = GlobalKey<FormState>();

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
        child: BlocConsumer<TodoCubit, TodoData>(
          listener: (ctx, state) {},
          // buildWhen: (TodoData previousState, TodoData currentState) {
          //   if (previousState.todo.length != currentState.todo.length) {
          //     print(previousState.todo.length);
          //     print(currentState.todo.length);
          //     return true;
          //   }
          //   print(previousState.todo.length);
          //   print(currentState.todo.length);
          //   return false;
          // },
          builder: (BuildContext ctx, TodoData state) {
            if (state.status) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.todo.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildTaskCard(state.todo[index], state, ctx);
                },
              );
            } else {
              return Center(
                child: Text("Empty Task"),
              );
            }
          },
        ),
      ),
    );
  }

  Column buildTaskCard(ToDo td, TodoData state, BuildContext context) {
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
                      // context.watch<TodoCubit>().deleteTask(todo: td);
                      BlocProvider.of<TodoCubit>(context).deleteTask(toDo: td);
                      // _repository.deleterecord(td.id);
                      // setState(() {
                      //   todolist.removeAt(index);
                      // });
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
  }
}
