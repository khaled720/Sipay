import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/utils/custom_text_style.dart';

TextEditingController smsController = TextEditingController();

class SMSUserVerificationScreen extends StatefulWidget {
  SMSUserVerificationScreen({Key key}) : super(key: key);
  @override
  SMSUserVerificationScreenState createState() => SMSUserVerificationScreenState();
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
          SMSVerifyModel users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
            users = SMSVerifyModel.fromJson(parsedJson);
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(users.header),
                flexibleSpace: Image(
                  image: AssetImage('assets/appbar_bg.png'),
                  height: 100,
                  fit: BoxFit.fitWidth,
                ),
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
              body: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: ScreenUtil.getInstance().setWidth(60),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'SMS İLE DOĞRULAMA',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setWidth(50),
                        ),
                        Container(
                          child: Text(
                            users.byclick,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black45,
                            ),
                          ),
                          width: ScreenUtil.getInstance().setWidth(690),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(10),
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
                                    text: users.privacy,
                                    style: TextStyle(color: Colors.blue)),
                                TextSpan(
                                    text: ' & ',
                                    style: TextStyle(color: Colors.black45)),
                                TextSpan(
                                    text: users.privacys,
                                    style: TextStyle(color: Colors.blue)),
                              ])),
                          width: ScreenUtil.getInstance().setWidth(690),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(100),
                              ),
                              Image.asset(
                                'assets/down_time.png',
                                height: ScreenUtil.getInstance().setHeight(150),
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(80),
                              ),
                              Text(
                                users.remain,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          height: ScreenUtil.getInstance().setHeight(450),
                        ),
                        TextField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,
                          controller: smsController,
                          decoration: InputDecoration(
                            hintStyle: CustomTextStyle.formField(context),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 1.0)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 1.0)),
                            prefixIcon: const Icon(
                              Icons.message,
                              color: Colors.black38,
                            ),
                          ),
                          obscureText: false,
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
                                          Navigator.popUntil(context,
                                              ModalRoute.withName('/'));
                                        },
                                        child: Text(
                                          users.resend,
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
                                      users.already,
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
                                      Navigator.popUntil(
                                          context, ModalRoute.withName('/'));
                                    },
                                    child: Text(
                                      users.login,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                height: ScreenUtil.getInstance().setHeight(40),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(60),
                        ),
                        Container(
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/userverification');
                            },
                            color: Colors.blue,
                            disabledColor: Colors.blue,
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              users.button,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          width: ScreenUtil.getInstance().setWidth(690),
                        )
                      ],
                    )),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }
}

class SMSVerifyModel {
  String header;
  String smsVerification;
  String byclick;
  String privacy;
  String and;
  String privacys;
  String remain;
  String resend;
  String already;
  String login;
  String button;

  SMSVerifyModel(
      {this.header,
      this.smsVerification,
      this.byclick,
      this.privacy,
      this.and,
      this.privacys,
      this.remain,
      this.resend,
      this.already,
      this.login,
      this.button});

  SMSVerifyModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    smsVerification = json['sms_verification'];
    byclick = json['byclick'];
    privacy = json['privacy'];
    and = json['and'];
    privacys = json['privacys'];
    remain = json['remain'];
    resend = json['Resend'];
    already = json['already'];
    login = json['login'];
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['sms_verification'] = this.smsVerification;
    data['byclick'] = this.byclick;
    data['privacy'] = this.privacy;
    data['and'] = this.and;
    data['privacys'] = this.privacys;
    data['remain'] = this.remain;
    data['Resend'] = this.resend;
    data['already'] = this.already;
    data['login'] = this.login;
    data['button'] = this.button;
    return data;
  }
}
