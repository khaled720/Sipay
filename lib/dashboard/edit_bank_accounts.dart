import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


TextEditingController _account_ontroller = TextEditingController();
TextEditingController _holder_controller = TextEditingController();
TextEditingController _iban_ontroller = TextEditingController();

Widget Edit_bank_account() {
  return Edit_account_panel();
}

class Edit_account_panel extends StatefulWidget {
  Edit_account_panel({Key key}) : super(key: key);
  @override
  _Edit_account_panel createState() => _Edit_account_panel();
}

class _Edit_account_panel extends State<Edit_account_panel> {

  var _bank_value = "T.C.ZIRAAT BANKASI A.S.";
  List<String> _bank_data = [
    "T.C.ZIRAAT BANKASI A.S.",
    "T.C.ZIRAAT BANKASI A.S.S"
  ];
  var _currency_value = "TRY";
  List<String> _currency_data = [
    "TRY",
    "NOT TRY"
  ];
  var _active_value = "ACTIVE";
  List<String> _active_data = [
    "ACTIVE",
    "NON ACTIVE"
  ];

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
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("EDIT"),
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
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'EDIT BANK ACCOUNT',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        alignment: Alignment.centerRight,
                        icon: Icon(FontAwesomeIcons.trash, color:  const Color(0xFFc14b6f),),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'ACCOUNT NAME',
                  style: TextStyle(
                      color: Colors.black54, fontSize: 12),
                ),
                TextField(
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
                      FontAwesomeIcons.signature,
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
                  'BANK',
                  style: TextStyle(
                      color: Colors.black54, fontSize: 12),
                ),
                DropdownButton<String>(
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: _bank_data
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
                  height: 20,
                ),
                Text(
                  "CURRENCY",
                  style:
                  TextStyle(color: Colors.black54, fontSize: 12),
                ),
                Container(
                  child: DropdownButton<String>(
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: _currency_data
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
                        _currency_value = value;
                      });
                    },
                    value: _currency_value,
                    isExpanded: true,
                  ),
                  width: ScreenUtil.getInstance().setWidth(300),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'ACCOUNT HOLDER NAME',
                  style: TextStyle(
                      color: Colors.black54, fontSize: 12),
                ),
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: _holder_controller,
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
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'IBAN',
                  style: TextStyle(
                      color: Colors.black54, fontSize: 12),
                ),
                TextField(
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
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "STATUS",
                  style:
                  TextStyle(color: Colors.black54, fontSize: 12),
                ),
                Container(
                  child: DropdownButton<String>(
                    icon: Icon(Icons.keyboard_arrow_down),
                    items:
                    _active_data.map<DropdownMenuItem<String>>(
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
                        _active_value = value;
                      });
                    },
                    value: _active_value,
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
                      "SAVE",
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
  }
}

