import 'package:todo_test1/features/domain/repo/todo_repository.dart';

class DeleteTodoUsecase {
  final TodoRepository repository;

  DeleteTodoUsecase(this.repository);

  Future<void> call(String id){
    return repository.deleteTodo(id);
  }


}