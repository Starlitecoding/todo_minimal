import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test1/features/domain/model/todo_entity.dart';
import 'package:todo_test1/features/presentation/bloc/todo_bloc.dart';

class TodoTile extends StatefulWidget {
  final TodoEntity todo;

  const TodoTile({super.key, required this.todo});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  late bool isEditing;
  late TextEditingController controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    isEditing =
        widget.todo.text.isEmpty; // если текст пустой — это новая тудушка
    controller = TextEditingController(text: widget.todo.text);

    _focusNode = FocusNode();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && isEditing) {
        _finishEditing();
      }
    });
  }

  void _finishEditing() {
    final value = controller.text.trim();
    if (value.isNotEmpty && value != widget.todo.text) {
      final updatedTodo = widget.todo.copyWith(text: value);
      context.read<TodoBloc>().add(UpdateTodo(updatedTodo));
    }
    setState(() {
      isEditing = false;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    _focusNode.dispose;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          isEditing = true;
        });
      },
      child: ListTile(
        onTap: () {
          if (!isEditing) {
            final updatedTodo = widget.todo.copyWith(
              isDone: !widget.todo.isDone,
            );
            context.read<TodoBloc>().add(UpdateTodo(updatedTodo));
          }
        },
        title:
            isEditing
                ? TextField(
                  focusNode: _focusNode,
                  controller: controller,
                  autofocus: true,
                  onSubmitted: (value) => _finishEditing(),

                  // onSubmitted: (value) {
                  //   if (value.trim().isNotEmpty) {
                  //     final updatedTodo = widget.todo.copyWith(
                  //       text: value.trim(),
                  //     );
                  //     context.read<TodoBloc>().add(UpdateTodo(updatedTodo));
                  //   }
                  //   setState(() {
                  //     isEditing = false;
                  //   });
                  // },
                  // onEditingComplete: () {
                  //   setState(() {
                  //     isEditing = false;
                  //   });
                  // },
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                )
                : Text(
                  widget.todo.text,
                  style: TextStyle(
                    decoration:
                        widget.todo.isDone ? TextDecoration.lineThrough : null,
                        decorationColor: Colors.white,
                    color: Colors.white,
                  ),
                ),
        leading: Icon(
          widget.todo.isDone
              ? Icons.check_circle
              : Icons.radio_button_unchecked,
          color: widget.todo.isDone ? Colors.green : Colors.grey,
        ),
      ),
    );
  }
}

    //Simple stless ListTile

    // return ListTile(
    //   onTap: () {
    //     final updatedTodo = widget.todo.copyWith(isDone: !widget.todo.isDone);
    //     context.read<TodoBloc>().add(UpdateTodo(updatedTodo));
    //   },
    //   title: Text(
    //     widget.todo.text,
    //     style: TextStyle(
    //       decoration: widget.todo.isDone ? TextDecoration.lineThrough : null,
    //       color: Colors.white,
    //     ),
    //   ),

    //   leading: Icon(
    //     widget.todo.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
    //     color: widget.todo.isDone ? Colors.green : Colors.grey,
    //   ),
    // );
  

