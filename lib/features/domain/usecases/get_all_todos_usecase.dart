import 'package:todo_test1/features/domain/model/todo_entity.dart';
import 'package:todo_test1/features/domain/repo/todo_repository.dart';

class GetAllTodosUsecase {
    final TodoRepository todoRepository;

    GetAllTodosUsecase(this.todoRepository);


  Future<List<TodoEntity>> call (){
    return todoRepository.getAllTodos();
  }

}