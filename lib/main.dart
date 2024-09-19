import 'package:click_teste2/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme:
          ThemeData.dark().copyWith(primaryColor: Colors.purpleAccent.shade700),
    );
  }
}
