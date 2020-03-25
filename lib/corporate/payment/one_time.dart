import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttersipay/corporate/payment/onetime_success.dart';

TextEditingController _SMSController = TextEditingController();

Widget One_Time() {
  return One_Time_panel();
}

class One_Time_panel extends StatefulWidget {
  One_Time_panel({Key key}) : super(key: key);
  @override
  _One_Time_panel createState() => _One_Time_panel();
}

class _One_Time_panel extends State<One_Time_panel> {
  bool check_state = true;
  bool _remember = false;

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
                                Text(
                                  'AMOUNT',
                                  style: TextStyle(color:check_state ? Colors.black26 : Colors.red, fontSize: 12),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child:TextFormField(
                                          style: TextStyle(color: check_state ? Colors.black : Colors.red),
                                          keyboardType: TextInputType.number,
                                          onChanged: (text){
                                            if(text.length > 0 && !check_state){
                                              setState(() {
                                                check_state = true;
                                              });
                                            }
                                          },
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black26, width: 0.5)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black26, width: 0.5)),
                                            prefixIcon: check_state? const Icon(
                                              Icons.map,
                                              size: 16,
                                              color: Colors.black26,
                                            ): const Icon(
                                              Icons.cancel,
                                              size: 16,
                                              color: Colors.red,
                                            ),
                                          ),
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
                                              color: Colors.black26,
                                              width: 0.5,
                                            ),
                                          ),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,size: 16, color: Colors.black26,
                                            ),
                                            items:_listtryData.map<DropdownMenuItem<String>>((String value){
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    SizedBox(width: 10,),
                                                    Expanded(
                                                      child:  Text(
                                                        value,
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
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Checkbox(
                                      value: _remember,
                                      onChanged: (bool value) {
                                        setState(() {
                                          _remember = value;
                                        });
                                      },
                                    ),
                                    Expanded(
                                      child: Text("Set by user"),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'EXPLANATION',
                                  style: TextStyle(color:check_state ? Colors.black26 : Colors.red, fontSize: 12),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Icon(
                                        FontAwesomeIcons.sms,
                                        color: Colors.black26,
                                        size: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Please enter an explanation.',
                                        style: TextStyle(color:check_state ? Colors.black26 : Colors.red, fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                            child: TextField(
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.number,
                              controller: _SMSController,
                              decoration: InputDecoration(
//                                      hintStyle: CustomTextStyle.formField(context),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black12, width: 1.0)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black12, width: 1.0)),
                              ),
                              obscureText: true,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                            child: FlatButton(
                              onPressed: (){
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=> Onetime_Success(),
                                ));
                              },
                              color: Colors.blue,
                              disabledColor: Colors.blue,
                              padding: EdgeInsets.all(15.0),
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 95,
                                    ),
                                    SizedBox(
                                      child: Icon(FontAwesomeIcons.link, color: Colors.white, size: 15,),
                                      width: 30,
                                    ),
                                    SizedBox(
                                      child: Text(
                                        "CREATE DPL",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            width: ScreenUtil.getInstance().setWidth(750),
                          ),
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


