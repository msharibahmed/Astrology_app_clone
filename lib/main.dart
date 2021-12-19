import 'package:flutter/material.dart';
import 'package:india_today_assignment/screens/home_screen.dart';
import 'package:india_today_assignment/utils/theme.dart';

void main() {
  statusBarTheme();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
