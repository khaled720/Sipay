import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Login/SMS_userverify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'login_main.dart';

TextEditingController _SMSController = TextEditingController();
Widget SMSUSERVERIFICAION() {
  return Verification();
}

class Verification extends StatefulWidget {
  Verification({Key key}) : super(key: key);
  @override
  _sms_verification createState() => _sms_verification();
}

class _sms_verification extends State<Verification> {
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
            .loadString('assets/json/register/2.3registerSMSverification1.json'),
        builder: (context, snapshot) {
          sms_verification users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
            users = sms_verification.fromJson(parsedJson);
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
                child: Container(
                    child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil.getInstance().setWidth(60),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          users.enter,
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
                        width: ScreenUtil.getInstance().setHeight(780),
                        height: ScreenUtil.getInstance().setHeight(100),
                        decoration: new BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black12,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  users.your,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '+90 555 892 3116',
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
                            height: ScreenUtil.getInstance().setHeight(100),
                          ),
                          Image.asset(
                            'assets/down_time.png',
                            height: ScreenUtil.getInstance().setHeight(150),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(60),
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
                      height: ScreenUtil.getInstance().setHeight(380),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.number,
                        controller: _SMSController,
                        decoration: InputDecoration(
                          hintStyle: CustomTextStyle.formField(context),
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
                        obscureText: false,
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(10),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            users.resend,
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
                                    text:
                                        users.byclicks,
                                    style: TextStyle(color: Colors.black45)),
                                TextSpan(
                                    text: users.user,
                                    style: TextStyle(color: Colors.blue)),
                                TextSpan(
                                    text: users.and,
                                    style: TextStyle(color: Colors.black45)),
                                TextSpan(
                                    text: users.privacy,
                                    style: TextStyle(color: Colors.blue)),
                              ])),
                      width: ScreenUtil.getInstance().setWidth(660),
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(50),
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/verify');
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

class sms_verification {
  String header;
  String enter;
  String your;
  String remain;
  String resend;
  String byclicks;
  String user;
  String state;
  String and;
  String privacy;
  String button;

  sms_verification(
      {this.header,
      this.enter,
      this.your,
      this.remain,
      this.resend,
      this.byclicks,
      this.user,
      this.state,
      this.and,
      this.privacy,
      this.button});

  sms_verification.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    enter = json['enter'];
    your = json['your'];
    remain = json['remain'];
    resend = json['resend'];
    byclicks = json['byclick'];
    user = json['user'];
    state = json['state'];
    and = json['and'];
    privacy = json['privacy'];
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['enter'] = this.enter;
    data['your'] = this.your;
    data['remain'] = this.remain;
    data['resend'] = this.resend;
    data['byclick'] = this.byclicks;
    data['user'] = this.user;
    data['state'] = this.state;
    data['and'] = this.and;
    data['privacy'] = this.privacy;
    data['button'] = this.button;
    return data;
  }
}
