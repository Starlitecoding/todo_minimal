import 'package:todo_test1/features/data/model/todo_hive_model.dart';

abstract class LocalTodoDatasouce {
  //интерфейс

  Future<List<TodoHiveModel>> getAllTodos();
  Future<void> createTodo(TodoHiveModel todo);
  Future<void> updateTodo(TodoHiveModel todo);
  Future<void> deleteTodo(String id);
}


