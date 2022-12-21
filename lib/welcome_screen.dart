
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
      ),body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Spacer(),
          Text("Welcome $name!",textAlign: TextAlign.center,style: TextStyle(fontSize: 60, color: Colors.grey ),),Spacer(flex: 2,)
        ],
      ),
    );
  }
}
