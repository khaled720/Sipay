import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


TextEditingController _account_ontroller = TextEditingController();
TextEditingController _holder_controller = TextEditingController();
TextEditingController _iban_ontroller = TextEditingController();

Widget ADD_new_account() {
  return Addnew_panel();
}

class Addnew_panel extends StatefulWidget {
  Addnew_panel({Key key}) : super(key: key);
  @override
  _Addnew_panel createState() => _Addnew_panel();
}

class _Addnew_panel extends State<Addnew_panel> {


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
    final _media = MediaQuery.of(context).size;

    Future<Map<String, String>> loadJson() async {
      final jsonA = await DefaultAssetBundle.of(context).loadString('assets/json/dashboard/add_new_account.json');
      return {
        'merchant': jsonA,
      };
    }

    return new FutureBuilder(
        future: loadJson(),

        builder: (context, snapshot) {
        addaccount_json users;
        var parsedJson;
        var footerJson;
        if (snapshot.hasData) {
        parsedJson = json.decode(snapshot.data['merchant'].toString());
        users = addaccount_json.fromJson(parsedJson);
        return new Scaffold(
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
            child: Padding(
              padding: EdgeInsets.only(right: 30.0, left: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  Text(
                    users.add,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    users.account,
                    style: TextStyle(
                        color: Colors.black54, fontSize: 12),
                  ),
                  TextField(
                    style: TextStyle(color: Colors.black),
                    controller: _account_ontroller,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black26, width: 0.5)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black45, width: 1.0)),
                      prefixIcon: const Icon(
                        FontAwesomeIcons.signature,
                        size: 16,
                        color: Colors.black26
                      ),
                    ),
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    users.bank,
                    style: TextStyle(
                        color: Colors.black54, fontSize: 12),
                  ),
                  DropdownButton<String>(
                    icon: Icon(Icons.keyboard_arrow_down, color: Colors.black38,),
                    items: users.bankList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.note, color: Colors.black26, size: 17,),
                            SizedBox(width: 20),
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
                        users.bankList[0] = value;
                      });
                    },
                    value: users.bankList[0],
                    isExpanded: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    users.currency,
                    style:
                    TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  Container(
                    child: DropdownButton<String>(
                      icon: Icon(Icons.keyboard_arrow_down, color: Colors.black26,),
                      items: users.currencyList
                          .map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(Icons.map, size: 18, color: Colors.black38,),
                                  SizedBox(width: 20),
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
                          users.currencyList[0] = value;
                        });
                      },
                      value: users.currencyList[0],
                      isExpanded: true,
                    ),
                    width: ScreenUtil.getInstance().setWidth(300),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    users.accountHolder,
                    style: TextStyle(
                        color: Colors.black45, fontSize: 12),
                  ),
                  TextField(
                    style: TextStyle(color: Colors.black),
                    controller: _holder_controller,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black26, width: 0.5)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black26, width: 0.5)),
                      prefixIcon: const Icon(
                        Icons.person,
                        size: 16,
                        color: Colors.black45,
                      ),
                    ),
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    users.iban,
                    style: TextStyle(
                        color: Colors.black54, fontSize: 12),
                  ),
                  TextField(
                    style: TextStyle(color: Colors.black),
                    controller: _iban_ontroller,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black26, width: 0.5)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black26, width: 0.5)),
                      prefixIcon: const Icon(
                        FontAwesomeIcons.hashtag,
                        size: 16,
                        color: Colors.black45,
                      ),
                    ),
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    users.status,
                    style:
                    TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  Container(
                    child: DropdownButton<String>(
                      icon: Icon(Icons.keyboard_arrow_down, color: Colors.black26,),
                      items:
                          users.statusList.map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(Icons.map, color: Colors.black38, size: 18,),
                                  SizedBox(width: 20),
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
                          users.statusList[0] = value;
                        });
                      },
                      value: users.statusList[1],
                      isExpanded: true,
                    ),
                    width: ScreenUtil.getInstance().setWidth(300),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: FlatButton(
                      onPressed: (){
                        Navigator.pop(context);
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
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ),
        );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
        });
  }
}

class addaccount_json {
  String header;
  String add;
  String account;
  String bank;
  List<String> bankList;
  String currency;
  List<String> currencyList;
  String accountHolder;
  String iban;
  String status;
  List<String> statusList;
  String button;

  addaccount_json(
      {this.header,
        this.add,
        this.account,
        this.bank,
        this.bankList,
        this.currency,
        this.currencyList,
        this.accountHolder,
        this.iban,
        this.status,
        this.statusList,
        this.button});

  addaccount_json.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    add = json['add'];
    account = json['account'];
    bank = json['bank'];
    bankList = json['bank_list'].cast<String>();
    currency = json['currency'];
    currencyList = json['currency_list'].cast<String>();
    accountHolder = json['account_holder'];
    iban = json['iban'];
    status = json['status'];
    statusList = json['status_list'].cast<String>();
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['add'] = this.add;
    data['account'] = this.account;
    data['bank'] = this.bank;
    data['bank_list'] = this.bankList;
    data['currency'] = this.currency;
    data['currency_list'] = this.currencyList;
    data['account_holder'] = this.accountHolder;
    data['iban'] = this.iban;
    data['status'] = this.status;
    data['status_list'] = this.statusList;
    data['button'] = this.button;
    return data;
  }
}
