import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/utils/DbHelper.dart';
import 'package:todo_app/views/add_todo.dart';
import 'package:todo_app/views/todoList.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var db = DbHelper();

  void add(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  void delete(int id) async {
    await db.deleteTodo(id);
    setState(() {});
  }

  void checked(int id, bool value) async {
    await db.isCheckedTodo(id, value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO App"),
      ),
      body: Column(
        children: [
          TodoList(
            deleteFunction: delete,
            isChacked: checked,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => addTodo(insertFunction: add),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
