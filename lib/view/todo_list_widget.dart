import 'package:flutter/material.dart';
import 'package:solocoding2019_base/data/todo.dart';

class TodoListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new TodoListState();
}

class TodoListState extends State<TodoListWidget> {
  List<Todo> todoList;

  TodoListState();

  @override
  void initState() {
    todoList = new List();
    todoList.add(Todo("test", "test", false));
    super.initState();
  }

  void _addTodoInternal(Todo todo) {
    setState(() {
      todoList.add(todo);
    });
  }

  void _removeTodoInternal(Todo todo) {
    setState(() {
      todoList.remove(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Maker'), // app bar title
      ),
      body: ListView(
          children: todoList.map((todo) => TodoListTile(todo)).toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTodoInternal(Todo('test', 'test', false)),
        tooltip: 'Create new todo',
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoListTile extends StatelessWidget {
  final Todo todo;

  TodoListTile(this.todo);

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(todo.title));
  }
}
