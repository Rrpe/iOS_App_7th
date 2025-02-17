import 'package:flutter/material.dart';
import 'package:list_navigation/tab_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.amber,
          indicatorColor: Colors.amber,
        ),
      ),
      home: TabDemo(),
    );
  }
}
