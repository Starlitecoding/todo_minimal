import 'package:flutter/material.dart';
import 'package:todo_test1/features/domain/model/todo_entity.dart';
import 'package:todo_test1/features/presentation/widgets/todo_tile.dart';

class TodoList extends StatelessWidget {
  final List<TodoEntity> todos;

  const TodoList({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: todos.length,
      padding: EdgeInsets.all(4),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return TodoTile(todo: todos[index]);
      },
    );
  }
}
