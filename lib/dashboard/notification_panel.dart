import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'merchant_panel.dart';

Widget Notification_Panel() {
  return NotificationPanel();
}

class NotificationPanel extends StatefulWidget {
  NotificationPanel({Key key}) : super(key: key);
  @override
  _NotificationPanel createState() => _NotificationPanel();
}

class _NotificationPanel extends State<NotificationPanel> {
  var _notification_data = [
    {
      "title": "Money Transfer completed",
      "dates": "13:48 - 12.09.2019",
      "description": " Simply dummy text of the printing and typesetting",
    },
    {
      "title": "Payment Successful via Virtual POS",
      "dates": "13:48 - 12.09.2019",
      "description": "  Simply dummy text of the printing and typesetting",
    },
    {
      "title": "10% Refund added to your account!",
      "dates": "13:48 - 12.09.2019",
      "description": "  Simply dummy text of the printing and typesetting",
    },
    {
      "title": "Payment Successful via Payment Link",
      "dates": "13:48 - 12.09.2019",
      "description": "  Simply dummy text of the printing and typesetting",
    },
    {
      "title": "Money Transfer completed",
      "dates": "13:48 - 12.09.2019",
      "description": " Simply dummy text of the printing and typesetting",
    },
    {
      "title": "Money Transfer completed",
      "dates": "13:48 - 12.09.2019",
      "description": " Simply dummy text of the printing and typesetting",
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
          title: Text('NOTIFICATIONS'),
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
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 30.0,
                        right: 30.0,
                        top: ScreenUtil.getInstance().setHeight(40)),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'ALL NOTIFICATIONS',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black87,
                          ),
                        ),
                        Expanded(
                            child: Align(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: const Color(0xFFc14b6f),
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.settings,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(20),
                  ),
                  Container(
                    child: new ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _notification_data.length,
                      primary: true,
                      itemBuilder: (BuildContext content, int index) {
                        return notificationlist(
                            title: _notification_data[index]["title"],
                            dates: _notification_data[index]["dates"],
                            description: _notification_data[index]
                                ["description"]);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
            Dashboardbottom(context, null, null, UserTypes.Individual),
          ],
        ));
  }

  Widget notificationlist({String title, String dates, String description}) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                    Expanded(
                      child: IconButton(
                        alignment: Alignment.centerRight,
                        icon: const Icon(
                          FontAwesomeIcons.trash,
                          color: const Color(0xFFc14b6f),
                          size: 15,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  child: Text(
                    dates,
                    style: TextStyle(
//                          fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.black45),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(40),
                ),
                Text(
                  description,
                  style: TextStyle(
//                          fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black45),
                  textAlign: TextAlign.left,
                )
              ],
            )),
        SizedBox(
          height: 20,
        ),
        Divider(
          color: Colors.black26,
          height: 1.0,
        )
      ],
    );
  }
}
