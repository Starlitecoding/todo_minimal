import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_test1/features/data/datasources/local_todo_datasouce.dart';
import 'package:todo_test1/features/data/datasources/local_todo_datasouce_impl.dart';
import 'package:todo_test1/features/data/model/todo_hive_model.dart';
import 'package:todo_test1/features/data/repo/todo_repository_impl.dart';
import 'package:todo_test1/features/domain/repo/todo_repository.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:todo_test1/features/domain/usecases/add_todo_usecase.dart';
import 'package:todo_test1/features/domain/usecases/delete_todo_usecase.dart';
import 'package:todo_test1/features/domain/usecases/get_all_todos_usecase.dart';
import 'package:todo_test1/features/domain/usecases/update_todo_usecase.dart';
import 'package:todo_test1/features/presentation/bloc/todo_bloc.dart';

GetIt sl = GetIt.instance; //sl - service locator

Future<void> init() async {
  //Hive init
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  //Hive adapter
  Hive.registerAdapter(TodoHiveModelAdapter());

  //Opening box
  final todobox = await Hive.openBox<TodoHiveModel>('todobox');

  sl.registerLazySingleton<LocalTodoDatasouce>(
    () => LocalTodoDatasouceImpl(todobox),
  );

  //Repo
  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(sl()));

  //Usecases
  sl.registerLazySingleton<CreateTodoUsecase>(() => CreateTodoUsecase(sl()));
  sl.registerLazySingleton<GetAllTodosUsecase>(() => GetAllTodosUsecase(sl()));
  sl.registerLazySingleton<UpdateTodoUsecase>(() => UpdateTodoUsecase(sl()));
  sl.registerLazySingleton<DeleteTodoUsecase>(() => DeleteTodoUsecase(sl()));

  sl.registerFactory<TodoBloc>(
    () => TodoBloc(
      getAllTodos: sl(),
      createTodo: sl(),
      updateTodo: sl(),
      deleteTodo: sl(),
    ),
  );
}
