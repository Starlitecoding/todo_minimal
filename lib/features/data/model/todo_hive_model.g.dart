// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoHiveModelAdapter extends TypeAdapter<TodoHiveModel> {
  @override
  final int typeId = 0;

  @override
  TodoHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoHiveModel(
      id: fields[1] as int,
      text: fields[2] as String,
      isDone: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TodoHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.text)
      ..writeByte(3)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
