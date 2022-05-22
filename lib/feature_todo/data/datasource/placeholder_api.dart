import 'dart:convert';

import 'package:ca_place_holder/feature_todo/data/models/exceptions.dart';
import 'package:ca_place_holder/feature_todo/data/models/todo_model.dart';
import 'package:http/http.dart' as http;

abstract class DataSourcePlaceholderApi {
  Future<TodoModel> getTodoById(int id);
}

class DataSourcePlaceholderApiImpl implements DataSourcePlaceholderApi {
  final http.Client httpClient;

  final String _baseUrl = "https://jsonplaceholder.typicode.com/todos";

  DataSourcePlaceholderApiImpl(this.httpClient);

  @override
  Future<TodoModel> getTodoById(int id) async {
    final Uri uri = Uri.parse("$_baseUrl/$id");
    final http.Response response = await httpClient.get(uri);
    final int status = response.statusCode;
    if (status == 200) {
      return TodoModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw ServerException("Server exception");
    }
  }
}
