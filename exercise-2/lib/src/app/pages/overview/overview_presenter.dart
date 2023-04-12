import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:template/src/domain/entities/user.dart';
import 'package:template/src/domain/usecases/get_users_usecase.dart';

class OverviewPresenter extends Presenter {
  OverviewPresenter(usersRepo) : getUsersUseCase = GetUsersUseCase(usersRepo);

  final GetUsersUseCase getUsersUseCase;

  Function? getUsersOnNext;
  Function? getUsersOnComplete;
  Function? getUsersOnError;

  void getUser() {
    getUsersUseCase.execute(_GetUsersUseCaseObserver(this), null);
  }

  @override
  void dispose() {
    getUsersUseCase.dispose();
  }
}

class _GetUsersUseCaseObserver extends Observer<List<User>> {
  _GetUsersUseCaseObserver(this.presenter);

  final OverviewPresenter presenter;

  @override
  void onComplete() {
    presenter.getUsersOnComplete?.call();
  }

  @override
  void onError(e) {
    presenter.getUsersOnError?.call(e);
  }

  @override
  void onNext(response) {
    presenter.getUsersOnNext?.call(response);
  }
}
