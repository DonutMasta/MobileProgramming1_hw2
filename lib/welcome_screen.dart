import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String name;
  const WelcomeScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PERSONNEL INFORMATION SYSTEM"),
        backgroundColor: Colors.green,
        centerTitle: true,
        toolbarHeight: 75,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            "Welcome $name!",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 60, color: Colors.grey),
          ),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
