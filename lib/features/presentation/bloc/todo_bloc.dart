
import 'package:todo_test1/features/domain/usecases/add_todo_usecase.dart';
import 'package:todo_test1/features/domain/usecases/delete_todo_usecase.dart';
import 'package:todo_test1/features/domain/usecases/get_all_todos_usecase.dart';
import 'package:todo_test1/features/domain/usecases/update_todo_usecase.dart';



part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState>{
  final GetAllTodosUsecase getAllTodos;
  final AddTodoUsecase addTodo;
  final UpdateTodoUsecase updateTodo;
  final DeleteTodoUsecase deleteTodo;

  TodoBloc({
  required this.getAllTodos, 
  required this.addTodo, 
  required this.updateTodo, 
  required this.deleteTodo
  }) : super(const TodoInitial()){

  on<LoadTodos> ((event, emit) async{
   emit(const TodoLoading());
   try{
    final todos = await getAllTodos();
    emit (TodoLoaded(todos));
   } catch (e){
    emit(TodoError('Ошибка загрузки todo: $e'))
   }


  });
  
  
  }




}

