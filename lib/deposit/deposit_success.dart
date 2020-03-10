import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget depositSuccess() {
  return DepositSuccessPanel();
}

class DepositSuccessPanel extends StatefulWidget {
  DepositSuccessPanel({Key key}) : super(key: key);
  @override
  DepositSuccessPanelState createState() => DepositSuccessPanelState();
}

class DepositSuccessPanelState extends State<DepositSuccessPanel> {
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
          SuccessJsonModel users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
            users = SuccessJsonModel.fromJson(parsedJson);
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
                          height: ScreenUtil.getInstance().setHeight(20),
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
                          height: ScreenUtil.getInstance().setHeight(10),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              users.yourDeposit,
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 15),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(100),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.person,
                              color: Colors.black45,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(users.depositData.bank),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          color: Colors.black38,
                          height: 1.0,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.person,
                              color: Colors.black45,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(users.depositData.reciever),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          color: Colors.black38,
                          height: 1.0,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              FontAwesomeIcons.hashtag,
                              color: Colors.black45,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text('IBAN: ' + users.depositData.iban),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          color: Colors.black38,
                          height: 1.0,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              FontAwesomeIcons.hashtag,
                              color: Colors.black45,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text('PNR: ' + users.depositData.pNR),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          color: Colors.black38,
                          height: 1.0,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.map,
                              color: Colors.black45,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child:
                                  Text('AMOUNT: ' + users.depositData.aMOUNT),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          color: Colors.black38,
                          height: 1.0,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                      icon: const Icon(
                                        Icons.email,
                                        color: Colors.blue,
                                        size: 20,
                                      ),
                                      onPressed: () {},
                                    ),
                                    Text(
                                      users.footerTab[0],
                                      style: TextStyle(
                                          fontSize: 8, color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                      icon: const Icon(
                                        Icons.sms,
                                        color: Colors.blue,
                                        size: 20,
                                      ),
                                      onPressed: () {},
                                    ),
                                    Text(
                                      users.footerTab[1],
                                      style: TextStyle(
                                          fontSize: 8, color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                      icon: const Icon(
                                        FontAwesomeIcons.whatsapp,
                                        color: Colors.blue,
                                        size: 20,
                                      ),
                                      onPressed: () {},
                                    ),
                                    Text(
                                      users.footerTab[2],
                                      style: TextStyle(
                                          fontSize: 8, color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                      icon: const Icon(
                                        Icons.content_copy,
                                        color: Colors.blue,
                                        size: 20,
                                      ),
                                      onPressed: () {},
                                    ),
                                    Text(
                                      users.footerTab[3],
                                      style: TextStyle(
                                          fontSize: 8, color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                      icon: const Icon(
                                        Icons.cancel,
                                        color: Colors.blue,
                                        size: 20,
                                      ),
                                      onPressed: () {},
                                    ),
                                    Text(
                                      users.footerTab[4],
                                      style: TextStyle(
                                          fontSize: 8, color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(50),
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
                                users.button,
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

class SuccessJsonModel {
  String header;
  String success;
  String yourDeposit;
  DepositData depositData;
  List<String> footerTab;
  String button;

  SuccessJsonModel(
      {this.header,
      this.success,
      this.yourDeposit,
      this.depositData,
      this.footerTab,
      this.button});

  SuccessJsonModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    success = json['success'];
    yourDeposit = json['yourdeposit'];
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
    data['yourdeposit'] = this.yourDeposit;
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
