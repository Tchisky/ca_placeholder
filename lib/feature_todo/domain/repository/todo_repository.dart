import 'package:ca_place_holder/feature_todo/domain/entities/failure.dart';
import 'package:ca_place_holder/feature_todo/domain/entities/todo.dart';
import 'package:dartz/dartz.dart';

abstract class TodoRepository {
  Future<Either<Failure, Todo>> getTodoById(int id);
}
