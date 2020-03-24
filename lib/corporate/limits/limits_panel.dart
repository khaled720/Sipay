import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../dashboard/merchant.dart';
import 'limit_increase.dart';

class limits_Panel extends StatefulWidget {
  limits_Panel({Key key}) : super(key: key);
  @override
  _limits_Panel createState() => _limits_Panel();
}

class _limits_Panel extends State<limits_Panel> {
  var _Limit_data = [
    {
      "title": "One Time Limit",
      "description": "MAXIUIM ONE TIME PAYMENT LIMIT",
      "samount": "2.000,00 TL",
      "eamount": "7.500,00 TL",
    },
    {
      "title": "Daily Limit",
      "description": "MAXIMIM PAYMENT LIMIT IN A DAY",
      "samount": "75.00,00 TL",
      "eamount": "7.500,00 TL",
    },
    {
      "title": "Daily Limit",
      "description": "MAXIMIM PAYMENT LIMIT IN A MONTH",
      "samount": "24.950,00 TL",
      "eamount": "25.000,00 TL",
    }
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
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          child: Text(
                            'LIMIT INFORMATION',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          child: Text(
                            'You can view, edit and request new limits.',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black38),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          child: Text(
                            'ABAILABLE LIMIT',
                            style:
                                TextStyle(fontSize: 13, color: Colors.black26),
                          ),
                          alignment: Alignment.centerRight,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          child: Text(
                            'TOTAL LIMIT',
                            style:
                                TextStyle(fontSize: 13, color: Colors.black26),
                          ),
                          alignment: Alignment.centerRight,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: new ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _Limit_data.length,
                      primary: true,
                      itemBuilder: (BuildContext content, int index) {
                        return Limits_list(
                            title: _Limit_data[index]['title'],
                            description: _Limit_data[index]['description'],
                            samount: _Limit_data[index]['samount'],
                            eamount: _Limit_data[index]['eamount']);
                      },
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
                              builder: (context) => limits_Increase(),
                            ));
                      },
                      color: Colors.blue,
                      disabledColor: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "REQUEST NEW LIMIT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    width: ScreenUtil.getInstance().setWidth(750),
                  ),
                ],
              ),
            ),
            Dashboardbottom(context, null),
          ],
        ));
  }

  Widget Limits_list(
      {String title, String description, String samount, String eamount}) {
    return new GestureDetector(
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
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Text(
                      samount,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 14),
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
                        description,
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      ),
                    ),
                    Text(
                      eamount,
                      style: TextStyle(fontSize: 12, color: Colors.black38),
                    ),
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
            color: Colors.black26,
            height: 0.8,
          )
        ],
      ),
    );
  }
}
