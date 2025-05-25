abstract class TodoEntity {
  final int id;
  final String text;
  final bool isDone;

  TodoEntity({required this.id, required this.text, this.isDone = false});



}