import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String text; // текст задачи
  final bool isDone; // выполнена ли задача
  final Function(bool?) onChanged; // функция, когда меняем чекбокс

  const TodoTile({
    super.key,
    required this.text,
    required this.isDone,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        children: [
          // ✅ Чекбокс
          Checkbox(
            value: isDone,
            onChanged: onChanged,
            activeColor: Colors.white,
            checkColor: Colors.black,
          ),

          // 📝 Текст задачи
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              decoration:
                  isDone ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
