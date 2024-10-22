import 'package:bloc/bloc.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/entities/user.dart';

class LoginEvent {}

class LoginState {
  final bool isLoading;
  final bool isSuccess;
  final String errorMessage;

  LoginState(
      {this.isLoading = false, this.isSuccess = false, this.errorMessage = ""});

  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginState()) {
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      try {
        User? user = await loginUseCase.execute("admin", "12345");
        if (user != null) {
          emit(state.copyWith(isLoading: false, isSuccess: true));
        } else {
          emit(state.copyWith(isLoading: false, errorMessage: "Login failed"));
        }
      } catch (e) {
        emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
      }
    });
  }

  // @override
  // Stream<LoginState> mapEventToState(LoginEvent event) async* {
  //   yield LoginState(isLoading: true);

  //   try {
  //     User? user = await loginUseCase.execute("admin", "12345");
  //     if (user != null) {
  //       yield LoginState(isSuccess: true);
  //     } else {
  //       yield LoginState(errorMessage: "Login failed");
  //     }
  //   } catch (e) {
  //     yield LoginState(errorMessage: e.toString());
  //   }
  // }
}
