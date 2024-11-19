import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final _storage = const FlutterSecureStorage();

  // Guarda el token
  Future<void> saveToken(String token, String tokenType) async {
    await _storage.write(key: tokenType, value: token);
  }

  // Recupera el token
  Future<String?> getToken(String tokenType) async {
    return await _storage.read(key: tokenType);
  }

  // Elimina el token
  Future<void> deleteToken(String tokenType) async {
    await _storage.delete(key: tokenType);
  }
}
