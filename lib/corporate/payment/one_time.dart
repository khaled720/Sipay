import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


Widget One_Time() {
  return One_Time_panel();
}

class One_Time_panel extends StatefulWidget {
  One_Time_panel({Key key}) : super(key: key);
  @override
  _One_Time_panel createState() => _One_Time_panel();
}

class _One_Time_panel extends State<One_Time_panel> {
  var _try_value = "TRY";
  List<String> _listtryData = [
    "TRY",
    "TRYS"
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
    return new FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/json/Withdrawl/8.6Withdraw_request.json'),
        builder: (context, snapshot) {
//          request_json users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
//            users = request_json.fromJson(parsedJson);
            return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text("ONE TIME LINK"),
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
                              'CREATE ONE TIME LINK',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
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
                                  'Create payment link that works just one time',
                                  style: TextStyle(color: Colors.black54, fontSize: 16),
                                ),
                                SizedBox(
                                  height: ScreenUtil.getInstance().setHeight(100),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child:TextFormField(
                                          style: TextStyle(
                                              color: Colors.black),
                                          keyboardType: TextInputType.number,
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
                                            items: ['try', 'trys']
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
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }
}


