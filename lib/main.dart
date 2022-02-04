import 'package:dev_todo/screens/home/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {'/': (context) => HomeScreen()},
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(color: Colors.black),
            brightness: Brightness.dark));
  }
}
