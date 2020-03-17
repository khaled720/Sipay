import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Login/icons.dart';
import 'package:fluttersipay/Money/Send_individual.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



Widget Limit_Success() {
  return Limit_success_panel();
}

class Limit_success_panel extends StatefulWidget {
  Limit_success_panel({Key key}) : super(key: key);
  @override
  _Limit_success_panel createState() => _Limit_success_panel();
}

class _Limit_success_panel extends State<Limit_success_panel> {
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
        title: Text("MOBILE POS LIMITS"),
        flexibleSpace: Image(
          image: AssetImage('assets/appbar_bg.png'),
          height: 120,
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
              height: ScreenUtil.getInstance().setHeight(50),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: ScreenUtil.getInstance().setHeight(250),
                    ),
                  ),
                  height: ScreenUtil.getInstance().setHeight(280),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(40),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'SUCCESSFUL',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(120),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Your limit increase request has been created. You will be informed by our team as soon as possible.',
                      style: TextStyle(color: Colors.black45, fontSize: 18, height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(250),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Container(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.blue,
                      disabledColor: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "DASHBOARD",
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
                  height: ScreenUtil.getInstance().setHeight(40),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
