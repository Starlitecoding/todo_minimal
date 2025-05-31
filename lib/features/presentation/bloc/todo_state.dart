part of 'todo_bloc.dart';

abstract class TodoState extends Equatable{
  const TodoState();

  List<Object?> get props => [];


}

class TodoInitial  extends TodoState{
  const TodoInitial();

}


class TodoLoading extends TodoState{
  const TodoLoading();

}

class TodoLoaded extends TodoState{
  final List<TodoEntity> todoList;

  const TodoLoaded(this.todoList);


  @override
  List<Object?> get props => [todoList];
  
}

class TodoError extends TodoState{

  final String message;

  const TodoError(this.message);

  @override
  List<Object?> get props => [message];

}