part of 'todo_bloc.dart';

class TodoEventGetTodo extends Equatable {
  final String idString;

  TodoEventGetTodo(this.idString);

  @override
  List<Object?> get props => [idString];
}
