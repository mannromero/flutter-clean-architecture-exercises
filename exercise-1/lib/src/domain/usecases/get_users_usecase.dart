import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:template/src/app/domain/entities/user.dart';
import 'package:template/src/app/domain/repositories/user_repository.dart';

class GetUsersUseCase extends UseCase<List<User>, void> {
  GetUsersUseCase(this._userRepository);
  final UserRepository _userRepository;
  @override
  Future<Stream<List<User>>> buildUseCaseStream(void params) async {
    final controller = StreamController<List<User>>();
    try {
      controller.add(await _userRepository.users);
      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}
