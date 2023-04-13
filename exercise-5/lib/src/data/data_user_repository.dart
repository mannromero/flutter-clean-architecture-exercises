import 'package:template/src/domain/entities/user.dart';
import 'package:template/src/domain/repositories/user_repository.dart';

class DataUserRepository extends UserRepository {
  DataUserRepository._internal();

  static final DataUserRepository _instance = DataUserRepository._internal();
  factory DataUserRepository() => _instance;

  List<User> _users = [];

  @override
  Future<User> addUser(User user) {
    throw UnimplementedError();
  }

  @override
  Future<List<User>> get users => Future.value(_users);
}
