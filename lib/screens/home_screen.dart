import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.black.withOpacity(0.8),
        foregroundColor: Colors.yellow.shade800,
        title: const Text(
          "Shadowing Webtoon App",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
