import 'package:flutter/material.dart';
import 'package:solocoding2019_base/data/todo.dart';
import 'package:solocoding2019_base/view/todo_list_widget.dart';

void main() => runApp(Tododododododo());

class Tododododododo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // set material design app
    return MaterialApp(
      title: 'solocoding2019', // application name
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListWidget(),
    );
  }
}
