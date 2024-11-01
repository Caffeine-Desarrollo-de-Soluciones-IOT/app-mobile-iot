part of 'login_cubit.dart';

final class LoginState {
  final bool isLoading;
  final bool hasError;
  final bool hasData;
  final String? error;

  LoginState(
      {required this.isLoading,
      required this.hasError,
      required this.hasData,
      this.error});

  LoginState copyWith(isLoading, hasError, hasData, error) {
    return LoginState(
        hasData: hasData,
        hasError: hasError,
        isLoading: isLoading,
        error: error);
  }
}
