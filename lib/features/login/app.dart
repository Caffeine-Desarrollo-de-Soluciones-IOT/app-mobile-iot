import 'package:app_mobile_iot/features/login/cubits/cubit/login_cubit.dart';
import 'package:app_mobile_iot/features/login/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.teal),
      home: BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginScreen(),
      ),
    );
  }
}
