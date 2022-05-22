import 'package:ca_place_holder/core/domain/network_status.dart';
import 'package:ca_place_holder/feature_todo/data/datasource/placeholder_api.dart';
import 'package:ca_place_holder/feature_todo/data/datasource/shared_prefs.dart';
import 'package:ca_place_holder/feature_todo/data/models/exceptions.dart';
import 'package:ca_place_holder/feature_todo/data/models/todo_model.dart';
import 'package:ca_place_holder/feature_todo/domain/entities/failure.dart';
import 'package:ca_place_holder/feature_todo/domain/entities/todo.dart';
import 'package:ca_place_holder/feature_todo/domain/repository/todo_repository.dart';
import 'package:dartz/dartz.dart';

class TodoRepositoryImpl implements TodoRepository {
  final DataSourcePlaceholderApi dataSourcePlaceholderApi;
  final DataSourceSharedPrefs dataSourceSharedPrefs;
  final NetworkStatus networkStatus;

  TodoRepositoryImpl(
    this.dataSourcePlaceholderApi,
    this.dataSourceSharedPrefs,
    this.networkStatus,
  );

  @override
  Future<Either<Failure, Todo>> getTodoById(int id) async {
    final bool connected = await networkStatus.connected;
    if (connected) {
      try {
        final TodoModel todoModel =
            await dataSourcePlaceholderApi.getTodoById(id);
        await dataSourceSharedPrefs.saveTodo(todoModel);
        return right(todoModel);
      } on ServerException catch (e) {
        return left(ServerFailure(e.message));
      }
    } else {
      try {
        final TodoModel cachedTodo = await dataSourceSharedPrefs.getTodo();
        return right(cachedTodo);
      } on CacheException catch (e) {
        return left(CacheFailure(e.message));
      }
    }
  }
}
