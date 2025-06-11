import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test1/features/domain/model/todo_entity.dart';
import 'package:todo_test1/features/presentation/bloc/todo_bloc.dart';

class TodoTile extends StatelessWidget {
  final TodoEntity todo;

  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        final updatedTodo = todo.copyWith(isDone: !todo.isDone);
        context.read<TodoBloc>().add(UpdateTodo(updatedTodo));
      },
      title: Text(
        todo.text,
        style: TextStyle(
          decoration: todo.isDone ? TextDecoration.lineThrough : null,
          color: Colors.white,
        ),
      ),

      leading: Icon(
        todo.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
        color: todo.isDone ? Colors.green : Colors.grey,
      ),
    );
  }
}
