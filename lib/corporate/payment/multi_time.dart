import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/payment/multitime_success.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

TextEditingController _SMSController = TextEditingController();

Widget Multi_Time() {
  return Multi_Time_panel();
}

class Multi_Time_panel extends StatefulWidget {
  Multi_Time_panel({Key key}) : super(key: key);
  @override
  _Multi_Time_panel createState() => _Multi_Time_panel();
}

class _Multi_Time_panel extends State<Multi_Time_panel> {
  bool check_state = true;
  bool _remember = false;

  var _try_value = "TRY";
  List<String> _listtryData = ["TRY", "TRYS"];

  DateTime startdate;
  String _time = "";

  void startDatePicker() async {
    var order = await getDate();
    setState(() {
      startdate = order;
    });
  }

  Future<DateTime> getDate() {
    // Imagine that this function is
    // more complex and slow.
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
  }

//  Future<DateTime> getTime() {
//    return showDatePicker(context,
//        showTitleActions: true,
//        minTime: DateTime(2018, 3, 5),
//        maxTime: DateTime(2019, 6, 7), onChanged: (date) {
//          print('change $date');
//        }, onConfirm: (date) {
//          print('confirm $date');
//        }, currentTime: DateTime.now(), locale: LocaleType.zh);
//  };

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
                title: Text("MULTI TIME LINK"),
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
                            'CREATE MULTI TIME LINK',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
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
                                "Create payment link that works multiple times until it reaches it's limit",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(100),
                              ),
                              Text(
                                'AMOUNT',
                                style: TextStyle(
                                    color: check_state
                                        ? Colors.black26
                                        : Colors.red,
                                    fontSize: 12),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: TextFormField(
                                        style: TextStyle(
                                            color: check_state
                                                ? Colors.black
                                                : Colors.red),
                                        keyboardType: TextInputType.number,
                                        onChanged: (text) {
                                          if (text.length > 0 && !check_state) {
                                            setState(() {
                                              check_state = true;
                                            });
                                          }
                                        },
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 0.5)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black26,
                                                  width: 0.5)),
                                          prefixIcon: check_state
                                              ? const Icon(
                                                  Icons.map,
                                                  size: 16,
                                                  color: Colors.black26,
                                                )
                                              : const Icon(
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
                                            Icons.keyboard_arrow_down,
                                            size: 16,
                                            color: Colors.black26,
                                          ),
                                          items: _listtryData
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 10,
                                                  ),
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
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(right: 5, left: 5),
                                      child: Container(
                                        decoration: new BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              //                   <--- left side
                                              color: Colors.black12,
                                              width: 0.5,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: RaisedButton(
//                                                shape: RoundedRectangleBorder(
//                                                    borderRadius: BorderRadius.circular(5.0)),
//                                                elevation: 4.0,
                                                onPressed: () {
                                                  DatePicker.showTimePicker(
                                                      context,
                                                      theme: DatePickerTheme(
                                                        containerHeight: 210.0,
                                                      ),
                                                      showTitleActions: true,
                                                      onConfirm: (time) {
                                                    _time =
                                                        '${time.hour} : ${time.minute} : ${time.second}';
                                                    setState(() {});
                                                  },
                                                      currentTime:
                                                          DateTime.now(),
                                                      locale: LocaleType.en);
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 50.0,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Container(
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Icon(
                                                                  Icons
                                                                      .access_time,
                                                                  size: 16,
                                                                  color: Colors
                                                                      .black26,
                                                                ),
                                                                Text(
                                                                  " $_time",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black87,
                                                                      fontSize:
                                                                          16),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        size: 16,
                                                        color: Colors.black26,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                        padding:
                                            EdgeInsets.only(right: 5, left: 5),
                                        child: Container(
                                          decoration: new BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.black26,
                                                width: 0.5,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Icon(
                                                FontAwesomeIcons.calendarAlt,
                                                color: Colors.black26,
                                                size: 16,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  startdate == null
                                                      ? ''
                                                      : startdate.day
                                                              .toString() +
                                                          '.' +
                                                          startdate.month
                                                              .toString() +
                                                          '.' +
                                                          startdate.year
                                                              .toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              IconButton(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    size: 16,
                                                    color: Colors.black26,
                                                  ),
                                                  onPressed: () {
                                                    startDatePicker();
                                                  }),
                                            ],
                                          ),
                                        )),
                                    flex: 1,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                'EXPLANATION',
                                style: TextStyle(
                                    color: check_state
                                        ? Colors.black26
                                        : Colors.red,
                                    fontSize: 11),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                style: TextStyle(color: Colors.black),
                                keyboardType: TextInputType.number,
                                controller: _SMSController,
                                decoration: InputDecoration(
//                                  hintStyle: CustomTextStyle.formField(context),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 0.5)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 0.5)),
                                  prefixIcon: const Icon(
                                    Icons.check,
                                    color: Colors.black26,
                                    size: 17,
                                  ),
                                ),
                                obscureText: false,
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(50),
                              ),
                              Text(
                                'EXPLANATION',
                                style: TextStyle(
                                    color: check_state
                                        ? Colors.black26
                                        : Colors.red,
                                    fontSize: 11),
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
                                      size: 17,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Please enter an explanation.',
                                      style: TextStyle(
                                          color: check_state
                                              ? Colors.black26
                                              : Colors.red,
                                          fontSize: 18),
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
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Multitime_Success(),
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
                                    child: Icon(
                                      FontAwesomeIcons.link,
                                      color: Colors.white,
                                      size: 15,
                                    ),
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
                        SizedBox(
                          height: 30,
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
