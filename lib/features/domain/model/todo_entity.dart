class TodoEntity {
  final String id;
  final String text;
  final bool isDone;

  TodoEntity({required this.id, required this.text, this.isDone = false});

  TodoEntity copyWith({String? id, String? text, bool? isDone}) {
    return TodoEntity(
      id: id ?? this.id,
      text: text ?? this.text,
      isDone: isDone ?? this.isDone,
    );
  }
}
