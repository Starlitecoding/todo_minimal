import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_test1/features/domain/model/todo_entity.dart';
import 'package:todo_test1/features/presentation/bloc/todo_bloc.dart';
import 'package:todo_test1/features/presentation/widgets/todo_tile.dart';
import 'package:vibration/vibration.dart';

class TodoList extends StatefulWidget {
  final List<TodoEntity> todos;

  const TodoList({super.key, required this.todos});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.todos.length,
      padding: EdgeInsets.all(4),
      separatorBuilder: (context, index) => const SizedBox(height: 16),

      itemBuilder: (context, index) {
        final todo = widget.todos[index];

        return Dismissible(
          key: Key(todo.id),

          direction: DismissDirection.endToStart,

          background: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.white,
            child: const Icon(Icons.delete, color: Colors.black),
          ),
          onDismissed: (direction) {
              Vibration.vibrate(duration: 200);
              context.read<TodoBloc>().add(DeleteTodo(todo.id));

            // 2 Way slide feature:
            // if (direction == DismissDirection.startToEnd) {
            //     context.read<TodoBloc>().add(
            //     UpdateTodo(todo.copyWith(isDone: true)),
            //   );
            // } else {
            //   Vibration.vibrate(duration: 200);
            //   context.read<TodoBloc>().add(DeleteTodo(todo.id));
            // }
          },

          child: TodoTile(todo: todo),
        );
        // return Slidable(
        //   key: Key(todo.id),

        //   endActionPane: ActionPane(
        //     motion: const ScrollMotion(),
        //     extentRatio: 0.25,
        //     children: [
        //       CustomSlidableAction(
        //         onPressed: (_) async {
        //           if (await Vibration.hasVibrator() ?? false) {
        //             Vibration.vibrate(duration: 100);
        //           }

        //           context.read<TodoBloc>().add(DeleteTodo(todo.id));
        //         },

        //         backgroundColor: Colors.transparent,

        //         child: Container(
        //           height: double.infinity,
        //           width: 100, // ширина кнопки
        //           decoration: BoxDecoration(
        //             color: Colors.red,
        //             borderRadius: BorderRadius.circular(12),
        //           ),

        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: const [
        //               Icon(Icons.delete, size: 40, color: Colors.white),
        //               SizedBox(height: 4),
        //               Text(
        //                 'Удалить',
        //                 style: TextStyle(color: Colors.white, fontSize: 16),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        //   child: TodoTile(todo: todo),
      },
    );
  }
}
