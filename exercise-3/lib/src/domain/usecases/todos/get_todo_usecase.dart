import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:template/src/domain/entities/todo.dart';
import 'package:template/src/domain/repositories/todo_repository.dart';

class GetTodoUseCase extends UseCase<Todo, dynamic> {
  GetTodoUseCase(this._todoRepository);
  final TodoRepository _todoRepository;

  @override
  Future<Stream<Todo>> buildUseCaseStream(dynamic params) async {
    final controller = StreamController<Todo>();
    try {
      final todo = await _todoRepository.getTodo(params);
      controller.add(todo);
      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}
