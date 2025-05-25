
import 'package:hive/hive.dart';
import 'package:todo_test1/features/data/datasources/local_todo_datasouce.dart';
import 'package:todo_test1/features/data/model/todo_hive_model.dart';

class LocalTodoDatasouceImpl implements LocalTodoDatasouce{
  final Box <TodoHiveModel> todoBox;

  LocalTodoDatasouceImpl(this.todoBox);

@override
  Future<List<TodoHiveModel>> getAllTodos() async {
    return todoBox.values.toList();
  }

  @override
  Future<void> createTodo(TodoHiveModel todo) async {
    await todoBox.put(todo.id, todo);
  }

  @override
  Future<void> deleteTodo(String id) async {
    await todoBox.delete(id);
  }


  @override
  Future<void> updateTodo(TodoHiveModel todo) async {
   await todo.save();
  }


}