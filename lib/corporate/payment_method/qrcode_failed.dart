import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/dashboard/merchant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'send_receipt.dart';

Widget Qrcode_Failed() {
  return Qrcode_Failed_panel();
}

class Qrcode_Failed_panel extends StatefulWidget {
  Qrcode_Failed_panel({Key key}) : super(key: key);
  @override
  _Qrcode_Failed_panel createState() => _Qrcode_Failed_panel();
}

class _Qrcode_Failed_panel extends State<Qrcode_Failed_panel> {
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
                title: Text('MOBILE POS'),
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
                      height: ScreenUtil.getInstance().setHeight(90),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: ScreenUtil.getInstance().setHeight(240),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(50),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'FAILED',
                              style: TextStyle(
                                  color: Colors.red,
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
                              'QR Transaction has been failed\nError code / Reason:',
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 17,
                                  height: 1.7),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "'Time's up, QR Expired!",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 17,
                                  height: 1.7),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(90),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: OutlineButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Send_Receipt(),
                                  ));
                            },
                            color: Colors.white,
                            borderSide: BorderSide(
                              color: Colors.black26, //Color of the border
                              style: BorderStyle.solid, //Style of the border
                              width: 0.8, //width of the border
                            ),
                            padding: EdgeInsets.all(15.0),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 65,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      "CHOOSE DIFFERENT PAYMENT METHOD",
                                      style: TextStyle(
                                        color: Colors.black,
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
                        Container(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: OutlineButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CorporateMerchantPanelScreen(
                                            null, null),
                                  ));
                            },
                            color: Colors.white,
                            borderSide: BorderSide(
                              color: Colors.black26, //Color of the border
                              style: BorderStyle.solid, //Style of the border
                              width: 0.8, //width of the border
                            ),
                            padding: EdgeInsets.all(15.0),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 100,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      "RECREATE QR CODE",
                                      style: TextStyle(
                                        color: Colors.black,
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
                                    width: 115,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      "CANCEL PAYMENT",
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
