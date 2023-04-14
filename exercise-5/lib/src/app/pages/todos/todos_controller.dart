import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:template/src/app/pages/todos/todos_presenter.dart';
import 'package:template/src/domain/entities/todo.dart';

class TodosController extends Controller {
  TodosController(todoRepo)
      : presenter = TodosPresenter(todoRepo),
        super() {
    fetchTodos(); // fetch todos on initialization
  }

  final TodosPresenter presenter;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  @override
  void initListeners() {
    presenter.getAllTodosOnNext = (List<Todo> todos) {
      _todos = todos;
      refreshUI();
    };
    presenter.getAllTodosOnComplete = () {
      print('Todos retrieved');
    };
    presenter.getAllTodosOnError = (e) {
      print('Todos error');
    };

    presenter.removeTodoOnNext = (responce) {
      fetchTodos();
    };
    presenter.removeTodoOnComplete = () {
      print('Todo removed');
    };
    presenter.removeTodoOnError = (e) {
      print('Todo remove error');
    };
  }

  void fetchTodos() {
    presenter.getAllTodos();
  }

  void removeTodoById(dynamic id) {
    presenter.removeTodo(id);
  }

  @override
  void onResumed() => print('On resumed');

  @override
  void onReassembled() => print('View is about to be reassembled');

  @override
  void onDeactivated() {
    presenter.dispose(); // Dispose of the presenter
    print('View is about to be deactivated');
  }

  @override
  void onDisposed() {
    presenter.dispose();
    super.onDisposed();
  }
}
