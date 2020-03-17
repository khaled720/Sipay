import 'dart:convert';

import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Deposit/create_deposit_card.dart';
import 'package:fluttersipay/bottom_navigator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'merchant.dart';


Widget C_Notification_Settings() {
  return Notification_SettingsPanel();
}

class Notification_SettingsPanel extends StatefulWidget {
  Notification_SettingsPanel({Key key}) : super(key: key);
  @override
  _Notification_SettingsPanel createState() => _Notification_SettingsPanel();
}

class _Notification_SettingsPanel extends State<Notification_SettingsPanel> {

  var _check_value = List<List<bool>>.generate(4,
          (i) => List<bool>.generate(3, (j) => false)
  );
  var _setting_data = [
    {
      "title": "Money Transfer",
      "description" : " Simply dummy text",
    },
    {
      "title": "Transaction Refunds",
      "description" : "Simply dummy text",
    },
    {
      "title": "Money Requests",
      "description" : "Simply dummy text",
    },
    {
      "title": "Weekly Report",
      "description" : " Simply dummy text",
    },
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
          title: Text('NOTIFICATION SETTINGS'),
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
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'NOTIFICATION SETTINGS',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Turn on or turn off notification options as desired.',
                          style: TextStyle(
                              color: Colors.black54, fontSize: 16),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.phone_android,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'APP',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black45
                                      ),
                                    )
                                  ],
                                ),
                                width: 40,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.commentDots,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'SMS',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black45
                                      ),
                                    )
                                  ],
                                ),
                                width: 40,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.email,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'E-MAIL',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black45
                                      ),
                                    )
                                  ],
                                ),
                                width: 40,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: new ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _setting_data.length,
                      primary: true,
                      itemBuilder: (BuildContext content, int index){
                        return setting_list(
                            title: _setting_data[index]["title"],
                            description: _setting_data[index]["description"],
                            number: index
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
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
                  ),
                  SizedBox(
                    height: 90,
                  )
                ],
              ),
            ),
            Dashboardbottom(context),
          ],
        ));
  }

  Widget setting_list({String title, String description, int number}) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
//                    fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                        description,
                        style: TextStyle(color: Colors.black38),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          child: Checkbox(
                            value: _check_value[number][0],
                            onChanged: (bool value) {
                              setState(() {
                                _check_value[number][0] = value;
                              });
                            },
                            checkColor: Colors.black38,
                          ),
                          width: 40,
                        ),
                        Container(
                          child: Checkbox(
                            value: _check_value[number][1],
                            onChanged: (bool value) {
                              setState(() {
                                _check_value[number][1] = value;
                              });
                            },
                            checkColor: Colors.black38,
                          ),
                          width: 40,
                        ),
                        Container(
                          child: Checkbox(
                            value: _check_value[number][2],
                            onChanged: (bool value) {
                              setState(() {
                                _check_value[number][2] = value;
                              });
                            },
                            checkColor: Colors.black38,
                          ),
                          width: 40,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Divider(
          color: Colors.black45,
          height: 1.0,
        ),
      ],
    );
  }


}

