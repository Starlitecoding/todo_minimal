import 'package:flutter/material.dart';
import '../widgets/todo_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: TodoTile(
          text: 'Купить хлеб',
          isDone: false,
          onChanged: (value) {
            print('Чекбокс кликнут: $value');
          },
        ),
      ),
    );
  }
}
