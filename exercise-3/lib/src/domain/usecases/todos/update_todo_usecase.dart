import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
//import 'package:template/src/domain/entities/todo.dart';
import 'package:template/src/domain/repositories/todo_repository.dart';

class UpdateTodoUseCase extends UseCase<void, Map<String, dynamic>> {
  UpdateTodoUseCase(this._todoRepository);
  final TodoRepository _todoRepository;

  @override
  Future<Stream<void>> buildUseCaseStream(Map<String, dynamic>? params) async {
    final controller = StreamController<void>();
    try {
      controller.add(await _todoRepository.updateTodo(
        params?['id'],
        params?['todo'],
      ));
      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}
