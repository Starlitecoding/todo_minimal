import 'package:todo_test1/features/domain/model/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> getAllTodos();
  Future<void> createTodo(TodoEntity todoEntity);
  Future<void> deleteTodo(String id);
  Future<void> updateTodo(TodoEntity todoEntity);
}
