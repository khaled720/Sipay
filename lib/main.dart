import 'package:flutter/material.dart';

import 'SplashScreen.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SiPay',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
