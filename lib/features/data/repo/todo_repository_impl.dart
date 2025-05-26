import 'package:todo_test1/features/data/datasources/local_todo_datasouce.dart';
import 'package:todo_test1/features/data/model/todo_hive_model.dart';
import 'package:todo_test1/features/domain/model/todo_entity.dart';
import 'package:todo_test1/features/domain/repo/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final LocalTodoDatasouce localTodoDatasouce;

  TodoRepositoryImpl(this.localTodoDatasouce);

  //data -> domain
  TodoEntity fromModelToEntity(TodoHiveModel model) {
    return TodoEntity(id: model.id, text: model.text, isDone: model.isDone);
  }

  //data <- domain
  TodoHiveModel fromEntityToModel(TodoEntity entity) {
    return TodoHiveModel(
      id: entity.id,
      text: entity.text,
      isDone: entity.isDone,
    );
  }

  @override
  Future<List<TodoEntity>> getAllTodos() async {
    final models = await localTodoDatasouce.getAllTodos();
    return models.map(fromModelToEntity).toList();
  }

  @override
  Future<void> createTodo(TodoEntity todoEntity) async {
    final model = fromEntityToModel(todoEntity);
    await localTodoDatasouce.createTodo(model);
  }

  @override
  Future<void> updateTodo(TodoEntity todoEntity) async {
    final model = fromEntityToModel(todoEntity); 
    await localTodoDatasouce.updateTodo(model);
  }

  @override
  Future<void> deleteTodo(String id) async {
    await localTodoDatasouce.deleteTodo(id);
  }
}
