import 'package:todo_test1/features/domain/model/todo_entity.dart';
import 'package:todo_test1/features/domain/repo/todo_repository.dart';

class CreateTodoUsecase {
  final TodoRepository repository;

  CreateTodoUsecase(this.repository);

  Future<void> call(TodoEntity todo){
    return repository.createTodo(todo);
  }
  

}