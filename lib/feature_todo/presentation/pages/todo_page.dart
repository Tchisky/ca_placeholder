import 'package:ca_place_holder/feature_todo/presentation/state/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late final TodoBloc _bloc = GetIt.instance<TodoBloc>();

  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<TodoBloc, TodoState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is TodoStateLoading) {
                return Center(
                  child: Text("Loading.."),
                );
              } else if (state is TodoStateFailed) {
                return Center(
                  child: Text("Failure, ${state.failure}"),
                );
              } else if (state is TodoStateLoaded) {
                return Center(
                  child: Text("Todo, ${state.todo.toJson().toString()}"),
                );
              } else {
                return Center(
                  child: Text("Search for todo"),
                );
              }
            },
          ),
          TextFormField(
            controller: _controller,
            decoration: InputDecoration(hintText: "Search by todo id"),
          ),
          ElevatedButton(
            onPressed: () {
              _bloc.add(TodoEventGetTodo(_controller.text));
              _controller.clear();
            },
            child: Text("Search"),
          ),
        ],
      ),
    );
  }
}
