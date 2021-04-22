import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/logic/models/todo_model.dart';
import 'package:todo/logic/repository/repository.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoData> {
  TodoCubit() : super(TodoData(status: false, todo: [])) {
    fetchData();
  }

  Repository _repository = Repository();

  void insertTodo({String title}) async {
    int intdata = await _repository.insertRecord(
      ToDo(
        title: title,
      ),
    );
    List<ToDo> _data = [
      ToDo(
        title: title,
        id: intdata,
      ),
    ];
    if (state.todo == null) {
      emit(state.copyWith(
        _data,
        true,
      ));
    }
    if (state.todo.length < 1) {
      emit(state.copyWith(
        _data,
        true,
      ));
    } else {
      emit(state.copyWith(
        List.from(state.todo)..addAll(_data),
        true,
      ));
    }
  }

  void fetchData() async {
    List<ToDo> list = await _repository.display();
    if (list.length > 0) {
      emit(state.copyWith(
        list,
        true,
      ));
    } else {
      emit(state.copyWith(
        [],
        true,
      ));
    }
  }

  // void deleteTask({ToDo toDo}) async {
  //   TodoData todoData = state;
  //   print("state before deleting: ${todoData.todo.length}");
  //   todoData.todo.removeWhere((item) => item.id == toDo.id);
  //   print("state after deleting: ${todoData.todo.length}");

  //   //  release offline delete feature
  //   // * await _repository.deleterecord(todo.id);
  //   emit(todoData);
  // }

  void deleteTask({ToDo toDo}) async {
    print("state before deleting: ${state.todo.length}");
    List<ToDo> todo = state.todo;

    todo.removeWhere((item) => item.id == toDo.id);
    print("state after deleting: ${state.todo.length}");

    // * await _repository.deleterecord(todo.id);
    emit(TodoData().copyWith(todo, true));
  }
}
