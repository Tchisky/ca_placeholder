import 'package:bloc/bloc.dart';
import 'package:ca_place_holder/feature_todo/domain/entities/failure.dart';
import 'package:ca_place_holder/feature_todo/domain/entities/todo.dart';
import 'package:ca_place_holder/feature_todo/domain/usecases/get_todo_by_id.dart';
import 'package:ca_place_holder/feature_todo/domain/usecases/validate_id.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEventGetTodo, TodoState> {
  final UseCaseGetTodoById getTodoById;
  final UseCaseValidateId validateId;

  TodoBloc(
    this.getTodoById,
    this.validateId,
  ) : super(TodoStateInitial()) {
    on<TodoEventGetTodo>((event, emit) async {
      emit(TodoStateLoading());
      debugPrint("emit loading");
      final Either<Failure, int> validId = validateId(event.idString);
      debugPrint("validated id");
      await validId.fold(
        (failure) {
          if (failure is FormatFailure) {
            emit(TodoStateFailed(failure));
            debugPrint("emit FormatFailure");
          }
        },
        (id) async {
          final Either<Failure, Todo> todoResult = await getTodoById(id);
          await todoResult.fold(
            (failure) {
              if (failure is ServerFailure) {
                emit(TodoStateFailed(failure));
                debugPrint("emit ServerFailure");
              }
              if (failure is CacheFailure) {
                emit(TodoStateFailed(failure));
                debugPrint("emit CacheFailure");
              }
            },
            (todo) async {
              emit(TodoStateLoaded(todo));
              debugPrint("emit Laoded");
            },
          );
        },
      );
    });
  }
}
