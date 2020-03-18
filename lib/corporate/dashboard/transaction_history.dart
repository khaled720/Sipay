import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/dashboard/transaction_detail.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'merchant.dart';

TextEditingController search_controller = new TextEditingController();

Widget C_Transaction_History() {
  return Transaction_Panel();
}

class Transaction_Panel extends StatefulWidget {
  Transaction_Panel({Key key}) : super(key: key);
  @override
  _Transaction_Panel createState() => _Transaction_Panel();
}

class _Transaction_Panel extends State<Transaction_Panel> {
  var _Transcation_data = [
    {
      "title": "Payment by Credit Card",
      "value": "- 100,50 ₺",
      "IDS": "Transaction ID: #766566",
      "dates": "13:48 - 14.09.2019",
      "type": "0"
    },
    {
      "title": "Payment by Wallet",
      "value": "+ 100,50 ₺",
      "IDS": "Transaction ID: #1238",
      "dates": "13:48 - 14.09.2019",
      "type": "1"
    },
    {
      "title": "Payment by Mobile",
      "value": "100,50 ₺",
      "IDS": "Transaction ID: #125457",
      "dates": "13:48 - 14.09.2019",
      "type": "2"
    },
    {
      "title": "Payment by Wallet",
      "value": "+ 100,50 ₺",
      "IDS": "Transaction ID: #1238",
      "dates": "13:48 - 14.09.2019",
      "type": "1"
    },
    {
      "title": "Payment by Wallet",
      "value": "+ 100,50 ₺",
      "IDS": "Transaction ID: #1238",
      "dates": "13:48 - 14.09.2019",
      "type": "1"
    },
    {
      "title": "Payment by Mobile",
      "value": "100,50 ₺",
      "IDS": "Transaction ID: #125457",
      "dates": "13:48 - 14.09.2019",
      "type": "2"
    },
    {
      "title": "Payment by Wallet",
      "value": "+ 100,50 ₺",
      "IDS": "Transaction ID: #1238",
      "dates": "13:48 - 14.09.2019",
      "type": "1"
    },
  ];

  var _try_value = "TRY";
  List<String> _listtryData = ["TRY", "TRYS"];
  var _type_value = "TYPE";
  List<String> _listtypeData = ["TYPE", "TYPES"];
  var _status_value = "STATUS";
  List<String> _list_status_Data = ["STATUS", "TYPES"];
  DateTime enddate;
  DateTime startdate;

  void startDatePicker() async {
    var order = await getDate();
    setState(() {
      startdate = order;
    });
  }

  void endDatePicker() async {
    var order = await getDate();
    setState(() {
      enddate = order;
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
          title: Text('TRANSACTION HISTORY'),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                  padding: EdgeInsets.only(right: 5, left: 5),
                                  child: Container(
                                    decoration: new BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.black54,
                                          width: 1.0,
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
                                          color: Colors.black45,
                                          size: 16,
                                        ),
                                        Expanded(
                                          child: Text(
                                            startdate == null
                                                ? ''
                                                : startdate.day.toString() +
                                                    '.' +
                                                    startdate.month.toString(),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        IconButton(
                                            alignment: Alignment.centerRight,
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 16,
                                              color: Colors.black45,
                                            ),
                                            onPressed: () {
                                              startDatePicker();
                                            }),
                                      ],
                                    ),
                                  )),
                              flex: 1,
                            ),
                            Expanded(
                              child: Padding(
                                  padding: EdgeInsets.only(right: 5, left: 5),
                                  child: Container(
                                    decoration: new BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.black54,
                                          width: 1.0,
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
                                          color: Colors.black45,
                                          size: 16,
                                        ),
                                        Expanded(
                                          child: Text(
                                            enddate == null
                                                ? ''
                                                : enddate.day.toString() +
                                                    '.' +
                                                    enddate.month.toString(),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        IconButton(
                                            alignment: Alignment.centerRight,
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 16,
                                              color: Colors.black45,
                                            ),
                                            onPressed: () {
                                              endDatePicker();
                                            }),
                                      ],
                                    ),
                                  )),
                              flex: 1,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 5, left: 5),
                                child: Container(
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
                                      items: _listtryData
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              SizedBox(width: 10),
                                              Expanded(
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      color: Colors.black45),
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
                                ),
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 5, left: 5),
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: search_controller,
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    prefixIcon: const Icon(
                                      FontAwesomeIcons.search,
                                      size: 16,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  obscureText: false,
                                ),
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 5, left: 5),
                                child: Container(
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
                                      items: _list_status_Data
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              SizedBox(width: 10),
                                              Expanded(
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      color: Colors.black45),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _status_value = value;
                                        });
                                      },
                                      value: _status_value,
                                      isExpanded: true,
                                    ),
                                  ),
                                ),
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 5, left: 5),
                                child: Container(
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
                                      items: _listtypeData
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              SizedBox(width: 10),
                                              Expanded(
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      color: Colors.black45),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _type_value = value;
                                        });
                                      },
                                      value: _type_value,
                                      isExpanded: true,
                                    ),
                                  ),
                                ),
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          child: Text(
                            'ALL TRANSACTIONS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                decoration: new BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.black26,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Container(
                                decoration: new BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.blue,
                                      width: 2.5,
                                    ),
                                  ),
                                ),
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Container(
                                decoration: new BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.black26,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: new ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _Transcation_data.length,
                      primary: true,
                      itemBuilder: (BuildContext content, int index) {
                        return Transaction_list(
                            title: _Transcation_data[index]['title'],
                            value: _Transcation_data[index]['value'],
                            IDS: _Transcation_data[index]['IDS'],
                            dates: _Transcation_data[index]['dates'],
                            type: _Transcation_data[index]['type']);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),
            Dashboardbottom(context),
          ],
        ));
  }

  Widget Transaction_list(
      {String title, String value, String IDS, String dates, String type}) {
    var _color;
    if (type == "0")
      _color = Colors.red;
    else if (type == "1")
      _color = Colors.green;
    else if (type == "2") _color = Colors.blue;
    return new GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => C_Transaction_detail(),
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Padding(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Text(
                      value,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _color,
                      ),
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(IDS),
                    ),
                    Text(
                      dates,
                      textAlign: TextAlign.right,
                    )
                  ],
                )
              ],
            ),
            padding: EdgeInsets.only(right: 30, left: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.black45,
            height: 1.0,
          )
        ],
      ),
    );
  }
}
