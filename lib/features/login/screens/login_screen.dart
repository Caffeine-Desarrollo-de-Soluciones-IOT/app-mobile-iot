// import 'package:app_mobile_iot/features/login/cubits/cubit/login_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).requestFocus(FocusNode());
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Login Screen"),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "Login",
//               style: TextStyle(fontSize: 24),
//             ),
//             Form(
//               key: context.read<LoginCubit>().formKey,
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       autofocus: true,
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       controller: context.read<LoginCubit>().emailController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Please enter your email!";
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         hintText: "Email",
//                         hintStyle: const TextStyle(fontSize: 12),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     TextFormField(
//                       autofocus: true,
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       controller: context.read<LoginCubit>().passwordController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Please enter your password!";
//                         }
//                         return null;
//                       },
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         hintText: "Password",
//                         hintStyle: const TextStyle(fontSize: 12),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             BlocConsumer<LoginCubit, LoginState>(
//               listener: (context, state) {
//                 if (state.hasError) {
//                   SnackBar snackBar = SnackBar(content: Text(state.error!));
//                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                 }
//                 if (state.hasData) {
//                   SnackBar snackBar =
//                       const SnackBar(content: Text('Successfull Operation'));
//                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                 }
//               },
//               builder: (context, state) {
//                 return ElevatedButton(
//                   onPressed: () {
//                     context.read<LoginCubit>().login();
//                   },
//                   child: state.isLoading
//                       ? const SizedBox(
//                           width: 20,
//                           height: 20,
//                           child: CircularProgressIndicator(),
//                         )
//                       : const Text("Login"),
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:app_mobile_iot/features/login/screens/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:app_mobile_iot/features/home/presentation/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await _authService.login();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al iniciar sesión: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Falcon Shield',
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _login,
                child: _isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.black,
                      )
                    : const Text('Iniciar Sesión'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
