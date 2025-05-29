import 'package:equatable/equatable.dart';
import 'package:todo_test1/features/domain/model/todo_entity.dart';


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
  final TodoEntity todo;

  const TodoLoaded(this.todo);


  @override
  List<Object?> get props => [todo];
  
}

class TodoError extends TodoState{

  final String message;

  const TodoError(this.message);

  @override
  List<Object?> get props => [message];

}