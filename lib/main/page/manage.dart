import 'package:flutter/material.dart';

class ManagePage extends StatelessWidget {
  const ManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Page'),
      ),
      body: const Center(
        child: Text(
          'Welcome to Manage Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
