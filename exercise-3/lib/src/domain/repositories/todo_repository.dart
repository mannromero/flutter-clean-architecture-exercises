import 'package:template/src/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<Todo> addTodo(Todo todo);
  Future<void> removeTodo(dynamic id);
  Future<void> updateTodo(dynamic id, Todo todo);
  Future<List<Todo>> get getAllTodos;
  Future<Todo> getTodo(dynamic id);
}
