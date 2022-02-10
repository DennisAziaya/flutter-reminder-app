import 'package:dev_todo/screens/home/HomeScreen.dart';
import 'package:dev_todo/screens/lists/add_list.dart';
import 'package:dev_todo/screens/reminder/add_reminder_screen.dart';
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
      routes: {
        '/': (context) => HomeScreen(),
        '/addList': (context) => const AddList(),
        '/reminder': (context) => const ReminderScreen()
      },
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.white),
          brightness: Brightness.dark,
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            primary: Colors.blueAccent,
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          dividerColor: Colors.grey[600]),
    );
  }
}
