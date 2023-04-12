import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:template/src/domain/entities/todo.dart';
import 'package:template/src/domain/repositories/todo_repository.dart';

class AddTodoUseCase extends UseCase<Todo, Map> {
  AddTodoUseCase(this._todoRepository);
  final TodoRepository _todoRepository;

  @override
  Future<Stream<Todo>> buildUseCaseStream(Map? params) async {
    final controller = StreamController<Todo>();
    try {
      final todo = await _todoRepository.addTodo(params?['todo']);
      controller.add(todo);
      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}
