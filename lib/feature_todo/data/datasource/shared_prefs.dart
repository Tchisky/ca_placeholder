import 'dart:convert';

import 'package:ca_place_holder/feature_todo/data/models/exceptions.dart';
import 'package:ca_place_holder/feature_todo/data/models/todo_model.dart';
import 'package:ca_place_holder/feature_todo/domain/entities/todo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class DataSourceSharedPrefs {
  Future<void> saveTodo(Todo todo);

  Future<TodoModel> getTodo();
}

class DataSourceSharedPrefsImpl implements DataSourceSharedPrefs {
  final FlutterSecureStorage secureStorage;

  DataSourceSharedPrefsImpl(this.secureStorage);

  final String _key = "key_todo";

  @override
  Future<TodoModel> getTodo() async {
    final String? todoString = await secureStorage.read(key: _key);
    if (todoString == null) {
      throw CacheException("No cached todo found");
    } else {
      return TodoModel.fromJson(jsonEncode(todoString) as Map<String, dynamic>);
    }
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    final String todoString = todo.toJson().toString();
    await secureStorage.write(key: _key, value: todoString);
  }
}
