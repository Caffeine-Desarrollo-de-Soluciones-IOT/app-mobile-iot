import 'package:app_mobile_iot/features/login/data_source/login_data_source.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(LoginState(hasData: false, hasError: false, isLoading: false));

  LoginDataSource loginDataSource = LoginDataSource();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      emit(state.copyWith(true, false, false, null));
      await Future.delayed(const Duration(milliseconds: 300));

      await loginDataSource.login(
          emailController.text, passwordController.text);
      emit(state.copyWith(false, false, true, null));
    } on Exception catch (e) {
      emit(state.copyWith(false, true, false, e.toString()));
    }
  }
}
