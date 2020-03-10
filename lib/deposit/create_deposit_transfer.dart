import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'deposit_success.dart';

TextEditingController amountController = TextEditingController();
TextEditingController registerController = TextEditingController();
TextEditingController ibanController = TextEditingController();
TextEditingController pnrController = TextEditingController();

Widget createDeposits() {
  return CreatePanelScreen();
}

class CreatePanelScreen extends StatefulWidget {
  CreatePanelScreen({Key key}) : super(key: key);
  @override
  CreatePanelScreenState createState() => CreatePanelScreenState();
}

class CreatePanelScreenState extends State<CreatePanelScreen> {
  final _formKey = GlobalKey<FormState>();
  var bankValue;
  var tryValue;
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
          TransferJsonModel users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
            users = TransferJsonModel.fromJson(parsedJson);
            if (bankValue == null && tryValue == null) {
              bankValue = users.bankName[0];
              tryValue = users.trys[0];
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
                      Icons.chat_bubble_outline,
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
                            users.youCan,
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
                            items: users.bankName
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
                                bankValue = value;
                              });
                            },
                            value: bankValue,
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
                                              controller: amountController,
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
                                              tryValue = value;
                                            });
                                          },
                                          value: tryValue,
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
                                  users.hintRegister,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: registerController,
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
                                  controller: pnrController,
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
                                                depositSuccess(),
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

class TransferJsonModel {
  String header;
  String available;
  List<String> availableBalances;
  String description;
  List<String> bankName;
  String youCan;
  String hintBank;
  String hintAmount;
  List<String> trys;
  String hintRegister;
  String hintIban;
  String hintPNR;
  String button;

  TransferJsonModel(
      {this.header,
      this.available,
      this.availableBalances,
      this.description,
      this.bankName,
      this.youCan,
      this.hintBank,
      this.hintAmount,
      this.trys,
      this.hintRegister,
      this.hintIban,
      this.hintPNR,
      this.button});

  TransferJsonModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    available = json['abailable'];
    availableBalances = json['abailable_balances'].cast<String>();
    description = json['description'];
    bankName = json['bankname'].cast<String>();
    youCan = json['youcan'];
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
    data['abailable'] = this.available;
    data['abailable_balances'] = this.availableBalances;
    data['description'] = this.description;
    data['bankname'] = this.bankName;
    data['youcan'] = this.youCan;
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
