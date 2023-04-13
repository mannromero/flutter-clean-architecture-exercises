import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:template/src/domain/entities/todo.dart';
import 'package:template/src/domain/repositories/todo_repository.dart';

class GetAllTodoUseCase extends UseCase<List<Todo>, void> {
  GetAllTodoUseCase(this._todoRepository);
  final TodoRepository _todoRepository;

  @override
  Future<Stream<List<Todo>>> buildUseCaseStream(void params) async {
    final controller = StreamController<List<Todo>>();
    try {
      final todos = await _todoRepository.getAllTodos;
      controller.add(todos);
      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}
