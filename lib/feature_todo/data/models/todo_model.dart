import 'package:ca_place_holder/feature_todo/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel(super.userId, super.id, super.title, super.completed);

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    final int userId = (json['userId'] as num).toInt();
    final int id = (json['id'] as num).toInt();
    final String title = json['title'].toString();
    final bool completed = json['completed'] as bool;
    return TodoModel(userId, id, title, completed);
  }
}
