part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoStateInitial extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoStateLoading extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoStateLoaded extends TodoState {
  final Todo todo;

  TodoStateLoaded(this.todo);

  @override
  List<Object> get props => [todo];
}

class TodoStateFailed extends TodoState {
  final Failure failure;

  TodoStateFailed(this.failure);

  @override
  List<Object> get props => [failure];
}
