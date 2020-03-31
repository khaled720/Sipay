import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'deposit_success.dart';

TextEditingController _name_ontroller = TextEditingController();
TextEditingController _card_controller = TextEditingController();
TextEditingController _EXPIRY_ontroller = TextEditingController();
TextEditingController _CVV_ontroller = TextEditingController();
TextEditingController _AMOUNT_ontroller = TextEditingController();

Widget Create_Card() {
  return Card_panel();
}

class Card_panel extends StatefulWidget {
  Card_panel({Key key}) : super(key: key);
  @override
  _Card_panel createState() => _Card_panel();
}

class _Card_panel extends State<Card_panel> {
  final _formKey = GlobalKey<FormState>();

  var _try_value;
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
            .loadString('assets/json/deposit/6.3Deposit_card.json'),
        builder: (context, snapshot) {
          DepositCardUIModel users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
            users = DepositCardUIModel.fromJson(parsedJson);
            if (_try_value == null) _try_value = users.trys[0];
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
                            users.card,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(10),
                          ),
                          Text(
                            users.credit,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(30),
                          ),
                          Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset('assets/card.png'),
                            ),
                            height: ScreenUtil.getInstance().setHeight(200),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(20),
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
                                  users.depositFields[0],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: _name_ontroller,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    prefixIcon: const Icon(
                                      Icons.book,
                                      size: 16,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter NAME';
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
                                  users.depositFields[1],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.number,
                                  controller: _card_controller,
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
                                      return 'Please enter NUMBER';
                                    }
                                    return null;
                                  },
                                  obscureText: false,
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(20),
                                ),
                                Text(
                                  users.abailableBalances[2],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          controller: _EXPIRY_ontroller,
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45,
                                                    width: 1.0)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45,
                                                    width: 1.0)),
                                            prefixIcon: const Icon(
                                              FontAwesomeIcons.hashtag,
                                              color: Colors.black45,
                                              size: 16,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter EXPIRY';
                                            }
                                            return null;
                                          },
                                          obscureText: false,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          keyboardType: TextInputType.number,
                                          controller: _CVV_ontroller,
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45,
                                                    width: 1.0)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45,
                                                    width: 1.0)),
                                            prefixIcon: const Icon(
                                              FontAwesomeIcons.hashtag,
                                              color: Colors.black45,
                                              size: 16,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter CVV';
                                            }
                                            return null;
                                          },
                                          obscureText: false,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(30),
                                ),
                                Text(
                                  users.depositFields[3],
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
                                          style: TextStyle(color: Colors.black),
                                          controller: _AMOUNT_ontroller,
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45,
                                                    width: 1.0)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45,
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
                                  height: 20,
                                ),
                                Container(
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DepositSuccessScreen(null),
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

class DepositCardUIModel {
  String header;
  String abailable;
  List<String> abailableBalances;
  String card;
  String credit;
  List<String> depositFields;
  List<String> trys;
  String button;

  DepositCardUIModel(
      {this.header,
      this.abailable,
      this.abailableBalances,
      this.card,
      this.credit,
      this.depositFields,
      this.trys,
      this.button});

  DepositCardUIModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    abailable = json['abailable'];
    abailableBalances = json['abailable_balances'].cast<String>();
    card = json['card'];
    credit = json['credit'];
    depositFields = json['deposit_fields'].cast<String>();
    trys = json['trys'].cast<String>();
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['abailable'] = this.abailable;
    data['abailable_balances'] = this.abailableBalances;
    data['card'] = this.card;
    data['credit'] = this.credit;
    data['deposit_fields'] = this.depositFields;
    data['trys'] = this.trys;
    data['button'] = this.button;
    return data;
  }
}
