import '../../domain/entities/user.dart';
import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<User?> login(String username, String password) async {
    //authentication with server

    //simulation
    if (username == 'admin' && password == '12345') {
      return User(username: username, token: "dummy_token");
    } else {
      return null;
    }
  }
}
