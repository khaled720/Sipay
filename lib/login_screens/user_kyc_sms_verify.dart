import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/loading_widget.dart';
import 'package:fluttersipay/login_screens/kyc_verification.dart';
import 'package:fluttersipay/login_screens/login_repo.dart';
import 'package:fluttersipay/login_screens/providers/sms_verification_provider.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:fluttersipay/utils/custom_text_style.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:quiver/async.dart';
import 'package:simple_timer/simple_timer.dart';

import 'json_models/sms_user_verification_ui_model.dart';

class SMSUserVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  SMSUserVerificationScreen(this.phoneNumber);

  @override
  SMSUserVerificationScreenState createState() =>
      SMSUserVerificationScreenState();
}

class SMSUserVerificationScreenState extends State<SMSUserVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1304, allowFontScaling: true)
          ..init(context);
    return new FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(
            'assets/json/register/2.3registerSMSverification2.json'),
        builder: (context, snapshot) {
      
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  
translator.translate("smsverify")

                ),
                flexibleSpace: Image(
                  image: AssetImage('assets/appbar_bg.png'),
                  height: 100,
                  fit: BoxFit.fitWidth,
                ),


                /*
                
                "header": "SMS VERIFICATION",
	"enter": "Enter the SMS verification code you received on your phone.",
	"your": "Your phone number",
	"remain": "Remaining time to enter your code",
	"resend": "Resend the code",
	"byclick": "By clicking the Verify button, you are deemed to have read and accepted the",
	"user": "User Privacy",
	"state": "Statement",
	"and": "and the",
	"privacy": "Privacy Policy",
	"button": "VERIFY"
                 */
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
                actions: <Widget>[
                  IconButton(
                    padding: const EdgeInsets.only(right: 20.0),
                    icon: Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // do something
                    },
                  )
                ],
              ),
              body: ChangeNotifierProvider(
                  create: (context) => SMSVerificationProvider(
                      null,
                      null,
                      LoginRepository(),
                      TextEditingController(),
                      CountdownTimer(
                          Duration(seconds: 180), Duration(seconds: 1))),
                  child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Consumer<SMSVerificationProvider>(
                            builder: (context, snapshot, _) {
                          return Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setWidth(60),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                              
translator.translate("smsverify"),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setWidth(50),
                                  ),
                                  Container(
                                    child: Text(
                                  
translator.translate("hint"),
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    width:
                                        ScreenUtil.getInstance().setWidth(690),
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(10),
                                  ),
                                  Container(
                                    child: RichText(
                                        text: TextSpan(
                                            // set the default style for the children TextSpans
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                            children: [
                                          TextSpan(
                                              text:
translator.translate("Userprivacy"),
                                              style: TextStyle(
                                                  color: Colors.blue)),
                                          TextSpan(
                                              text: 
translator.translate("and"),
                                              style: TextStyle(
                                                  color: Colors.black45)),
                                          TextSpan(
                                              text: 
translator.translate("PPplicy"),
                                              style: TextStyle(
                                                  color: Colors.blue)),
                                        ])),
                                    width:
                                        ScreenUtil.getInstance().setWidth(690),
                                  ),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: ScreenUtil.getInstance()
                                              .setHeight(100),
                                        ),
//                                        Image.asset(
//                                          'assets/down_time.png',
//                                          height: ScreenUtil.getInstance()
//                                              .setHeight(150),
//                                        ),
                               

  
             Container(width: 150,
             height: 150,
               child: SimpleTimer(
          status: TimerStatus.start,
          duration: Duration(seconds: 00,minutes: 3),
          backgroundColor: Colors.white,
          progressIndicatorDirection:TimerProgressIndicatorDirection.clockwise ,
          progressIndicatorColor: Colors.blue,
          progressTextStyle: TextStyle(fontSize: 40,fontWeight: FontWeight.w800,color: Colors.blue[700]),
strokeWidth: 12,

      ),
             ),










                               ///////////////////////////////
                                        SizedBox(
                                          height: ScreenUtil.getInstance()
                                              .setHeight(80),
                                        ),
                                        Text(
                                       
translator.translate("remainingTime")
                                       ,   style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ],
                                    ),
                                    height:
                                        ScreenUtil.getInstance().setHeight(450),
                                  ),
                                  TextField(
                                    style: TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.number,
                                    controller: snapshot.smsController,
                                    decoration: InputDecoration(
                                      hintStyle:
                                          CustomTextStyle.formField(context),
                                      errorText: snapshot.otpErrorText,
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black45,
                                              width: 1.0)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black45,
                                              width: 1.0)),
                                      prefixIcon: const Icon(
                                        Icons.message,
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: FlatButton(
                                                  onPressed: () {
                                                    snapshot
                                                        .resendRegisterUserVerifySMS(
                                                            widget.phoneNumber,
                                                            () {},
                                                            () {});
                                                  },
                                                  child: Text(
                                                  translator.translate("resend"),
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                "",
                                                style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: FlatButton(
                                              onPressed: () {
                                                Navigator.of(context).popUntil(
                                                    (route) => route.isFirst);
                                              },
                                              child: Text(
                                               translator.translate("login"),
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                          height: ScreenUtil.getInstance()
                                              .setHeight(40),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(60),
                                  ),
                                  Container(
                                    child: FlatButton(
                                      onPressed: () {
                                        snapshot.verifyUserRegisterSMS(
                                            widget.phoneNumber, (registerData) {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      KYCUserVerificationScreen(
                                                          registerData)));
                                        }, () {});
                                      },
                                      color: Colors.blue,
                                      disabledColor: Colors.blue,
                                      padding: EdgeInsets.all(15.0),
                                      child: Text(
                                       translator.translate("verify"),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    width:
                                        ScreenUtil.getInstance().setWidth(690),
                                  )
                                ],
                              ),
                              LoadingWidget(isVisible: snapshot.showLoad)
                            ],
                          );
                        })),
                  )),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }
}
