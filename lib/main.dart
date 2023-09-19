import 'package:flutter/material.dart';
import 'package:produckts/screens/launch_screen/launch_screen.dart';
import 'package:produckts/screens/main_screen/main_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/launch',
      routes: {
        '/launch': (context) => LaunchScreen(),
        '/main': (context) => MainScreen(),
      },
    );
  }
}
