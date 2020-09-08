import 'dart:convert';
import 'package:fluttersipay/corporate/global_data.dart' as global;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/dashboard/merchant.dart';
import 'package:fluttersipay/dashboard/merchant_panel.dart';
import 'package:fluttersipay/loading_widget.dart';
import 'package:fluttersipay/login_screens/login_repo.dart';
import 'package:fluttersipay/login_screens/providers/sms_verification_provider.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:fluttersipay/utils/custom_text_style.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:quiver/async.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_timer/simple_timer.dart';
//import 'package:timer_builder/timer_builder.dart';
//import 'package:timer_count_down/timer_count_down.dart';
import '../main_api_data_model.dart';
import 'json_models/sms_verification_ui_model.dart';
import 'package:fluttersipay/corporate/datas.dart';
 

class SMSVerificationScreen extends StatefulWidget {
  final MainApiModel loginModel;
  final NavigationToSMSTypes navigationToSMSType;
  final UserTypes userType;

   SMSVerificationScreen(
      this.loginModel, this.navigationToSMSType,{this.userType});

  @override
  SMSVerificationScreenState createState() => SMSVerificationScreenState();
}

class SMSVerificationScreenState extends State<SMSVerificationScreen>
{

static  TimerStatus timerStatus=TimerStatus.start;
Widget timer= SimpleTimer(
          status: timerStatus,
          duration: Duration(seconds: 00,minutes: 3),
          backgroundColor: Colors.white,
          progressIndicatorDirection:TimerProgressIndicatorDirection.clockwise ,
          progressIndicatorColor: Colors.blue,
          progressTextStyle: TextStyle(fontSize: 40,fontWeight: FontWeight.w800,color: Colors.blue[700]),
strokeWidth: 12,

      );




@override
  void initState() {
    // TODO: implement initState
    super.initState();
  

  }
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
    return
      
          Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text(translator.translate("smsverify")),
                  flexibleSpace: Image(
                    image: AssetImage('assets/appbar_bg.png'),
                    height: 100,
                    fit: BoxFit.fitWidth,
                  ),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
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
                body: ChangeNotifierProvider<SMSVerificationProvider>(
                    create: (context) => SMSVerificationProvider(
                        widget.navigationToSMSType,
                        widget.loginModel,
                        LoginRepository(),
                        TextEditingController(),
                        CountdownTimer(
                            Duration(seconds: 180), Duration(seconds: 1))),
                    child: SingleChildScrollView(child: Container(child:
                        Consumer<SMSVerificationProvider>(
                            builder: (context, snapshot, _) {
                      return Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: ScreenUtil.getInstance().setWidth(60),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0, right: 30.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                      translator.translate("verifiyInfo"),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(30),
                              ),
                              Container(
                                  width:
                                      ScreenUtil.getInstance().setHeight(780),
                                  height:
                                      ScreenUtil.getInstance().setHeight(100),
                                  decoration: new BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.black12,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 30.0, right: 30.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                        translator.translate("urPhone"),
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            snapshot.phoneNumber,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(65),
                                    ),
                           Container(

                            width: 150,
      child:timer
  )   ,
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(20),
                                    ),
                                    Text(
                                    translator.translate("remainingTime"),
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                                height: ScreenUtil.getInstance().setHeight(420),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0, right: 30.0),
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.number,
                                  maxLength: 6,
                                  controller: snapshot.smsController,
                                  decoration: InputDecoration(
                                    errorText: snapshot.otpErrorText,
                                    hintStyle:
                                        CustomTextStyle.formField(context),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 1.0)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 1.0)),
                                    prefixIcon: const Icon(
                                      Icons.message,
                                      color: Colors.black38,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(5),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 40),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: FlatButton(
                                    onPressed: () {
              setState(() {
    timer= new SimpleTimer(
          status: timerStatus,
          duration: Duration(seconds: 00,minutes: 3),
          backgroundColor: Colors.white,
          progressIndicatorDirection:TimerProgressIndicatorDirection.clockwise ,
          progressIndicatorColor: Colors.blue,
          progressTextStyle: TextStyle(fontSize: 40,fontWeight: FontWeight.w800,color: Colors.blue[700]),
strokeWidth: 12,
      );
  }); 








                                        snapshot.resendLoginVerificationSMS(
                                          widget.userType, () {}, () {});
                  
                                    },
                                    child: Text(
                              translator.translate("resend"),
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(10),
                              ),
                              Container(
                                child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                        // set the default style for the children TextSpans
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: translator.translate("hint"),//users.byclicks,
                                              style: TextStyle(
                                                  color: Colors.black45)),
                                          TextSpan(
                                              text:translator.translate("Userprivacy"),
                                              style: TextStyle(
                                                  color: Colors.blue)),
                                          TextSpan(
                                              text:translator.translate("and"),
                                              style: TextStyle(
                                                  color: Colors.black45)),
                                          TextSpan(
                                              text: translator.translate("PPplicy"),
                                              style: TextStyle(
                                                  color: Colors.blue)),
                                        ])),
                                width: ScreenUtil.getInstance().setWidth(660),
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(50),
                              ),
                              Container(
                                child: FlatButton(
                                  onPressed: () {
                                    snapshot.verifyLoginSMS(widget.userType,
                                        (MainApiModel userData, token) async {
                                      datas.loginModel = userData;
                                      datas.tokens = token;

                        
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString("token", token).then((value){
                        global.setUserToken();
                        }
                        );


                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) => widget
                                                          .userType ==
                                                      UserTypes.Individual
                                                  ? MerchantPanelScreen(
                                                      userData, token)
                                                  : CorporateMerchantPanelScreen(
                                                      userData, token)),
                                          (route) => false);
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
                                width: ScreenUtil.getInstance().setWidth(690),
                              )
                            ],
                          ),
                          LoadingWidget(
                            isVisible: snapshot.showLoad,
                          )
                        ],
                      );
                            }
                            )
                            )
                            )
                            )
                    );
      
         
  }
}
