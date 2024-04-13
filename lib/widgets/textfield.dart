import 'package:flutter/material.dart';



class Textfield extends StatefulWidget {
  Textfield({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: 'Todo name',
        border: InputBorder.none,
      ),
    );
  }
}
