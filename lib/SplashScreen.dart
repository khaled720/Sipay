import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttersipay/corporate/dashboard/merchant.dart';
import 'package:fluttersipay/corporate/dashboard/merchant_repo.dart';
import 'package:fluttersipay/corporate/dashboard/providers/merchant_panel_dashboard_provider.dart';
import 'package:fluttersipay/dashboard/merchant_panel.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screens/dummyScreen.dart';
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

var remem,email="",pass="",phone="",type,passCor="";

fun()async{


 SharedPreferences.getInstance().then((prefs) {

setState(() {
  remem = prefs.getBool("remember");
 // type = prefs.getBool("type");

});

//individual
if(remem==true){
phone=prefs.getString("phone");
email=prefs.getString("email");
pass=prefs.getString("pass");
pass=prefs.getString("passCor");
}
print("!!!!!!!!!!!!!!!!!!!!!!!"+remem.toString());
 });

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


    fun();
  }

  startTime() async {
    var _duration = new Duration(seconds: 8);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async{
  
/*   SharedPreferences prefs=await SharedPreferences.getInstance();
 
if(/* prefs.getBool("remember")==true */1==0){  
  MerchantMainRepository objj;
  MerchantPanelProvider obj;  
  MainApiModel userData;
  
objj=new MerchantMainRepository(prefs.getString("token").toString()); 

//obj.setValues(objj, userData);
  var dat= prefs.getString("data");
 var data=json.decode(dat.toString());
userData=new MainApiModel(int.parse(prefs.getString("code").toString())
, prefs.getString("desc"), dat);
obj =new MerchantPanelProvider( objj, userData);




here is a list of requirments for sprint 4
-filter transaction Api & transaction list
-chargeback history Api
- payment method settings and dpl settings Apis
-deposit by credit card Api
-bank account editing Api
- send email/sms  after withdraw & deposit APIs





print(data.toString());



                                      Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRoute(
                                              builder: (context) =>
                                              prefs.getBool("type")==true
                                                  ? MerchantPanelScreen(
                                userData, prefs.getString("token"))
                                                  : CorporateMerchantPanelScreen(
                                                      userData,  prefs.getString("token"))),
                                          (route) => false);

}else{





 */
if(remem==null)remem=false;pass="";passCor="";phone="";
if(type==null)type=false;
print(this.remem.toString()+"--1--"+this.email.toString()+"--2--"+this.pass.toString()+"--3--"+this.phone.toString()+"--4--"+this.type.toString());
  
 
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context)=> MyLoginPage(this.remem,this.email,this.pass,
      this.phone,this.type,this.passCor),
     )); /*
         Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context)=> dummy(),
     ));
*/
 /* 
}
 
  */
 
  


  
  
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