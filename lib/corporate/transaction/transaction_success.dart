import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/dashboard/merchant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget Transaction_Success() {
  return Transaction_Success_panel();
}

class Transaction_Success_panel extends StatefulWidget {
  Transaction_Success_panel({Key key}) : super(key: key);
  @override
  _Transaction_Success_panel createState() => _Transaction_Success_panel();
}

class _Transaction_Success_panel extends State<Transaction_Success_panel> {
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
            .loadString('assets/json/deposit/6.2.1Deposit_succes.json'),
        builder: (context, snapshot) {
          success_json users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
            users = success_json.fromJson(parsedJson);
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('SHARE LINK'),
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
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              users.success,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'DPL#335 has been created successfully!\nYou can copy and share the link to directly get paid.',
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 17,
                                  height: 1.7),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(70),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Text('Transaction ID',
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 15)),
                            ),
                            Expanded(
                              child: Container(
                                  child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  '#725523',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 15),
                                ),
                              )),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 1.0,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(30),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Text('Refund amount',
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 15)),
                            ),
                            Expanded(
                              child: Container(
                                  child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  '484,00₺',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 15),
                                ),
                              )),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 1.0,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(50),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CorporateMerchantPanelScreen(
                                            null, null),
                                  ));
                            },
                            color: Colors.blue,
                            disabledColor: Colors.blue,
                            padding: EdgeInsets.all(15.0),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 110,
                                  ),
                                  SizedBox(
                                    child: Icon(
                                      FontAwesomeIcons.link,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    width: 30,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      "CLOSE",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                          width: ScreenUtil.getInstance().setWidth(750),
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

class success_json {
  String header;
  String success;
  String yourdeposit;
  DepositData depositData;
  List<String> footerTab;
  String button;

  success_json(
      {this.header,
      this.success,
      this.yourdeposit,
      this.depositData,
      this.footerTab,
      this.button});

  success_json.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    success = json['success'];
    yourdeposit = json['yourdeposit'];
    depositData = json['deposit_data'] != null
        ? new DepositData.fromJson(json['deposit_data'])
        : null;
    footerTab = json['footer_tab'].cast<String>();
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['success'] = this.success;
    data['yourdeposit'] = this.yourdeposit;
    if (this.depositData != null) {
      data['deposit_data'] = this.depositData.toJson();
    }
    data['footer_tab'] = this.footerTab;
    data['button'] = this.button;
    return data;
  }
}

class DepositData {
  String bank;
  String reciever;
  String iban;
  String pNR;
  String aMOUNT;

  DepositData({this.bank, this.reciever, this.iban, this.pNR, this.aMOUNT});

  DepositData.fromJson(Map<String, dynamic> json) {
    bank = json['bank'];
    reciever = json['reciever'];
    iban = json['iban'];
    pNR = json['PNR'];
    aMOUNT = json['AMOUNT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bank'] = this.bank;
    data['reciever'] = this.reciever;
    data['iban'] = this.iban;
    data['PNR'] = this.pNR;
    data['AMOUNT'] = this.aMOUNT;
    return data;
  }
}
