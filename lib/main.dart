import 'package:ca_place_holder/core/injection_container.dart';
import 'package:ca_place_holder/feature_todo/presentation/pages/todo_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencyTree();
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoPage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
