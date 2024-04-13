import 'package:flutter/material.dart';

import '../model/todo.dart';

class TodoComponent extends StatefulWidget {
  final Todo todo;
  const TodoComponent({super.key, required this.todo, required this.onDelete});
  final onDelete;
  @override
  State<TodoComponent> createState() => _TodoComponentState();
}

class _TodoComponentState extends State<TodoComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0, right: 20.0, left: 20.0, top: 10.0),
      child: ListTile(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.5)),
        contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
        tileColor: Colors.white,
        leading: Checkbox(
          value: widget.todo.isDone,
          onChanged: (bool? value) {
            setState(() {
              widget.todo.isDone = !widget.todo.isDone;
            });
          },
        ),
        title: Text(
          widget.todo.name,
          style: TextStyle(
              decoration:
                  widget.todo.isDone ? TextDecoration.lineThrough : null,
              color: widget.todo.isDone ? Colors.black12 : Colors.black54),
        ),
        trailing: Container(
          margin: EdgeInsets.symmetric(vertical: 6),
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8)
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 24,
            onPressed: () {
              widget.onDelete(widget.todo);
            },
            icon: Icon(Icons.delete_forever),
          ),
        ),
      ),
    );
  }
}
