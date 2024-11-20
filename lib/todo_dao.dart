import 'package:floor/floor.dart';
import 'todo_item.dart';

/// This is the Data Access Object for TodoItem entity
@dao
abstract class ToDoDAO {

  /// This returns all the todoitems.
  @Query("Select * from TodoItem")
  Future<List<TodoItem>> getAllItems();

  /// This inserts into the todo item entity
  @insert
  Future<void> insertItem(TodoItem itm);

  /// This deletes from the todo item entity
  @delete
  Future<void> deleteItem(TodoItem itm);

}