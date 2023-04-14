import 'package:template/src/domain/entities/todo.dart';
import 'package:template/src/domain/repositories/todo_repository.dart';

class DataTodoRepository extends TodoRepository {
  DataTodoRepository._internal(); // private constructor
  static final DataTodoRepository _instance =
      DataTodoRepository._internal(); // singleton
  factory DataTodoRepository() => _instance; // factory constructor

  final List<Todo> _todos = [
    const Todo(
      id: 1,
      title: 'Todo 1',
    ),
    const Todo(
      id: 2,
      title: 'Todo 2',
    ),
    const Todo(
      id: 3,
      title: 'Todo 3',
    ),
    const Todo(
      id: 4,
      title: 'Todo 4',
    ),
  ];

  @override
  Future<Todo> addTodo(Todo todo) {
    _todos.add(todo);
    return Future.value(todo);
  }

  @override
  Future<void> removeTodo(dynamic id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index == -1) {
      throw Exception('Todo not found with id $id');
    }
    _todos.removeAt(index);
    return Future.value();
  }

  @override
  Future<void> updateTodo(dynamic id, Todo todo) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index == -1) {
      throw Exception('Todo not found with id $id');
    }
    _todos[index] = todo;
    return Future.value();
  }

  @override
  Future<Todo> getTodo(dynamic id) {
    final todo = _todos.firstWhere((todo) => todo.id == id,
        orElse: () => const Todo(
              id: null,
              title: 'Not Found',
            ));
    return Future.value(todo);
  }

  @override
  Future<List<Todo>> get getAllTodos => Future.value(_todos);
}
