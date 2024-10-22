import '../entities/user.dart';

abstract class LoginRepository {
  Future<User?> login(String username, String password);
}
