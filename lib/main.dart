import 'package:app_mobile_iot/core/widgets/bottom_nav_bar.dart';
import 'package:app_mobile_iot/features/home/presentation/pages/home_page.dart';
import 'package:app_mobile_iot/features/login/app.dart';
import 'package:app_mobile_iot/features/login/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// void main() {
//   runApp(const FalconShieldApp());
// }

// class FalconShieldApp extends StatelessWidget {
//   const FalconShieldApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginScreen(),
//     );
//   }
// }

// void main() {
//   setup();
//   runApp(FalconShieldApp());
// }

// class FalconShieldApp extends StatelessWidget {
//   //const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (_) => NavigationCubit()),
//       ],
//       child: MaterialApp(
//         title: 'FalconShield',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: LoginPage(),
//       ),
//     );
//   }
// }
