import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Deposit/create_deposit_card.dart';
import 'package:fluttersipay/bottom_navigator.dart';

import 'create_deposit_transfer.dart';

List<String> _listViewData;

class DepositPanelScreen extends StatefulWidget {
  DepositPanelScreen({Key key}) : super(key: key);
  @override
  DepositPanelScreenState createState() => DepositPanelScreenState();
}

class DepositPanelScreenState extends State<DepositPanelScreen> {
  var _value;
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
            .loadString('assets/json/deposit/6.1DepositMethod.json'),
        builder: (context, snapshot) {
          DepositPanelModel users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
            users = DepositPanelModel.fromJson(parsedJson);
            if (_value == null) _value = users.method[0];
            _listViewData = users.method;
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
                              users.available,
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
                                        users.availableBalances[0] + '৳',
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
                                        users.availableBalances[1] + "\$",
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
                                      users.availableBalances[2] + '€',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 16),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(100),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  users.deposit,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(50),
                                ),
                                Text(
                                  users.choose,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                DropdownButton<String>(
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  items: users.method
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Icon(Icons.note),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Text(
                                              value,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value;
                                    });
                                  },
                                  value: _value,
                                  isExpanded: true,
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(30),
                                ),
                                Container(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Image.asset('assets/deposit.png'),
                                  ),
                                  height:
                                      ScreenUtil.getInstance().setHeight(400),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(30),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: FlatButton(
                                    onPressed: () {
                                      createDeposit();
                                    },
                                    child: Text(
                                      users.howTo,
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
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
                    getCustomNavigator(context, users.footerTab, 0),
                  ],
                ));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }

  void createDeposit() {
    if (_value == _listViewData[0]) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => createDeposits(),
          ));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => createCard(),
          ));
    }
  }
}

class DepositPanelModel {
  String header;
  String available;
  List<String> availableBalances;
  String deposit;
  String choose;
  List<String> method;
  String howTo;
  List<String> footerTab;

  DepositPanelModel(
      {this.header,
      this.available,
      this.availableBalances,
      this.deposit,
      this.choose,
      this.method,
      this.howTo,
      this.footerTab});

  DepositPanelModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    available = json['abailable'];
    availableBalances = json['abailable_balances'].cast<String>();
    deposit = json['deposit'];
    choose = json['choose'];
    method = json['method'].cast<String>();
    howTo = json['howto'];
    footerTab = json['footer_tab'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['abailable'] = this.available;
    data['abailable_balances'] = this.availableBalances;
    data['deposit'] = this.deposit;
    data['choose'] = this.choose;
    data['method'] = this.method;
    data['howto'] = this.howTo;
    data['footer_tab'] = this.footerTab;
    return data;
  }
}
