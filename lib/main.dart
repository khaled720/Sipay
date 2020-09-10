import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'SplashScreen.dart';

void main()async{

  WidgetsFlutterBinding.ensureInitialized();

LIST_OF_LANGS = ["en","tr"];
LANGS_DIR = 'assets/langs/';
await translator.init();



 runApp(
    LocalizedApp(
      child: Main(),
    ),
  );



}

class Main extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      title: 'SiPay',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      localizationsDelegates: translator.delegates,
      locale: translator.locale,
      supportedLocales: translator.locals(),

    );
  }}









/*
rajibcuetcse@gmail.com
Nop@ss1234
 */