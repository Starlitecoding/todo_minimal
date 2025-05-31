import 'package:flutter/material.dart';
import 'package:todo_test1/features/domain/model/todo_entity.dart';

class TodoTile extends StatelessWidget {
  final TodoEntity todo;

  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.text),
      leading: Icon(
        todo.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
        color: todo.isDone ? Colors.green : Colors.grey,
      ),
    );
  }
}
