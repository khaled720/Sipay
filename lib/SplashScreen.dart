import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screens/login_main.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  Animatable<Color> back_title = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 1,
      tween: ColorTween(
        begin: Colors.black,
        end: Colors.white,
      ),
    ),
  ]);

  Animatable<Color> background = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 1,
      tween: ColorTween(
        begin: Colors.white,
        end: Colors.blue,
      ),
    ),
  ]);


  var _visible = true;

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 2),
    );
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context)=> MyLoginPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ColorFiltered(
          child: Image.asset("assets/splash/Splash.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          colorFilter: ColorFilter.mode(background
              .evaluate(AlwaysStoppedAnimation(animationController.value)), BlendMode.color),
        ),
        Center(
          child: new Image.asset(
            'assets/splash/logo.png',
            width: animation.value * 250,
            height: animation.value * 250,
            color:  back_title
                .evaluate(AlwaysStoppedAnimation(animationController.value)),
          ),
        )
      ],
    );
  }
}