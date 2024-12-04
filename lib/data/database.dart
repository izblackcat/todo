import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];

  var todosBox = Hive.box("todosBox");

  void createInitialTodos() {
    todoList = [
      ["my first todo...!", false]
    ];
  }

  void loadTodos() {
    todoList = todosBox.get("todoList");
  }

  void updateTodos() {
    todosBox.put("todoList", todoList);
  }
}
