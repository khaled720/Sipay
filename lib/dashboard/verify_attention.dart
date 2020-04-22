import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Money/success.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget Verify_attention() {
  return Verify_attention_panel();
}

class Verify_attention_panel extends StatefulWidget {
  Verify_attention_panel({Key key}) : super(key: key);
  @override
  _Verify_attention_panel createState() => _Verify_attention_panel();
}

class _Verify_attention_panel extends State<Verify_attention_panel> {
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
        title: Text("MONEY TRANSFER"),
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
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.error,
                      color: Colors.orange,
                      size: ScreenUtil.getInstance().setHeight(230),
                    ),
                  ),
                  height: ScreenUtil.getInstance().setHeight(250),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(40),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'ATTENTION',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 115.0, right: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              'assets/verify_attention.png',
                              height: ScreenUtil.getInstance().setHeight(400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(50),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.0, right: 30.0),
                  child: Text('You must verify your account to view this page.',
                      style: TextStyle(color: Colors.black45, fontSize: 15)),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(80),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 140.0, right: 30.0),
                      child: Container(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TransferSuccessScreen(null, null, null),
                                ));
                          },
                          color: Colors.blue,
                          disabledColor: Colors.blue,
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "BE VERIFIED",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        width: ScreenUtil.getInstance().setWidth(270),
                      ),
                    ),
                  ],
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
