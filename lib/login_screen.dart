// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

final _numberController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PERSONNEL INFORMATION SYSTEM"),
        backgroundColor: Colors.green,
        centerTitle: true,
        toolbarHeight: 75,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        TextFormField(
          controller: _numberController,
          decoration: const InputDecoration(labelText: 'Phone Number'),
        ),
        ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
              fixedSize:
                  MaterialStateProperty.all<Size>(const Size.fromWidth(125)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Login  ", style: TextStyle(color: Colors.white)),
                const Icon(
                  Icons.east,
                  color: Colors.white,
                ),
              ]),
        )
      ]),
    );
  }
}
