import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'create_deposit.dart';


List<String> _listViewData;
Widget C_Depost_Panel() {
  return Depostpanel();
}

class Depostpanel extends StatefulWidget {
  Depostpanel({Key key}) : super(key: key);
  @override
  _Depostpanel createState() => _Depostpanel();
}

class _Depostpanel extends State<Depostpanel> {

  var _value = null;
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
          depositpanel_json users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
            users = depositpanel_json.fromJson(parsedJson);
            if( _value == null) _value = users.method[0];
            _listViewData = ['CHOOSE BANK'];
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
                                        users.abailableBalances[0] + '৳',
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
                                        users.abailableBalances[1] + "\$",
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
                                  'BANK',
                                  style: TextStyle(
                                      color: Colors.black26, fontSize: 12),
                                ),
                                SizedBox(
                                  height:
                                  ScreenUtil.getInstance().setHeight(20),
                                ),
                                DropdownButton<String>(
                                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.black26,),
                                  items: users.method
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Icon(Icons.note, color: Colors.black26, size: 18,),
                                              SizedBox(width: 20),
                                              Expanded(
                                                child: Text(
                                                  value,
                                                  style: TextStyle(color: Colors.black87),
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
                                  ScreenUtil.getInstance().setHeight(100),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => C_Create_deposits(),
                                      ));
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
                                  height: 60,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }

}

class depositpanel_json {
  String header;
  String abailable;
  List<String> abailableBalances;
  String deposit;
  String choose;
  List<String> method;
  String howto;
  List<String> footerTab;

  depositpanel_json(
      {this.header,
        this.abailable,
        this.abailableBalances,
        this.deposit,
        this.choose,
        this.method,
        this.howto,
        this.footerTab});

  depositpanel_json.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    abailable = json['abailable'];
    abailableBalances = json['abailable_balances'].cast<String>();
    deposit = json['deposit'];
    choose = json['choose'];
    method = json['method'].cast<String>();
    howto = json['howto'];
    footerTab = json['footer_tab'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['abailable'] = this.abailable;
    data['abailable_balances'] = this.abailableBalances;
    data['deposit'] = this.deposit;
    data['choose'] = this.choose;
    data['method'] = this.method;
    data['howto'] = this.howto;
    data['footer_tab'] = this.footerTab;
    return data;
  }
}
