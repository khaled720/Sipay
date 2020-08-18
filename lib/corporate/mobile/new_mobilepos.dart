import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/dashboard/support.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'continue_newpos.dart';


TextEditingController _SMSController = TextEditingController();

class New_Mobilepos extends StatefulWidget {
  New_Mobilepos({Key key}) : super(key: key);
  @override
  _New_Mobilepos createState() => _New_Mobilepos();
}

class _New_Mobilepos extends State<New_Mobilepos> {
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
                title: Text("MOBILE POS"),
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
                                  
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Live_Support(),
                                          ));
                                    
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
                              "SECURE PURCHASE",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setWidth(40),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Enter your customer's phone number for a secure purchase.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setWidth(120),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "CUSTOMER PHONE NUMBER *",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.number,
                            controller: _SMSController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black12, width: 1.0)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black12, width: 1.0)),
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: Colors.black38,
                              ),
                            ),
                            obscureText: true,
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(100),
                        ),
                        Container(
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Continue_Newpos(),
                              ));
                            },
                            color: Colors.blue,
                            disabledColor: Colors.blue,
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'CONTINUE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          width: ScreenUtil.getInstance().setWidth(660),
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
