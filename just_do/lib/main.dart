import 'package:flutter/material.dart';
import 'package:just_do/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.grey.shade800,
          titleTextStyle: const TextStyle(
            color: Colors.white70,
          ),
        ),
        scaffoldBackgroundColor: Colors.grey.shade200,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 183, 93, 58)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
