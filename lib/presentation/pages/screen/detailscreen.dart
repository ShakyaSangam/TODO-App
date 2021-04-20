import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/todo_cubit.dart';
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
        actions: [
          BlocBuilder<TodoCubit, TodoData>(
            builder: (context, state) {
              if (state.status) {
                return Text(state.todo.length.toString());
              } else {
                return Text("null");
              }
            },
          ),
        ],
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
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
