import 'package:flutter/material.dart';
import 'package:fluttersipay/login_screens/login_main.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SiPay',
      debugShowCheckedModeBanner: false,
      home: MyLoginPage(),
    );
  }
}
