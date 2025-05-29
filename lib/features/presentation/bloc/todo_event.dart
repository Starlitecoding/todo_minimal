import 'package:equatable/equatable.dart';
import 'package:todo_test1/features/domain/model/todo_entity.dart';


abstract class TodoEvent extends Equatable{
  const TodoEvent();

  @override
  List<Object?> get props => [];


}

class LoadTodos extends TodoEvent{
  const LoadTodos();

  @override
  List<Object?> get props => [];

}


class CreateTodo extends TodoEvent{
  final TodoEntity todo;

  const CreateTodo(this.todo);

  @override
  List<Object?> get props => [todo];

}



class DeleteTodo extends TodoEvent{
  final int id;

  const DeleteTodo(this.id);

  @override
  List<Object?> get props => [id];

}


class UpdateTodo extends TodoEvent{
  final TodoEntity todo;


  const UpdateTodo(this.todo);

  @override
  List<Object?> get props => [todo];

}