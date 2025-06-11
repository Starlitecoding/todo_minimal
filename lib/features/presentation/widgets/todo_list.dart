import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test1/features/domain/model/todo_entity.dart';
import 'package:todo_test1/features/presentation/bloc/todo_bloc.dart';
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
        final todo = todos[index];

        return Dismissible(
          key: Key(todo.id),
          direction: DismissDirection.endToStart,

          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.white,
            child: const Icon(Icons.delete, color: Colors.red),
          ),
          onDismissed: (_) {
            context.read<TodoBloc>().add(DeleteTodo(todo.id));
          },
          
          child: TodoTile(todo: todo),
        );
      },
    );
  }
}
