import 'package:floor/floor.dart';

/// This is the entity that represents a todo item.
@entity
class TodoItem {
  static int ID = 1;

  /// This is the unique identifier for this entity.
  @primaryKey
  final int id;

  /// This is the actual item
  final String todoItem;

  TodoItem(this.id, this.todoItem) {
    if(id > ID) {
      ID = id + 1;
    }
  }
}