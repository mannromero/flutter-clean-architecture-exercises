import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
//import 'package:template/src/domain/entities/todo.dart';
import 'package:template/src/domain/repositories/todo_repository.dart';

class RemoveTodoUseCase extends CompletableUseCase<dynamic> {
  RemoveTodoUseCase(this._todoRepository);
  final TodoRepository _todoRepository;
  @override
  Future<Stream<void>> buildUseCaseStream(dynamic params) async {
    final StreamController<void> controller = StreamController();
    try {
      controller.add(await _todoRepository.removeTodo(params));
      unawaited(controller.close());
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}
