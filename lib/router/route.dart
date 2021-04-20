import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/todo_cubit.dart';
import 'package:todo/presentation/pages/screen/detailscreen.dart';
import 'package:todo/presentation/pages/screen/todoscreen.dart';

class AccessRouter {
  TodoCubit _todoCubit = TodoCubit();
  Route<MaterialPageRoute> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (newctx) => BlocProvider<TodoCubit>(
                  create: (context) => _todoCubit,
                  child: TodoScreen(),
                ));

        break;

      case '/addTask':
        return MaterialPageRoute(
          builder: (newctx) => BlocProvider<TodoCubit>(
            create: (context) => _todoCubit,
            child: DetailScreen(),
          ),
          // settings: settings
        );
        break;

      default:
        return MaterialPageRoute(
          builder: (newctx) => TodoScreen(),
          // settings: settings
        );
        break;
    }
  }
}
