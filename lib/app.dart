import 'package:app_mobile_iot/features/areas/presentation/pages/areas_page.dart';
import 'package:app_mobile_iot/features/devices/presentation/pages/device_detail_page.dart';
import 'package:app_mobile_iot/features/home/presentation/pages/home_page.dart';
import 'package:app_mobile_iot/features/login/cubits/cubit/login_cubit.dart';
import 'package:app_mobile_iot/features/login/screens/login_screen.dart';
import 'package:app_mobile_iot/features/notifications/presentation/pages/notifications_page.dart';
import 'package:app_mobile_iot/features/profile/presentation/pages/profile_page.dart';
import 'package:app_mobile_iot/features/properties/presentation/pages/properties_page.dart';
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
        child: const LoginPage(),
      ),
      // debugShowCheckedModeBanner: false,
      // home: const LoginPage(),
    );
  }
}
