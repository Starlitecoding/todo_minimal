import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test1/features/domain/model/todo_entity.dart';
import 'package:todo_test1/features/presentation/bloc/todo_bloc.dart';
import 'package:todo_test1/features/presentation/widgets/empty_state.dart';
import 'package:todo_test1/features/presentation/widgets/todo_list.dart';
import '../widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

  
    context.read<TodoBloc>().add(LoadTodos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoLoaded) {
            if (state.todos.isEmpty) {
              return const EmptyState();
            }
            return TodoList(todos: state.todos);
          } else if (state is TodoError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox(); // Пустой экран
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final todo = TodoEntity(
            id: DateTime.now().millisecondsSinceEpoch.toString(), // уникальный id
            text: 'New todo task',
          );

          context.read<TodoBloc>().add(CreateTodo(todo));
          
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
