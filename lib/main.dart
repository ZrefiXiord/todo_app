import 'package:flutter/material.dart';
import 'screens/home.dart';

import 'model/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  List<Todo> todos=[];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home()
    );
  }
}