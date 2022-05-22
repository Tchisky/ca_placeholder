import 'package:ca_place_holder/core/domain/usecase.dart';
import 'package:ca_place_holder/feature_todo/domain/entities/failure.dart';
import 'package:ca_place_holder/feature_todo/domain/entities/todo.dart';
import 'package:ca_place_holder/feature_todo/domain/repository/todo_repository.dart';
import 'package:dartz/dartz.dart';

class UseCaseGetTodoById implements UseCaseFuture<Either<Failure, Todo>, int> {
  final TodoRepository repository;

  UseCaseGetTodoById(this.repository);

  @override
  Future<Either<Failure, Todo>> call(int param) {
    return repository.getTodoById(param);
  }
}
