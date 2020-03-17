import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Withdraw_success.dart';

TextEditingController _iban_ontroller = TextEditingController();
TextEditingController _withdraw_controller = TextEditingController();
TextEditingController _transaction_ontroller = TextEditingController();
TextEditingController _net_ontroller = TextEditingController();
TextEditingController _account_ontroller = TextEditingController();

int button_set = 0;
Widget Create_withdraws(int data) {
  button_set = data;
  return Create_panel();
}

class Create_panel extends StatefulWidget {
  Create_panel({Key key}) : super(key: key);
  @override
  _Create_panel createState() => _Create_panel();
}

class _Create_panel extends State<Create_panel> {
  final _formKey = GlobalKey<FormState>();

  bool _save_account = false;

  var _try_value_1 = null;
  var _try_value_2 = null;
  var _try_value_3 = null;
  var _try_value_4 = null;
  var _savedaccount = null;
  var _bank_value = null;

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
            .loadString('assets/json/Withdrawl/8.6Withdraw_request.json'),
        builder: (context, snapshot) {
          request_json users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
            users = request_json.fromJson(parsedJson);
            if(_try_value_1 == null && _try_value_2 == null && _try_value_3 == null && _try_value_4 == null && _savedaccount == null && _bank_value == null){
              _try_value_1 = _try_value_2 = _try_value_3 = _try_value_4 = users.trys[0];
              _savedaccount = users.accountSelect[0];
              _bank_value = users.bankSelect[0];
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
                                  users.abailableBalances[0] +'₺',
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
                      height: ScreenUtil.getInstance().setHeight(50),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            users.tobank,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(10),
                          ),
                          Text(
                            users.select,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(30),
                          ),
                          Text(
                            users.withdrawField[0],
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                          DropdownButton<String>(
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: users.accountSelect
                                .map<DropdownMenuItem<String>>((String value) {
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
                                _savedaccount = value;
                              });
                            },
                            value: _savedaccount,
                            isExpanded: true,
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(30),
                          ),
                          Text(
                            users.withdrawField[1],
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                          DropdownButton<String>(
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: users.bankSelect
                                .map<DropdownMenuItem<String>>((String value) {
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
                                _bank_value = value;
                              });
                            },
                            value: _bank_value,
                            isExpanded: true,
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(30),
                          ),
                          Text(
                            users.withdrawField[2],
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                          Container(
                            child: DropdownButton<String>(
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: users.trys
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(Icons.map),
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
                                  _try_value_1 = value;
                                });
                              },
                              value: _try_value_1,
                              isExpanded: true,
                            ),
                            width: ScreenUtil.getInstance().setWidth(300),
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
                                  users.withdrawField[3],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                               new  TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: _account_ontroller,
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
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter ACCOUNT HOLDER NAME';
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
                                  users.withdrawField[4],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: _iban_ontroller,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    prefixIcon: const Icon(
                                      FontAwesomeIcons.hashtag,
                                      size: 16,
                                      color: Colors.black45,
                                    ),
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
                                  height:10,
                                ),
                                Text(
                                  users.withdrawField[5],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child:TextFormField(
                                          style: TextStyle(
                                              color: Colors.black),
                                          keyboardType: TextInputType.number,
                                          controller: _withdraw_controller,
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
                                              return 'Please enter WITHDRAW AMOUNT';
                                            }
                                            return null;
                                          },
                                          obscureText: false,
                                        ),
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
                                                _try_value_2 = value;
                                              });
                                            },
                                            value: _try_value_2,
                                            isExpanded: true,
                                          ),
                                        ),
                                        width: 100,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:10,
                                ),
                                Text(
                                  users.withdrawField[6],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Expanded(
                                        child:TextFormField(
                                          style: TextStyle(
                                              color: Colors.black),
                                          keyboardType: TextInputType.number,
                                          controller:
                                          _transaction_ontroller,
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
                                              Icons.save,
                                              size: 16,
                                              color: Colors.black45,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter TRANSACTION FEE';
                                            }
                                            return null;
                                          },
                                          obscureText: false,
                                        ),
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
                                                _try_value_3 = value;
                                              });
                                            },
                                            value: _try_value_3,
                                            isExpanded: true,
                                          ),
                                        ),
                                        width:100,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:10,
                                ),
                                Text(
                                  users.withdrawField[7],
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
                                          keyboardType: TextInputType.number,
                                          controller: _net_ontroller,
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
                                              FontAwesomeIcons.database,
                                              size: 16,
                                              color: Colors.black45,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter WITHDRAW AMOUNT';
                                            }
                                            return null;
                                          },
                                          obscureText: false,
                                        ),
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
                                        child:DropdownButtonHideUnderline(
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
                                                _try_value_4 = value;
                                              });
                                            },
                                            value: _try_value_4,
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
                              ],
                            ),
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: Align(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Checkbox(
                                      value: _save_account,
                                      onChanged: (bool value) {
                                        setState(() {
                                          _save_account = value;
                                        });
                                      },
                                    ),
                                    Container(
                                      child: Text(users.save),
                                    )
                                  ],
                                ),
                                alignment: Alignment.centerRight,
                              )),
                          Container(
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Withdraw_success(),
                                    ));
                              },
                              color: Colors.blue,
                              disabledColor: Colors.blue,
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                users.button[button_set],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            width: ScreenUtil.getInstance().setWidth(690),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(20),
                          ),
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

class request_json {
  String header;
  String abailable;
  List<String> abailableBalances;
  String tobank;
  String select;
  List<String> accountSelect;
  List<String> bankSelect;
  List<String> withdrawField;
  List<String> trys;
  List<String> button;
  String save;

  request_json(
      {this.header,
      this.abailable,
      this.abailableBalances,
      this.tobank,
      this.select,
      this.accountSelect,
      this.bankSelect,
      this.withdrawField,
      this.trys,
      this.button,
      this.save});

  request_json.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    abailable = json['abailable'];
    abailableBalances = json['abailable_balances'].cast<String>();
    tobank = json['tobank'];
    select = json['select'];
    accountSelect = json['account_select'].cast<String>();
    bankSelect = json['bank_select'].cast<String>();
    withdrawField = json['withdraw_field'].cast<String>();
    trys = json['trys'].cast<String>();
    button = json['button'].cast<String>();
    save = json['save'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['abailable'] = this.abailable;
    data['abailable_balances'] = this.abailableBalances;
    data['tobank'] = this.tobank;
    data['select'] = this.select;
    data['account_select'] = this.accountSelect;
    data['bank_select'] = this.bankSelect;
    data['withdraw_field'] = this.withdrawField;
    data['trys'] = this.trys;
    data['button'] = this.button;
    data['save'] = this.save;
    return data;
  }
}
