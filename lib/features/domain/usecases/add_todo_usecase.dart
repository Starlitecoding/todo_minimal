import 'package:todo_test1/features/domain/model/todo_entity.dart';
import 'package:todo_test1/features/domain/repo/todo_repository.dart';

class AddTodoUsecase {
  final TodoRepository repository;

  AddTodoUsecase(this.repository);

  Future<void> call(TodoEntity todo){
    return repository.createTodo(todo);
  }
  

}