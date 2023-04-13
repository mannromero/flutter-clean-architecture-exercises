import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:template/src/app/pages/overview/overview_presenter.dart';
import 'package:template/src/domain/entities/user.dart';
import 'package:template/src/app/pages/todos/todos_view.dart';
import 'package:flutter/material.dart';

class OverviewController extends Controller {
  OverviewController(usersRepo)
      : presenter = OverviewPresenter(usersRepo),
        super();

  final OverviewPresenter presenter;

  @override
  // this is called automatically by the parent class
  void initListeners() {
    presenter.getUsersOnNext = (List<User> user) {
      print('Users are here');
    };
    presenter.getUsersOnComplete = () {
      print('User retrieved');
    };
    presenter.getUsersOnError = (e) {
      print('User error');
    };
  }

  @override
  void onResumed() => print('On resumed');

  @override
  void onReassembled() => print('View is about to be reassembled');

  @override
  void onDeactivated() => print('View is about to be deactivated');

  void handleTodo() {
    Navigator.of(getContext()).pushReplacementNamed(TodosPage.route);
  }

  @override
  void onDisposed() {
    presenter.dispose(); // don't forget to dispose of the presenter
    super.onDisposed();
  }
}
