import 'package:flutter/material.dart';
import 'package:todo/pantalla.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App with Streams',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoScreen(),
    );
  }
}
