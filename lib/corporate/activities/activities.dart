import 'dart:convert';

///import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttersipay/corporate/activities/activities_detail.dart';


TextEditingController search_controller = new TextEditingController();

Widget C_Activities() {
  return C_Activities_Panel();
}

class C_Activities_Panel extends StatefulWidget {
  C_Activities_Panel({Key key}) : super(key: key);
  @override
  _C_Activities_Panel createState() => _C_Activities_Panel();
}

class _C_Activities_Panel extends State<C_Activities_Panel> {
  var _Transcation_data = [
    {
      "title": "Money Transfer",
      "value": "- 100,50 ₺",
      "IDS": "Transaction ID: #766566",
      "dates": "13:48 - 14.09.2019",
      "type": "0"
    },
    {
      "title": "Deposit",
      "value": "+ 100,50 ₺",
      "IDS": "Transaction ID: #1238",
      "dates": "13:48 - 14.09.2019",
      "type": "1"
    },
    {
      "title": "Exchange",
      "value": "100,50 ₺",
      "IDS": "Transaction ID: #125457",
      "dates": "13:48 - 14.09.2019",
      "type": "2"
    },
    {
      "title": "Whitdrawal",
      "value": "+ 100,50 ₺",
      "IDS": "Transaction ID: #1238",
      "dates": "13:48 - 14.09.2019",
      "type": "1"
    },
    {
      "title": "Money Transfer",
      "value": "+ 100,50 ₺",
      "IDS": "Transaction ID: #1238",
      "dates": "13:48 - 14.09.2019",
      "type": "1"
    },
    {
      "title": "Deposit",
      "value": "100,50 ₺",
      "IDS": "Transaction ID: #125457",
      "dates": "13:48 - 14.09.2019",
      "type": "2"
    },
    {
      "title": "Exchange",
      "value": "+ 100,50 ₺",
      "IDS": "Transaction ID: #1238",
      "dates": "13:48 - 14.09.2019",
      "type": "1"
    },
  ];

  var links_state = 0;
  var active_state = 0;

  var _try_value = "TRY";
  List<String> _listtryData = ["TRY", "TRYS"];

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
          title: Text('ACTIVITIES'),
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
                    height: 30,
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'SELECT RANCE',
                                  style: TextStyle(color: Colors.black26, fontSize: 12),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'CURRENCY',
                                  style: TextStyle(color: Colors.black26, fontSize: 12),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),

                    ),
                  ),
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
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: IntrinsicWidth(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  decoration: new BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: (links_state == 0) ? Colors.blue : Colors.black26,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                        width: ScreenUtil.getInstance().setWidth(345),
                                        child: OutlineButton(
                                          onPressed: () => _updateactive(0),
                                          borderSide: new BorderSide(
                                            style: BorderStyle.none,
                                          ),
                                          child: Text(
                                            'ALL',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: (active_state == 0) ? Colors.blue : Colors.black26,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                  decoration: new BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: (active_state == 1) ? Colors.blue : Colors.black26,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                        width: ScreenUtil.getInstance().setWidth(345),
                                        child: OutlineButton(
                                          onPressed: () => _updateactive(1),
                                          borderSide: new BorderSide(
                                            style: BorderStyle.none,
                                          ),
                                          child: Text(
                                            'INCOMING',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: (active_state == 1) ? Colors.blue : Colors.black26,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                  decoration: new BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: (active_state == 2) ? Colors.blue : Colors.black26,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                        width: ScreenUtil.getInstance().setWidth(345),
                                        child: OutlineButton(
                                          onPressed: () => _updateactive(2),
                                          borderSide: new BorderSide(
                                            style: BorderStyle.none,
                                          ),
                                          child: Text(
                                            'OUTGOING',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: (links_state == 2) ? Colors.blue : Colors.black26,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                  decoration: new BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: (active_state == 3) ? Colors.blue : Colors.black26,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                        width: ScreenUtil.getInstance().setWidth(500),
                                        child: OutlineButton(
                                          onPressed: () => _updateactive(3),
                                          borderSide: new BorderSide(
                                            style: BorderStyle.none,
                                          ),
                                          child: Text(
                                            'EXCHANGE',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: (links_state == 3) ? Colors.blue : Colors.black26,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    width: ScreenUtil.getInstance().setWidth(750),
                    height: ScreenUtil.getInstance().setHeight(80),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: new ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _Transcation_data.length,
                      primary: true,
                      itemBuilder: (BuildContext content, int index){
                        return Transaction_list(
                            title:  _Transcation_data[index]['title'],
                            value:_Transcation_data[index]['value'],
                            IDS: _Transcation_data[index]['IDS'],
                            dates: _Transcation_data[index]['dates'],
                            type: _Transcation_data[index]['type']
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),
//            Dashboardbottom(context),
          ],
        ));
  }

  void _updateactive(int num) {
    active_state = num;
    setState(() {});
  }

  Widget Transaction_list({String title, String value, String IDS, String dates, String type}) {

    var _color;
    if(type =="0") _color = Colors.red;
    else if(type == "1") _color =Colors.green;
    else if(type == "2") _color = Colors.blue;
    return new GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => Activities_Detail(),
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
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
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
                      child: Text(
                          IDS,
                        style: TextStyle(color: Colors.black38),
                      ),
                    ),
                    Text(
                      dates,
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.black38),
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
