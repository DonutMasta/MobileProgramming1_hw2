import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _textController = TextEditingController();

final counterProvider = StateProvider((ref) => 20);

class Countdown extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Text(count.toString());
  }
}

void _timer(WidgetRef ref) {
  final timer = Timer.periodic(Duration(seconds: 1), (timer) {
    ref.read(counterProvider.notifier).state--;
  });
}

class SmsScreen extends StatefulWidget {
  final String number;

  const SmsScreen({
    super.key,
    required this.number,
  });

  @override
  State<SmsScreen> createState() => _SmsScreenState();
}

class _SmsScreenState extends State<SmsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PERSONNEL INFORMATION SYSTEM"),
        backgroundColor: Colors.green,
        centerTitle: true,
        toolbarHeight: 75,
      ),
      body: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 3,
          ),
          SizedBox(
            width: 250,
            child: Text(
                "Please enter the verification code sent to your mobile phone number with ${widget.number} ",
                textAlign: TextAlign.center),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.alarm), Countdown()],
          ),
          Spacer(),
          Expanded(
            child: SizedBox(
              width: 350,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _textController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  labelText: 'SMS Code',
                ),
              ),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          ElevatedButton(
            onPressed: null,
            style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(Size(125, 30)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Continue  ",
                      style: TextStyle(color: Colors.white)),
                ]),
          ),
          Spacer(
            flex: 4,
          )
        ],
      )),
    );
  }
}
