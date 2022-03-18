import 'package:flutter/material.dart';
import 'breeding/my_breeding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breeding',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyBreeding(title: 'Breeding'),
    );
  }
}