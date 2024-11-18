import 'package:app_mobile_iot/features/login/screens/token_storage.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final FlutterAppAuth _appAuth = const FlutterAppAuth();

  final String _clientId = 'falcon-shield-client';
  final String _redirectUrl = 'com.verysafe.falconshield:/oauthredirect';
  final String _issuer = 'https://auth.falcon-shield.tech/realms/FalconShield';
  final String _discoveryUrl =
      'https://auth.falcon-shield.tech/realms/FalconShield/.well-known/openid-configuration';
  final String _postLogoutRedirectUrl = 'com.verysafe.falconshield:/';
  final List<String> _scopes = <String>[
    'openid',
    'profile',
    'email',
    'offline_access',
  ];

  final AuthorizationServiceConfiguration _serviceConfiguration =
      const AuthorizationServiceConfiguration(
    authorizationEndpoint:
        'https://auth.falcon-shield.tech/realms/FalconShield/protocol/openid-connect/auth',
    tokenEndpoint:
        'https://auth.falcon-shield.tech/realms/FalconShield/protocol/openid-connect/token',
    endSessionEndpoint:
        'https://auth.falcon-shield.tech/realms/FalconShield/protocol/openid-connect/logout',
  );

  String? accessToken;
  String? refreshToken;
  String? idToken;

  final TokenStorage tokenStorage = TokenStorage();

  Future<void> login() async {
    try {
      final AuthorizationTokenResponse result =
          await _appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          _clientId,
          _redirectUrl,
          clientSecret: 'Py2bAGYOqDhRcLqhWHlSKX9mJsigXku4',
          // serviceConfiguration: _serviceConfiguration,
          discoveryUrl: _discoveryUrl,
          scopes: _scopes,
        ),
      );

      accessToken = result.accessToken;
      await tokenStorage.saveToken(accessToken!, 'access_token');

      refreshToken = result.refreshToken;
      await tokenStorage.saveToken(refreshToken!, 'refresh_token');

      idToken = result.idToken;
    } catch (e) {
      throw Exception('Error al iniciar sesión: $e');
    }
  }

  Future<void> logout() async {
    try {
      await _appAuth.endSession(
        EndSessionRequest(
          idTokenHint: idToken,
          postLogoutRedirectUrl: _postLogoutRedirectUrl,
          serviceConfiguration: _serviceConfiguration,
        ),
      );
      _clearSession();
    } catch (e) {
      throw Exception('Error al cerrar sesión: $e');
    }
  }

  // Refresh token
  Future<void> refresh() async {
    var refresh_token = await tokenStorage.getToken('refresh_token');
    if (refresh_token == null) {
      throw Exception('No se puede refrescar el token sin un refresh token');
    }

    try {
      final TokenResponse result = await _appAuth.token(
        TokenRequest(
          _clientId,
          _redirectUrl,
          clientSecret: 'Py2bAGYOqDhRcLqhWHlSKX9mJsigXku4',
          refreshToken: refresh_token,
          issuer: _issuer,
          scopes: _scopes,
        ),
      );

      accessToken = result.accessToken;
      refreshToken = result.refreshToken;
      tokenStorage.saveToken(accessToken!, 'access_token');
      tokenStorage.saveToken(refreshToken!, 'refresh_token');
    } catch (e) {
      throw Exception('Error al refrescar el token: $e');
    }
  }

  Future<http.Response> authenticatedRequest(
    String route, {
    String method = 'GET', // Por defecto, usa GET
    Map<String, String>? headers,
    Object? body,
  }) async {
    const String baseUrl = 'https://api.falcon-shield.tech/api';

    var access_token = await tokenStorage.getToken('access_token');

    if (access_token == null) {
      throw Exception('El token de acceso no está disponible');
    }

    final uri = Uri.parse('$baseUrl/$route');
    final defaultHeaders = <String, String>{
      'Authorization': 'Bearer $access_token',
      'Content-Type': 'application/json', // Content-Type para JSON por defecto
    };

    if (headers != null) {
      defaultHeaders.addAll(headers);
    }

    try {
      late http.Response response;

      // Verifica el método y realiza la solicitud correspondiente
      if (method == 'GET') {
        response = await http.get(uri, headers: defaultHeaders);
      } else if (method == 'POST') {
        response = await http.post(uri, headers: defaultHeaders, body: body);
      } else if (method == 'PUT') {
        response = await http.put(uri, headers: defaultHeaders, body: body);
      } else if (method == 'DELETE') {
        response = await http.delete(uri, headers: defaultHeaders);
      } else {
        throw Exception('Método HTTP no soportado: $method');
      }

      // Si el token ha expirado (401), refresca y reintenta
      if (response.statusCode == 401) {
        await refresh();
        return authenticatedRequest(route,
            method: method, headers: headers, body: body);
      }

      return response;
    } catch (e) {
      throw Exception('Error al realizar la petición autenticada: $e');
    }
  }

  void _clearSession() async {
    await tokenStorage.deleteToken('refresh_token');
    await tokenStorage.deleteToken('access_token');

    accessToken = null;
    refreshToken = null;
    idToken = null;
  }
}
