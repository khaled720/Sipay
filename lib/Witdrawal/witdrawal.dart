import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/bottom_navigator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'create_withdraw.dart';


Widget Witdrawal() {
  return WitdrawalPanel();
}

class WitdrawalPanel extends StatefulWidget {
  WitdrawalPanel({Key key}) : super(key: key);
  @override
  _WitdrawalPanel createState() => _WitdrawalPanel();
}

class _WitdrawalPanel extends State<WitdrawalPanel> {
  int _index = 0;
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
            .loadString('assets/json/Withdrawl/8.5Withdraw.json'),
        builder: (context, snapshot) {
          withdrw_json users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
            users = withdrw_json.fromJson(parsedJson);
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
                body: Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(50),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: Text(
                              users.abailable,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(50),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    decoration: new BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: Colors.black54,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        users.abailableBalances[0] + '₺',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16),
                                      ),
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: new BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: Colors.black54,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        users.abailableBalances[1] +"\$",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16),
                                      ),
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      users.abailableBalances[2] + '€',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 16),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(50),
                                ),
                                Container(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Image.asset('assets/withdraw.png'),
                                  ),
                                  height:
                                      ScreenUtil.getInstance().setHeight(450),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(20),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: FlatButton(
                                    onPressed: () {
                                      Create_withdraw(0);
                                    },
                                    child: Text(
                                      users.howto,
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(10),
                                ),
                                Container(
                                  child: FlatButton(
                                    onPressed: () {
                                      Create_withdraw(1);
                                    },
                                    color: Colors.blue,
                                    disabledColor: Colors.blue,
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      users.button[0],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  width: ScreenUtil.getInstance().setWidth(690),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(30),
                                ),
                                Container(
                                  child: FlatButton(
                                    onPressed: () {},
                                    color: Colors.blue,
                                    disabledColor: Colors.blue,
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      users.button[1],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  width: ScreenUtil.getInstance().setWidth(690),
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    getCustomNavigator(context, users.footerTab, 2),
                  ],
                ));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }

  void Create_withdraw(int data) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Create_withdraws(data),
        ));
  }
}

class withdrw_json {
  String header;
  String abailable;
  List<String> abailableBalances;
  String howto;
  List<String> button;
  List<String> footerTab;

  withdrw_json(
      {this.header,
      this.abailable,
      this.abailableBalances,
      this.howto,
      this.button,
      this.footerTab});

  withdrw_json.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    abailable = json['abailable'];
    abailableBalances = json['abailable_balances'].cast<String>();
    howto = json['howto'];
    button = json['button'].cast<String>();
    footerTab = json['footer_tab'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['abailable'] = this.abailable;
    data['abailable_balances'] = this.abailableBalances;
    data['howto'] = this.howto;
    data['button'] = this.button;
    data['footer_tab'] = this.footerTab;
    return data;
  }
}
