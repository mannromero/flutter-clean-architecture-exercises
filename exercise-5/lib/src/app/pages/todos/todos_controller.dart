import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:template/src/app/pages/todos/todos_presenter.dart';
import 'package:template/src/domain/entities/todo.dart';

class TodosController extends Controller {
  TodosController(todoRepo)
      : presenter = TodosPresenter(todoRepo),
        super();

  final TodosPresenter presenter;

  @override
  // this is called automatically by the parent class
  void initListeners() {
    presenter.getAllTodosOnNext = (List<Todo> todos) {
      print('Todos are here');
    };
    presenter.getAllTodosOnComplete = () {
      print('Todos retrieved');
    };
    presenter.getAllTodosOnError = (e) {
      print('Todos error');
    };

    presenter.getTodoOnNext = (Todo todo) {
      print('Todo is here');
    };
    presenter.getTodoOnComplete = () {
      print('Todo retrieved');
    };
    presenter.getTodoOnError = (e) {
      print('Todo error');
    };

    presenter.updateTodoOnNext = (Todo todo) {
      print('Todo is updated');
    };
    presenter.updateTodoOnComplete = () {
      print('Todo updated');
    };
    presenter.updateTodoOnError = (e) {
      print('Todo update error');
    };

    presenter.removeTodoOnNext = (Todo todo) {
      print('Todo is removed');
    };
    presenter.removeTodoOnComplete = () {
      print('Todo removed');
    };
    presenter.removeTodoOnError = (e) {
      print('Todo remove error');
    };

    presenter.addTodoOnNext = (Todo todo) {
      print('Todo is added');
    };
    presenter.addTodoOnComplete = () {
      print('Todo added');
    };
    presenter.addTodoOnError = (e) {
      print('Todo add error');
    };
  }

  @override
  void onResumed() => print('On resumed');

  @override
  void onReassembled() => print('View is about to be reassembled');

  @override
  void onDeactivated() => print('View is about to be deactivated');

  @override
  void onDisposed() {
    presenter.dispose(); // don't forget to dispose of the presenter
    super.onDisposed();
  }
}
