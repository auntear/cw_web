import 'package:flutter/material.dart';
import 'package:my_cw_web/main/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IndexPage(),
    );
  }
}
