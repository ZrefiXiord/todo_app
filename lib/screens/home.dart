import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/todo.dart';

import '../widgets/textfield.dart';
import '../widgets/todo_component.dart';

class Home extends StatefulWidget {
  Home({super.key});
  List<Todo> todos = [Todo("hello")];
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = TextEditingController();

  _onDelete(Todo todo) {
    setState(() {
      widget.todos.remove(todo);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF9),
      appBar: AppBar(
        title: const Text("Todo app"),
        backgroundColor: const Color(0xFFEEEFF9),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                for (Todo todo in widget.todos)
                  TodoComponent(todo: todo, onDelete: _onDelete)
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Textfield(controller: _controller),
                )),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        var todo = Todo(_controller.text);
                        widget.todos.add(todo);
                        save(todo);
                        _controller.clear();
                      });
                    },
                    child: const Icon(Icons.add),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void save(Todo todo) async {
    final prefs = await SharedPreferences.getInstance();
    final todos=getTodosString();
    todos.then((value) => {
      value?.add(todo.toString()),
      prefs.setStringList("todos",value!),
      print(value)
    });
  }

  Future<List<String>?> getTodosString()  async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("todos");
  }
  List<Todo>? getTodos() {
    List<Todo>? todos=[];
    getTodosString().then((value) => {
       value?.forEach((todo) {
         var splitted=todo.split(',');
         todos.add(Todo.fromIsDone(splitted[0], splitted[1] as bool));
       })
    });
    return todos;
  }
}
