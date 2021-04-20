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
      emit(
        TodoData(todo: _data, status: true),
      );
    }
    if (state.todo.length < 1) {
      emit(
        TodoData(todo: _data, status: true),
      );
    } else {
      emit(
        TodoData(
          todo: List.from(state.todo)..addAll(_data),
          status: true,
        ),
      );
    }
  }

  void fetchData() async {
    List<ToDo> list = await _repository.display();
    if (list.length > 0) {
      emit(
        TodoData(todo: list, status: true),
      );
    } else {
      emit(
        TodoData(todo: [], status: false),
      );
    }
  }
}
