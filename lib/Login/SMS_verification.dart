import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Login/login_verification.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'login_main.dart';

TextEditingController _SMSController = TextEditingController();
Widget SMSVERIFICAION() {
  return Verify();
}

class Verify extends StatefulWidget {
  Verify({Key key}) : super(key: key);
  @override
  _sms_verify createState() => _sms_verify();
}

class _sms_verify extends State<Verify> {




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
        future: DefaultAssetBundle.of(context)
            .loadString('assets/json/register/2.3registerSMSverification2.json'),
        builder: (context, snapshot){
          sms_verify users;
          var parsedJson;
          if (snapshot.hasData){
            parsedJson = json.decode(snapshot.data.toString());
            users = sms_verify.fromJson(parsedJson);
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
                        Navigator.pop(
                            context
                        );
                      },
                    );
                  },
                ),
                actions: <Widget>[
                  IconButton(
                    padding: const EdgeInsets.only(right: 20.0),
                    icon: Icon(
                      FontAwesomeIcons.commentAlt,
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
                            'SMS VERIFICATION',
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
                           "Enter the verification code you received on your phone.",
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
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(100),
                              ),
                              Image.asset('assets/down_time.png',
                                height: ScreenUtil.getInstance().setHeight(170),),
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
                          height: ScreenUtil.getInstance().setHeight(430),
                        ),
                        TextField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,
                          controller: _SMSController,
                          decoration: InputDecoration(
                            hintStyle: CustomTextStyle.formField(context),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black45, width: 1.0)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black45, width: 1.0)),
                            prefixIcon: const Icon(
                              Icons.message,
                              color: Colors.black38,
                            ),
                          ),
                          obscureText: false,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(30),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: FlatButton(
                                        onPressed: (){
                                          Navigator.popUntil(context, ModalRoute.withName('/'));
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
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(60),
                        ),
                        Container(
                          child: FlatButton(
                            onPressed: (){
                              Navigator.pushNamed(context, '/merchant');
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
                    )
                ),
              ),
            );
          } else if (snapshot.hasError){
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();

        });
  }
}
class sms_verify {
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

  sms_verify(
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

  sms_verify.fromJson(Map<String, dynamic> json) {
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