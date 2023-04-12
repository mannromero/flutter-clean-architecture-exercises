import 'package:template/src/app/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> addUser(User user);
  Future<List<User>> get users;
}
