import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'deposit_success.dart';

TextEditingController _amont_ontroller = TextEditingController();
TextEditingController _register_ontroller = TextEditingController();
TextEditingController _IBAN_ontroller = TextEditingController();
TextEditingController _PNR_ontroller = TextEditingController();

Widget Create_deposits() {
  return Create_panel();
}

class Create_panel extends StatefulWidget {
  Create_panel({Key key}) : super(key: key);
  @override
  _Create_panel createState() => _Create_panel();
}

class _Create_panel extends State<Create_panel> {
  final _formKey = GlobalKey<FormState>();
  var _bank_value = null;
  var _try_value = null;
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
            .loadString('assets/json/deposit/6.2Deposit_Transfer.json'),
        builder: (context, snapshot) {
          transfer_json users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
            users = transfer_json.fromJson(parsedJson);
            if(_bank_value == null && _try_value == null) {
              _bank_value = users.bankname[0];
              _try_value = users.trys[0];
            }
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
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                      ),
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
                      size: 16,
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
                                      color: Colors.black54, fontSize: 16),
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
                                      color: Colors.black54, fontSize: 16),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                users.abailableBalances[2] +'€',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(70),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            users.description,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(30),
                          ),
                          Text(
                            users.youcan,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 16),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(50),
                          ),
                          Text(
                            users.hintBank,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                          DropdownButton<String>(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: 16,
                            ),
                            items: users.bankname
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Icon(
                                      Icons.note,
                                      size: 16,
                                    ),
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
                                _bank_value = value;
                              });
                            },
                            value: _bank_value,
                            isExpanded: true,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(10),
                                ),
                                Text(
                                  users.hintAmount,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Expanded(
                                        child: TextFormField(
                                          style: TextStyle(
                                              color: Colors.black),
                                          controller: _amont_ontroller,
                                          decoration: InputDecoration(
                                            enabledBorder:
                                            UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                    Colors.black45,
                                                    width: 1.0)),
                                            focusedBorder:
                                            UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                    Colors.black45,
                                                    width: 1.0)),
                                            prefixIcon: const Icon(
                                              Icons.map,
                                              size: 16,
                                              color: Colors.black45,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter AMOUNT';
                                            }
                                            return null;
                                          },
                                          obscureText: false,
                                        )
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                          decoration: new BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.black54,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 16,
                                            ),
                                            items: users.trys
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: <Widget>[
                                                        SizedBox(width: 10),
                                                        Expanded(
                                                          child: Text(
                                                            value,
                                                            style: TextStyle(
                                                                color:
                                                                Colors.black45),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                _try_value = value;
                                              });
                                            },
                                            value: _try_value,
                                            isExpanded: true,
                                          ),
                                        ),
                                        width: 100,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(10),
                                ),
                                Text(
                                  users.hintRegister,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: _register_ontroller,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      size: 16,
                                      color: Colors.black45,
                                    ),
                                    suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.collections_bookmark,
                                          size: 16,
                                        ),
                                        onPressed: () {}),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter REGISTER';
                                    }
                                    return null;
                                  },
                                  obscureText: false,
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(10),
                                ),
                                Text(
                                  users.hintIban,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: _IBAN_ontroller,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    prefixIcon: const Icon(
                                      FontAwesomeIcons.hashtag,
                                      color: Colors.black45,
                                      size: 16,
                                    ),
                                    suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.collections_bookmark,
                                          size: 16,
                                        ),
                                        onPressed: () {}),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter IBAN';
                                    }
                                    return null;
                                  },
                                  obscureText: false,
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(10),
                                ),
                                Text(
                                  users.hintPNR,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: _PNR_ontroller,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    prefixIcon: const Icon(
                                      FontAwesomeIcons.hashtag,
                                      color: Colors.black45,
                                      size: 16,
                                    ),
                                    suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.collections_bookmark,
                                          size: 16,
                                        ),
                                        onPressed: () {}),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter PNR';
                                    }
                                    return null;
                                  },
                                  obscureText: false,
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(30),
                                ),
                                Container(
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Deposit_success(),
                                          ));
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
                                  height:
                                      ScreenUtil.getInstance().setHeight(30),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
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

class transfer_json {
  String header;
  String abailable;
  List<String> abailableBalances;
  String description;
  List<String> bankname;
  String youcan;
  String hintBank;
  String hintAmount;
  List<String> trys;
  String hintRegister;
  String hintIban;
  String hintPNR;
  String button;

  transfer_json(
      {this.header,
      this.abailable,
      this.abailableBalances,
      this.description,
      this.bankname,
      this.youcan,
      this.hintBank,
      this.hintAmount,
      this.trys,
      this.hintRegister,
      this.hintIban,
      this.hintPNR,
      this.button});

  transfer_json.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    abailable = json['abailable'];
    abailableBalances = json['abailable_balances'].cast<String>();
    description = json['description'];
    bankname = json['bankname'].cast<String>();
    youcan = json['youcan'];
    hintBank = json['hint_bank'];
    hintAmount = json['hint_amount'];
    trys = json['trys'].cast<String>();
    hintRegister = json['hint_register'];
    hintIban = json['hint_iban'];
    hintPNR = json['hint_PNR'];
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['abailable'] = this.abailable;
    data['abailable_balances'] = this.abailableBalances;
    data['description'] = this.description;
    data['bankname'] = this.bankname;
    data['youcan'] = this.youcan;
    data['hint_bank'] = this.hintBank;
    data['hint_amount'] = this.hintAmount;
    data['trys'] = this.trys;
    data['hint_register'] = this.hintRegister;
    data['hint_iban'] = this.hintIban;
    data['hint_PNR'] = this.hintPNR;
    data['button'] = this.button;
    return data;
  }
}
