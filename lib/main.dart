import 'package:flutter/material.dart';
import 'package:test_screens/screens/forgot_password_screen.dart';
import 'package:test_screens/screens/login_screen.dart';
import 'package:test_screens/screens/register_screen.dart';
import 'package:test_screens/screens/reset_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        initialRoute: '/login',
      routes: {
          '/login': (context)=>const LoginScreen(),
          '/register': (context)=>const RegisterScreen(),
          '/forgotPassword': (context)=>const ForgotPassword(),
          '/resetPassword': (context)=> const ResetPassword()

      },
    );
  }
}
