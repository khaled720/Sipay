import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/dashboard/support.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'exchange_success.dart';

TextEditingController _SMSController = TextEditingController();

class Exchange_rate extends StatefulWidget {
  Exchange_rate({Key key}) : super(key: key);
  @override
  _Exchange_rate createState() => _Exchange_rate();
}

class _Exchange_rate extends State<Exchange_rate> {
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
                title: Text("SMS VERIFICATION"),
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
                            "CONFIRM RATE",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setWidth(30),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Are you sure to exchange your Turkish Liras into Euros?",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
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
                                  "Sold",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '-1800, 00₺',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                                  "In return",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '+280,00€',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                                  "Exchange Rate",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '-6,5541',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(80),
                            ),
                            Image.asset(
                              'assets/down_time.png',
                              height: ScreenUtil.getInstance().setHeight(170),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(30),
                            ),
                            Text(
                              "Remaning time to ocntinue with the current\n rate",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                        height: ScreenUtil.getInstance().setHeight(380),
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(50),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 33.0, right: 30.0),
                            child: Container(
                              child: OutlineButton(
                                onPressed: () {
                                },
                                borderSide: BorderSide(
                                  color: Colors.black26, //Color of the border
                                  style: BorderStyle.solid, //Style of the border
                                  width: 0.8, //width of the border
                                ),
                                color: Colors.white,
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  "REFRESH",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              width: ScreenUtil.getInstance().setWidth(290),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0.0, right: 30.0),
                            child: Container(
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (context) => Exchange_success(),
                                      ));
                                },
                                color: Colors.blue,
                                disabledColor: Colors.blue,
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  "CONFIRM",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              width: ScreenUtil.getInstance().setWidth(290),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(40),
                      ),
                    ],
                  ),
                )),
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
