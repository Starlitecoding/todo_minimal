import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test1/features/presentation/bloc/todo_bloc.dart';
import 'package:todo_test1/features/presentation/widgets/empty_state.dart';
import 'package:todo_test1/features/presentation/widgets/todo_list.dart';
import '../widgets/todo_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const CircularProgressIndicator();
          } else if (state is TodoLoaded) {
            if (state.todos.isEmpty) {
              return const EmptyState();
            }
            return TodoList(todos: state.todos);
          } else if (state is TodoError) {
            return Center(child: Text(state.message));
          } else {
            return SizedBox(); // Пустой экран (например, для TodoInitial)
          }
        },
      ),
    );
  }
}
