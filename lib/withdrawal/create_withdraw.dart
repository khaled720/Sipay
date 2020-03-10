import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'withdraw_success.dart';

TextEditingController ibanController = TextEditingController();
TextEditingController withdrawController = TextEditingController();
TextEditingController transactionController = TextEditingController();
TextEditingController netController = TextEditingController();
TextEditingController accountController = TextEditingController();

int buttonSet = 0;
Widget createWithdraws(int data) {
  buttonSet = data;
  return CreatePanelScreen();
}

class CreatePanelScreen extends StatefulWidget {
  CreatePanelScreen({Key key}) : super(key: key);
  @override
  CreatePanelScreenState createState() => CreatePanelScreenState();
}

class CreatePanelScreenState extends State<CreatePanelScreen> {
  final _formKey = GlobalKey<FormState>();

  bool saveAccount = false;

  var tryValue1;
  var tryValue2;
  var tryValue3;
  var tryValue4;
  var savedAccount;
  var bankValue;

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
          RequestModel users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
            users = RequestModel.fromJson(parsedJson);
            if (tryValue1 == null &&
                tryValue2 == null &&
                tryValue3 == null &&
                tryValue4 == null &&
                savedAccount == null &&
                bankValue == null) {
              tryValue1 = tryValue2 = tryValue3 = tryValue4 = users.trys[0];
              savedAccount = users.accountSelect[0];
              bankValue = users.bankSelect[0];
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
                                  users.availableBalances[0] + '₺',
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
                                  users.availableBalances[1] + "\$",
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
                      height: ScreenUtil.getInstance().setHeight(50),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            users.toBank,
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
                                savedAccount = value;
                              });
                            },
                            value: savedAccount,
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
                                bankValue = value;
                              });
                            },
                            value: bankValue,
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
                              items: users.trys.map<DropdownMenuItem<String>>(
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
                                  tryValue1 = value;
                                });
                              },
                              value: tryValue1,
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
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: accountController,
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
                                  controller: ibanController,
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
                                  height:
                                      ScreenUtil.getInstance().setHeight(10),
                                ),
                                Text(
                                  users.withdrawField[5],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: TextFormField(
                                              style: TextStyle(
                                                  color: Colors.black),
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: withdrawController,
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
                                        ),
                                        height: ScreenUtil.getInstance()
                                            .setHeight(100),
                                      ),
                                    ),
                                    Container(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
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
                                              tryValue2 = value;
                                            });
                                          },
                                          value: tryValue2,
                                          isExpanded: true,
                                        ),
                                      ),
                                      height: ScreenUtil.getInstance()
                                          .setHeight(110),
                                      width: ScreenUtil.getInstance()
                                          .setWidth(250),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(10),
                                ),
                                Text(
                                  users.withdrawField[6],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: TextFormField(
                                              style: TextStyle(
                                                  color: Colors.black),
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: transactionController,
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
                                        ),
                                        height: ScreenUtil.getInstance()
                                            .setHeight(100),
                                      ),
                                    ),
                                    Container(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
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
                                              tryValue3 = value;
                                            });
                                          },
                                          value: tryValue3,
                                          isExpanded: true,
                                        ),
                                      ),
                                      height: ScreenUtil.getInstance()
                                          .setHeight(110),
                                      width: ScreenUtil.getInstance()
                                          .setWidth(250),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(10),
                                ),
                                Text(
                                  users.withdrawField[7],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: TextFormField(
                                              style: TextStyle(
                                                  color: Colors.black),
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: netController,
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
                                        ),
                                        height: ScreenUtil.getInstance()
                                            .setHeight(100),
                                      ),
                                    ),
                                    Container(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
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
                                              tryValue4 = value;
                                            });
                                          },
                                          value: tryValue4,
                                          isExpanded: true,
                                        ),
                                      ),
                                      height: ScreenUtil.getInstance()
                                          .setHeight(110),
                                      width: ScreenUtil.getInstance()
                                          .setWidth(250),
                                    ),
                                  ],
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
                                      value: saveAccount,
                                      onChanged: (bool value) {
                                        setState(() {
                                          saveAccount = value;
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
                                      builder: (context) => withdrawSuccess(),
                                    ));
                              },
                              color: Colors.blue,
                              disabledColor: Colors.blue,
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                users.button[buttonSet],
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

class RequestModel {
  String header;
  String available;
  List<String> availableBalances;
  String toBank;
  String select;
  List<String> accountSelect;
  List<String> bankSelect;
  List<String> withdrawField;
  List<String> trys;
  List<String> button;
  String save;

  RequestModel(
      {this.header,
      this.available,
      this.availableBalances,
      this.toBank,
      this.select,
      this.accountSelect,
      this.bankSelect,
      this.withdrawField,
      this.trys,
      this.button,
      this.save});

  RequestModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    available = json['abailable'];
    availableBalances = json['abailable_balances'].cast<String>();
    toBank = json['tobank'];
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
    data['abailable'] = this.available;
    data['abailable_balances'] = this.availableBalances;
    data['tobank'] = this.toBank;
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
