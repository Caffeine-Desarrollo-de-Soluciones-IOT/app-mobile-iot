import 'package:app_mobile_iot/features/login/domain/usecases/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../dependencies/injection.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: BlocProvider(
            create: (context) => LoginBloc(sl<LoginUseCase>()),
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state.isSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BottomAppBar()),
                  );
                }
                if (state.errorMessage.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage)),
                  );
                }
              },
              builder: (context, state) {
                return Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(labelText: "Username"),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(labelText: "Password"),
                        ),
                        SizedBox(height: 24),
                        if (state.isLoading)
                          CircularProgressIndicator()
                        else
                          ElevatedButton(
                            onPressed: () {
                              final username = _usernameController.text;
                              final password = _passwordController.text;
                              context
                                  .read<LoginBloc>()
                                  .add(LoginButtonPressed(username, password));
                            },
                            child: Text("Login"),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black, // Fondo del botón
                              backgroundColor:
                                  Colors.white, // Color del texto del botón
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
