import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:template/src/domain/entities/todo.dart';
import 'package:template/src/domain/usecases/todos/get_all_todos_usecase.dart';
import 'package:template/src/domain/usecases/todos/get_todo_usecase.dart';
import 'package:template/src/domain/usecases/todos/update_todo_usecase.dart';
import 'package:template/src/domain/usecases/todos/remove_todo_usecase.dart';
import 'package:template/src/domain/usecases/todos/add_todo_usecase.dart';
import 'package:template/src/domain/repositories/todo_repository.dart';

class TodosPresenter extends Presenter {
  TodosPresenter(todoRepo)
      : getAllTodosUseCase = GetAllTodoUseCase(todoRepo),
        getTodoUseCase = GetTodoUseCase(todoRepo),
        updateTodoUseCase = UpdateTodoUseCase(todoRepo),
        removeTodoUseCase = RemoveTodoUseCase(todoRepo),
        addTodoUseCase = AddTodoUseCase(todoRepo);

  final GetAllTodoUseCase getAllTodosUseCase;
  final GetTodoUseCase getTodoUseCase;
  final UpdateTodoUseCase updateTodoUseCase;
  final RemoveTodoUseCase removeTodoUseCase;
  final AddTodoUseCase addTodoUseCase;

  void getAllTodos() {
    getAllTodosUseCase.execute(GetAllTodosObserver(this));
  }

  void getTodo() {
    getTodoUseCase.execute(GetTodoObserver(this));
  }

  void updateTodo() {
    updateTodoUseCase.execute(UpdateTodoObserver(this));
  }

  void removeTodo() {
    removeTodoUseCase.execute(RemoveTodoObserver(this));
  }

  void addTodo() {
    addTodoUseCase.execute(AddTodoObserver(this));
  }

  @override
  void dispose() {}
}

class GetAllTodosObserver extends Observer<List<Todo>> {
  GetAllTodosObserver(this.presenter);

  final TodosPresenter presenter;

  @override
  void onComplete() {}

  @override
  void onError(e) {}

  @override
  void onNext(response) {}
}

class GetTodoObserver extends Observer<Todo> {
  GetTodoObserver(this.presenter);

  final TodosPresenter presenter;

  @override
  void onComplete() {}

  @override
  void onError(e) {}

  @override
  void onNext(response) {}
}

class UpdateTodoObserver extends Observer<Todo> {
  UpdateTodoObserver(this.presenter);

  final TodosPresenter presenter;

  @override
  void onComplete() {}

  @override
  void onError(e) {}

  @override
  void onNext(response) {}
}

class RemoveTodoObserver extends Observer<Todo> {
  RemoveTodoObserver(this.presenter);

  final TodosPresenter presenter;

  @override
  void onComplete() {}

  @override
  void onError(e) {}

  @override
  void onNext(response) {}
}

class AddTodoObserver extends Observer<Todo> {
  AddTodoObserver(this.presenter);

  final TodosPresenter presenter;

  @override
  void onComplete() {}

  @override
  void onError(e) {}

  @override
  void onNext(response) {}
}
