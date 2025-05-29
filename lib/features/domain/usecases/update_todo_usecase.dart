import 'package:todo_test1/features/domain/model/todo_entity.dart';
import 'package:todo_test1/features/domain/repo/todo_repository.dart';

class UpdateTodoUsecase {
  final TodoRepository todoRepository;

  UpdateTodoUsecase(this.todoRepository);

  Future<void> call(TodoEntity todo) {
    return todoRepository.updateTodo(todo);
  }
}
