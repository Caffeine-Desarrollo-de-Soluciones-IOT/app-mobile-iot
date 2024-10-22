import "../repositories/login_repository.dart";
import '../entities/user.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<User?> execute(String username, String password) async {
    return await repository.login(username, password);
  }
}
