import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test1/di.dart';
import 'package:todo_test1/features/presentation/bloc/todo_bloc.dart';
import 'package:todo_test1/features/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<TodoBloc>())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
