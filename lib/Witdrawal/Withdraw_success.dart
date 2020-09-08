import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/dashboard/Live_support.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

Widget Withdraw_success() {
  return Withdraw_success_panel();
}

class Withdraw_success_panel extends StatefulWidget {
  Withdraw_success_panel({Key key}) : super(key: key);
  @override
  _Withdraw_success_panel createState() => _Withdraw_success_panel();
}

class _Withdraw_success_panel extends State<Withdraw_success_panel> {
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
            .loadString('assets/json/Withdrawl/8.7Withdraw_success.json'),
        builder: (context, snapshot) {
   //       With_success_json users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
     //       users = With_success_json.fromJson(parsedJson);
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(translator.translate("withdraw").toUpperCase()),
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
                                  
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Live_Support(),
                                          ));
                                    
                      // do something
                    },
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(50),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: ScreenUtil.getInstance().setHeight(200),
                            ),
                          ),
                          height: ScreenUtil.getInstance().setHeight(200),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(50),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              translator.translate("successful"),
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(100),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                            translator.translate("withdrawSuccessMsg")
                 ,               style: TextStyle(
                                    color: Colors.black45, fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(250),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Container(
                            child: FlatButton(
                              onPressed: () {
                                Navigator.popUntil(
                                    context, ModalRoute.withName('/merchant'));
                              },
                              color: Colors.blue,
                              disabledColor: Colors.blue,
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                             translator.translate("dash"),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            width: ScreenUtil.getInstance().setWidth(690),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }
}

class With_success_json {
  String header;
  String successful;
  String your;
  String button;

  With_success_json({this.header, this.successful, this.your, this.button});

  With_success_json.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    successful = json['successful'];
    your = json['your'];
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['successful'] = this.successful;
    data['your'] = this.your;
    data['button'] = this.button;
    return data;
  }
}
