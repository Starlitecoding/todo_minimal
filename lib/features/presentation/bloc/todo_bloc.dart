import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test1/features/domain/usecases/add_todo_usecase.dart';
import 'package:todo_test1/features/domain/usecases/delete_todo_usecase.dart';
import 'package:todo_test1/features/domain/usecases/get_all_todos_usecase.dart';
import 'package:todo_test1/features/domain/usecases/update_todo_usecase.dart';

import 'package:equatable/equatable.dart';
import 'package:todo_test1/features/domain/model/todo_entity.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetAllTodosUsecase getAllTodos;
  final CreateTodoUsecase createTodo;
  final UpdateTodoUsecase updateTodo;
  final DeleteTodoUsecase deleteTodo;

  TodoBloc({
    required this.getAllTodos,
    required this.createTodo,
    required this.updateTodo,
    required this.deleteTodo,
  }) : super(const TodoInitial()) {
    on<LoadTodos>((event, emit) async {
      emit(const TodoLoading());
      try {
        final todos = await getAllTodos();
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError('Ошибка загрузки todo! : $e'));
      }
    });

    on<CreateTodo>((event, emit) async {
      try {
        await createTodo(
          TodoEntity(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            text: '', // пустой текст для редактирования
            isDone: false,
          ),
        );

        final todos = await getAllTodos(); //обновление всех todo
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError('Ошибка загрузки todo! : $e'));
      }
    });

    on<UpdateTodo>((event, emit) async {
      try {
        await updateTodo(event.todo);

        final todos = await getAllTodos();
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError('Ошибка загрузки todo! : $e'));
      }
    });

    on<DeleteTodo>((event, emit) async {
      try {
        await deleteTodo(event.id);

        final todos = await getAllTodos();
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError('Ошибка загрузки todo! : $e'));
      }
    });
  }
}
