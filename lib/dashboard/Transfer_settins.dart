import 'dart:convert';

import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Deposit/create_deposit_card.dart';
import 'package:fluttersipay/bottom_navigator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'merchant_panel.dart';


Widget Transfer_Settings() {
  return Transfer_SettingsPanel();
}

class Transfer_SettingsPanel extends StatefulWidget {
  Transfer_SettingsPanel({Key key}) : super(key: key);
  @override
  _Transfer_SettingsPanel createState() => _Transfer_SettingsPanel();
}

class _Transfer_SettingsPanel extends State<Transfer_SettingsPanel> {

  var _priority_value = "AVAILABLE BALANCE";
  List<String> _priority_data = [
    "AVAILABLE BALANCE",
    "AVAILABLE BALANCES"
  ];
  bool isallowed = false;
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
          title: Text('TRANSFER SETTINGS'),
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
              child: Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'MONEY TRANSFER SETTINGS',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'MONEY TRANSFER REQUEST',
                      style: TextStyle(
                          color: Colors.black54, fontSize: 12),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Icon(
                            FontAwesomeIcons.userEdit,
                            color: Colors.black26,
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Text(
                            'ALLOW REQUESTS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isallowed = !isallowed;
                              });
                            },
                            child: Center(
                              child: CustomSwitchButton(
                                backgroundColor: Colors.blueGrey,
                                unCheckedColor: Colors.white,
                                animationDuration: Duration(milliseconds: 400),
                                checkedColor: Colors.lightGreen,
                                checked: isallowed,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.black26,
                      height: 1.0,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          // set the default style for the children TextSpans
                            style: TextStyle(
                                fontSize: 13, wordSpacing: 3),
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.info, size: 14,color: Colors.black45,),
                              ),
                              TextSpan(
                                  text: 'Turning this option off prevents other users from requesting money from you. Sending and requesting money functions are not affected by this optiion.',
                                  style: TextStyle(color: Colors.black45)),
                            ])),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'MONEY TRANSFER PRIORITY',
                      style: TextStyle(
                          color: Colors.black54, fontSize: 12),
                    ),
                    DropdownButton<String>(
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: _priority_data
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
                          _priority_value = value;
                        });
                      },
                      value: _priority_value,
                      isExpanded: true,
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(250),
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
                      height: 60,
                    )
                  ],
                ),
              ),
            ),
            Dashboardbottom(context),
          ],
        ));
  }


}

