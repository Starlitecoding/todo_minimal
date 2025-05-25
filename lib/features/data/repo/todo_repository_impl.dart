import 'package:todo_test1/features/data/model/todo_hive_model.dart';
import 'package:todo_test1/features/domain/model/todo_entity.dart';
import 'package:todo_test1/features/domain/repo/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository{

  //data -> domain
  // TodoEntity fromHiveModelToEntity(TodoHiveModel model){
  //   return TodoEntity(id: model.id, text: model.text, isDone: model.isDone);

  // }


  //data <- domain




  @override
  Future<void> createTodo(TodoEntity todoEntity) {
    // TODO: implement createTodo
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(String id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<TodoEntity>> getAllTodos() {
    // TODO: implement getAllTodos
    throw UnimplementedError();
  }

  @override
  Future<void> updateTodo(TodoEntity todoEntity) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}