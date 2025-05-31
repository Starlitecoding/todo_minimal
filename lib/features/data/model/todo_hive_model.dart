import 'package:hive/hive.dart';

part 'todo_hive_model.g.dart';


@HiveType(typeId: 0)
class TodoHiveModel extends HiveObject{

@HiveField(1)
String id;

@HiveField(2)
String text;

@HiveField(3)
bool isDone;

TodoHiveModel({
    required this.id,
    required this.text,
    required this.isDone,
  });


}