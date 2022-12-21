// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileprograminghw2/sms_screen.dart';
import 'package:mobileprograminghw2/welcome_screen.dart';


final _numberController = TextEditingController();
final isFocusedProvider = StateProvider(((ref) => false));

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
        Spacer(
          flex: 2,
        ),
        Expanded(
          child: SizedBox(
            width: 350,
            child: FormField(),
          ),
        ),
        Spacer(),
        ElevatedButton(
          onPressed:(() =>{ Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  SmsScreen(number: _numberController.text)))}) ,
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(Size(125, 30)),
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
        ),
        Spacer(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 1,
                color: Color.fromARGB(111, 158, 158, 158),
              ),
              Text("        OR        "),
              Container(
                width: 120,
                height: 1,
                color: Color.fromARGB(111, 158, 158, 158),
              )
            ],
          ),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeScreen(name: "Guest")));
          },
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(Size(200, 30)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black)))),
          child: Text(
            "Continue without login",
            style: TextStyle(color: Color.fromARGB(176, 0, 101, 168)),
          ),
        ),
        Spacer(
          flex: 3,
        )
      ]),
    );
  }
}

class FormField extends ConsumerWidget {
  const FormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var isFocused = ref.watch(isFocusedProvider);
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: _numberController,
      decoration:  InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)),
        labelText: 'Phone Number',
        labelStyle: TextStyle(color: (isFocused ==true )? Colors.green : Colors.grey)
      
      ),onTap: () => {ref.read(isFocusedProvider.notifier).state = !ref.read(isFocusedProvider.notifier).state},
    );
  }
}
