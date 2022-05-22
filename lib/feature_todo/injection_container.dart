import 'package:ca_place_holder/feature_todo/data/datasource/placeholder_api.dart';
import 'package:ca_place_holder/feature_todo/data/datasource/shared_prefs.dart';
import 'package:ca_place_holder/feature_todo/data/repository/todo_repository_impl.dart';
import 'package:ca_place_holder/feature_todo/domain/repository/todo_repository.dart';
import 'package:ca_place_holder/feature_todo/domain/usecases/get_todo_by_id.dart';
import 'package:ca_place_holder/feature_todo/domain/usecases/validate_id.dart';
import 'package:ca_place_holder/feature_todo/presentation/state/todo_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

void initFeatureTodoDependencies(GetIt injection) {
  injection.registerFactory<TodoBloc>(
    () => TodoBloc(injection(), injection()),
  );

  injection.registerLazySingleton<UseCaseGetTodoById>(
    () => UseCaseGetTodoById(injection()),
  );

  injection.registerLazySingleton<UseCaseValidateId>(
    () => UseCaseValidateId(),
  );

  injection.registerLazySingleton<DataSourcePlaceholderApi>(
    () => DataSourcePlaceholderApiImpl(injection()),
  );

  injection.registerLazySingleton<DataSourceSharedPrefs>(
    () => DataSourceSharedPrefsImpl(injection()),
  );

  injection.registerLazySingleton<FlutterSecureStorage>(
    () => FlutterSecureStorage(),
  );

  injection.registerLazySingleton<http.Client>(
    () => http.Client(),
  );

  injection.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(
      injection(),
      injection(),
      injection(),
    ),
  );
}
