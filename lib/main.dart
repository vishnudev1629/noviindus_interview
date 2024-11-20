import 'package:flutter/material.dart';
import 'package:noviindus_interview/UI/screens/home_screen.dart';
import 'package:noviindus_interview/UI/screens/login_screen.dart';
import 'package:noviindus_interview/UI/screens/register_screen.dart';
import 'package:noviindus_interview/UI/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       initialRoute: '/',
        routes: {
          '/': (context) =>  const RegisterScreen(),
          '/login': (context) => const RegisterScreen(),
        }
    );
  }
}

