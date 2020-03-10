import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'deposit_success.dart';

TextEditingController nameController = TextEditingController();
TextEditingController cardController = TextEditingController();
TextEditingController expiryController = TextEditingController();
TextEditingController cvvController = TextEditingController();
TextEditingController amountController = TextEditingController();

Widget createCard() {
  return CardPanelScreen();
}

class CardPanelScreen extends StatefulWidget {
  CardPanelScreen({Key key}) : super(key: key);
  @override
  CardPanelScreenState createState() => CardPanelScreenState();
}

class CardPanelScreenState extends State<CardPanelScreen> {
  final _formKey = GlobalKey<FormState>();

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
            .loadString('assets/json/deposit/6.3Deposit_card.json'),
        builder: (context, snapshot) {
          CardModel users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
            users = CardModel.fromJson(parsedJson);
            if (tryValue == null) tryValue = users.trys[0];
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
                                  controller: nameController,
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
                                  controller: cardController,
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
                                  users.availableBalances[2],
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
                                          controller: expiryController,
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
                                          controller: cvvController,
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
                                      ScreenUtil.getInstance().setHeight(20),
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

class CardModel {
  String header;
  String available;
  List<String> availableBalances;
  String card;
  String credit;
  List<String> depositFields;
  List<String> trys;
  String button;

  CardModel(
      {this.header,
      this.available,
      this.availableBalances,
      this.card,
      this.credit,
      this.depositFields,
      this.trys,
      this.button});

  CardModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    available = json['abailable'];
    availableBalances = json['abailable_balances'].cast<String>();
    card = json['card'];
    credit = json['credit'];
    depositFields = json['deposit_fields'].cast<String>();
    trys = json['trys'].cast<String>();
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['abailable'] = this.available;
    data['abailable_balances'] = this.availableBalances;
    data['card'] = this.card;
    data['credit'] = this.credit;
    data['deposit_fields'] = this.depositFields;
    data['trys'] = this.trys;
    data['button'] = this.button;
    return data;
  }
}
