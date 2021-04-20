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

  @override
  List<Object> get props => [todo, status, isadded];
}
