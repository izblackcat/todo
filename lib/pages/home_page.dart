// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import 'package:todo/utils/button.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/utils/dialog_box.dart';
import 'package:todo/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  final _todosBox = Hive.box("todosBox");

  final _controller = TextEditingController();

  TodoDatabase todoDB = TodoDatabase();

  @override
  void initState() {
    if (_todosBox.get("todoList") == null) {
      todoDB.createInitialTodos();
    } else {
      todoDB.loadTodos();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoDB.todoList[index][1] = value;
    });
    todoDB.updateTodos();
  }

  void saveTodo() {
    setState(() {
      todoDB.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    todoDB.updateTodos();
  }

  void addTodo() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _controller,
              onSave: saveTodo,
              onCancel: () => Navigator.of(context).pop());
        });
  }

  void deleteTodo(int index) {
    setState(() {
      todoDB.todoList.removeAt(index);
    });
    todoDB.updateTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fourthColor,
      appBar: AppBar(
        backgroundColor: secondColor,
        title: Text("Todos", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: todoDB.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            todoTitle: todoDB.todoList[index][0],
            todoStatus: todoDB.todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            onDeleted: () => deleteTodo(index),
          );
        },
      ),
      floatingActionButton: Button(
          color: secondColor,
          onPressedFunction: addTodo,
          icon: Icon(Icons.add_outlined)
      ),
    );
  }
}
