import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/payment/dpl_details.dart';
import 'package:fluttersipay/corporate/payment/dql_passivedetail.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget Dpl_History() {
  return  Dpl_History_Panel();
}

class Dpl_History_Panel extends StatefulWidget {
  Dpl_History_Panel({Key key}) : super(key: key);
  @override
  _Dpl_History_Panel createState() => _Dpl_History_Panel();
}

class _Dpl_History_Panel extends State<Dpl_History_Panel> {

  var _active_data = [
    {
      "title": "#334 - One Time Link",
      "value": "102,00 TL",
      "created": "CREATED",
      "expiry": "EXPIRY",
      "created_date": "11.09.2019 - 12:00",
      "expiry_date": "12.09.2019 - 13:48",
    },
    {
      "title": "#334 - One Time Link",
      "value": "102,00 TL",
      "created": "CREATED",
      "expiry": "EXPIRY",
      "times": "TIMES USED",
      "created_date": "11.09.2019 - 12:00",
      "expiry_date": "12.09.2019 - 13:48",
      "times_used": "14/29"
    }
  ];
  var _passive_data = [
    {
      "title": "#334 - One Time Link",
      "value": "102,00 TL",
      "created": "CREATED",
      "expiry": "EXPIRY",
      "created_date": "11.09.2019 - 12:00",
      "expiry_date": "12.09.2019 - 13:48",
    },
    {
      "title": "#334 - One Time Link",
      "value": "102,00 TL",
      "created": "CREATED",
      "expiry": "EXPIRY",
      "times": "TIMES USED",
      "created_date": "11.09.2019 - 12:00",
      "expiry_date": "12.09.2019 - 13:48",
      "times_used": "14/29"
    }
  ];


  bool incoming_state =true;
  int _index = 0;
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
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("DPL HISTORY"),
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
                height: 30,
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
                                    //                   <--- left side
                                    color: incoming_state ? Colors.blue : Colors.black26,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: SizedBox(
                                    width: ScreenUtil.getInstance().setWidth(345),
                                    child: OutlineButton(
                                      onPressed: _updateincoming,
                                      borderSide: new BorderSide(
                                        style: BorderStyle.none,
                                      ),
                                      child: new Text(
                                        'ACTIVE LINKS',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: incoming_state
                                                ? Colors.blue
                                                : Colors.black26,
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
                                    //                   <--- left side
                                    color: incoming_state ? Colors.black26 : Colors.blue,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: SizedBox(
                                  width: ScreenUtil.getInstance().setWidth(345),
                                  child: OutlineButton(
                                    onPressed: _updateincoming,
                                    borderSide: new BorderSide(
                                      style: BorderStyle.none,
                                    ),
                                    child: new Text(
                                      'PASSIVE LINKS',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: incoming_state
                                              ? Colors.black26
                                              : Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )),
                        )
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
                  itemCount: incoming_state?_active_data.length : _passive_data.length,
                  primary: true,
                  itemBuilder: (BuildContext content, int index){
                    return in_out_list(
                        title: incoming_state ? _active_data[index]["title"] : _passive_data[index]['title'],
                        value:incoming_state ? _active_data[index]["value"] : _passive_data[index]['value'],
                        created: incoming_state ? _active_data[index]["created"] : _passive_data[index]['created'],
                        created_dates: incoming_state ? _active_data[index]["created_date"] : _passive_data[index]['created_date'],
                        expiry: incoming_state ? _active_data[index]["expiry"] : _passive_data[index]['expiry'],
                        expiry_dates: incoming_state ? _active_data[index]["expiry_date"] : _passive_data[index]['expiry_date'],
                        times: incoming_state ? _active_data[index]["times"] : _passive_data[index]['times'],
                        times_used: incoming_state ? _active_data[index]["times_used"] : _passive_data[index]['times_used'],
                    );
                  },
                ),
              ),
            ],
          ),
        )
    );
  }


  void _updateincoming() {
    setState(() {
      incoming_state = ! incoming_state;
    });
  }

  Widget in_out_list({String title, String value, String created, String created_dates,String expiry, String expiry_dates,String times, String times_used,}) {
    return new GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => incoming_state? Dpl_detail() : Dpl_Passivedetal(),
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
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
                                  fontWeight: FontWeight.bold
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
                                  created
                              ),
                            ),
                            Text(
                              created_dates,
                              textAlign: TextAlign.right,
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  expiry
                              ),
                            ),
                            Text(
                              expiry_dates,
                              textAlign: TextAlign.right,
                            )
                          ],
                        )
                      ],
                    ),
                    padding: EdgeInsets.only(right: 10),
                  ),
                ),
                incoming_state?
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.content_copy,
                          color: Colors.black,
                          size: 18,
                        ),
                        width: 35,
                      ),
                      Container(
                        child: Icon(
                          FontAwesomeIcons.trash,
                          color: Colors.red,
                          size: 18,
                        ),
                        width: 35,
                      ),
                    ],
                  ),
                  width: 70,
                )
                :
                Container()
              ],
            ),
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
