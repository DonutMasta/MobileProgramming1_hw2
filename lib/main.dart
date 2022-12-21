import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileprograminghw2/sms_screen.dart';

import 'login_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: LoginScreen(),
     );
  }

}
