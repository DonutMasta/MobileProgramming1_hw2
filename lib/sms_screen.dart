

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileprograminghw2/welcome_screen.dart';

final _numberController = TextEditingController();
final counterProvider = StateProvider((ref) => 20);
final timeEndProvider = StateProvider(((ref) => false));
final codeLengthProvider = StateProvider(((ref) => 0));
final isApprovedProvider = StateProvider(((ref) => false));
late Timer timer;

class SmsScreen extends ConsumerWidget {
  final String number;

  const SmsScreen({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _timer(ref);
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
          const Spacer(
            flex: 3,
          ),
          SizedBox(
            width: 250,
            child: Text(
                "Please enter the verification code sent to your mobile phone number with $number ",
                textAlign: TextAlign.center),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [TimeEnd(), Countdown()],
          ),
          const Spacer(),
          const Expanded(
            flex: 2,
            child: TextBox(),
          ),
          const Spacer(
            flex: 2,
          ),
          const SmsButton(),
          const Spacer(
            flex: 4,
          )
        ],
      )),
    );
  }
}

void _timer(WidgetRef ref) {
  timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    ref.read(counterProvider.notifier).state--;
    if (ref.read(counterProvider.notifier).state == 0) {
      ref.read(timeEndProvider.notifier).state = true;
      timer.cancel();
    } else {
      ref.read(timeEndProvider.notifier).state = false;
    }
  });
}

class Countdown extends ConsumerWidget {
  const Countdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Text(
      count.toString(),
      style: TextStyle(
          color: ref.watch(timeEndProvider) ? Colors.red : Colors.black),
    );
  }
}

class TimeEnd extends ConsumerWidget {
  const TimeEnd({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeEnd = ref.watch(timeEndProvider);
    return Icon(
      Icons.alarm,
      color: timeEnd ? Colors.red : Colors.black,
    );
  }
}

void _buttonHandler(
    BuildContext context, WidgetRef ref, bool timeEnd, bool isApproved) {
  if (timeEnd == true) {
    ref.read(counterProvider.notifier).state = 20;
    ref.read(timeEndProvider.notifier).state = false;

    _timer(ref);
  } else if (isApproved == true) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const WelcomeScreen(name: "Özgür Özşen")));
    timer.cancel();
  }
}

class SmsButton extends ConsumerWidget {
  const SmsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeEnd = ref.watch(timeEndProvider);
    final isApproved = ref.watch(isApprovedProvider);
    return ElevatedButton(
      onPressed: isApproved
          ? (() => _buttonHandler(context, ref, timeEnd, isApproved))
          : (timeEnd
              ? (() => _buttonHandler(context, ref, timeEnd, isApproved))
              : null),
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(const Size(125, 30)),
          backgroundColor: MaterialStateProperty.all<Color>(
              ((timeEnd || isApproved)) ? Colors.black : Colors.grey),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ))),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Text(timeEnd ? "Resend" : "Continue  ",
            style: const TextStyle(color: Colors.white)),
      ]),
    );
  }
}

class TextBox extends ConsumerWidget {
  const TextBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: SizedBox(
            width: 350,
            child: TextFormField(
              maxLength: 6,
              onChanged: (text) => {
                ref.read(codeLengthProvider.notifier).state = text.length,
                if (text.length == 6)
                  {ref.read(isApprovedProvider.notifier).state = true}
                else
                  {ref.read(isApprovedProvider.notifier).state = false}
              },
              keyboardType: TextInputType.number,
              controller: _numberController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ref.watch(codeLengthProvider) == 0
                              ? Colors.grey
                              : (ref.watch(isApprovedProvider)
                                  ? Colors.green
                                  : Colors.red))),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  labelText: 'SMS Code',
                  labelStyle: TextStyle(
                      color: ref.watch(codeLengthProvider) == 0
                          ? Colors.grey
                          : (ref.watch(isApprovedProvider)
                              ? Colors.green
                              : Colors.red))),
            ),
          ),
        ),
      ],
    );
  }
}
