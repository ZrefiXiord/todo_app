import 'package:flutter/material.dart';
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
      backgroundColor: Color(0xFFEEEFF9),
      appBar: AppBar(
        title: const Text("Todo app"),
        backgroundColor: Color(0xFFEEEFF9),
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
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(
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
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        widget.todos.add(Todo(_controller.text));
                        _controller.clear();
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
