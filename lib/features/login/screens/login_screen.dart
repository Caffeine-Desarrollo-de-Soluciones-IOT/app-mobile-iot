import 'package:app_mobile_iot/features/login/cubits/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Screen"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(fontSize: 24),
            ),
            Form(
              key: context.read<LoginCubit>().formKey,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: context.read<LoginCubit>().emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email!";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      autofocus: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: context.read<LoginCubit>().passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password!";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state.hasError) {
                  SnackBar snackBar = SnackBar(content: Text(state.error!));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                if (state.hasData) {
                  SnackBar snackBar =
                      const SnackBar(content: Text('Successfull Operation'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: () {
                      context.read<LoginCubit>().login();
                    },
                    child: state.isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator())
                        : const Text("Login"));
              },
            )
          ],
        ),
      ),
    );
  }
}
