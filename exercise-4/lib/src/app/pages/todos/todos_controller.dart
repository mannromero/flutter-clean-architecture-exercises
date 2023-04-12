import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:template/src/app/pages/todos/todos_presenter.dart';

class TodosController extends Controller {
  TodosController(todoRepo)
      : presenter = TodosPresenter(todoRepo),
        super();

  final TodosPresenter presenter;

  @override
  // this is called automatically by the parent class
  void initListeners() {}

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
