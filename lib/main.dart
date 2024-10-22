import 'package:app_mobile_iot/dependencies/injection.dart';
import 'package:app_mobile_iot/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  setup();
  runApp(FalconShieldApp());
}

class FalconShieldApp extends StatelessWidget {
  //const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FalconShield',
      //theme: AppTheme.lightTheme,
      home: LoginPage(),
    );
  }
}
