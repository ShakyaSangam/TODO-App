part of 'todo_cubit.dart';

class TodoData extends Equatable {
  final List<ToDo> todo;
  final bool status;
  final bool isadded;

  TodoData({
    this.todo,
    this.status,
    this.isadded,
  });

  TodoData copyWith(
    List<ToDo> todo,
    bool status,
  ) {
    return TodoData(
      todo: todo ?? this.todo,
      status: status ?? this.status,
      // isadded: todo ?? this.isadded,
    );
  }

  @override
  List<Object> get props => [todo, status, isadded];
}
