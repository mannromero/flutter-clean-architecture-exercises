import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:template/src/domain/entities/user.dart';
import 'package:template/src/domain/repositories/user_repository.dart';

class GetUsersUseCase extends UseCase<User, Map> {
  GetUsersUseCase(this._userRepository);
  final UserRepository _userRepository;
  @override
  Future<Stream<User>> buildUseCaseStream(Map? params) async {
    final controller = StreamController<User>();
    try {
      controller.add(await _userRepository.addUser(params?['user']));
      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}
