import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:fluttersipay/corporate/payment/one_time.dart';

class Payment_Link extends StatefulWidget {
  Payment_Link({Key key}) : super(key: key);
  @override
  _Payment_Link createState() => _Payment_Link();
}
class _Payment_Link extends State<Payment_Link> {
 
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
          title: Text('DERECT PAYMENT LINK'),
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
                            'ONE TIME',
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
                            'Create payment link that works just one time.',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black38
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> One_Time(),
                        ));
                      },
                      color: Colors.blue,
                      disabledColor: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 100,
                            ),
                            SizedBox(
                              child: Icon(FontAwesomeIcons.link, color: Colors.white, size: 15,),
                              width: 30,
                            ),
                            SizedBox(
                              child: Text(
                                "ONE TIME",
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
                  Divider(
                    color: Colors.black26,
                    height: 1.0,
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
                            'MULTI TIME',
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
                            "Create payment link that works multiple times until it reaches it's limit.",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black38
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.pop(context);
//                        Navigator.push(context, MaterialPageRoute(
//                          builder: (context)=> limits_Increase(),
//                        ));
                      },
                      color: Colors.blue,
                      disabledColor: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 100,
                            ),
                            SizedBox(
                              child: Icon(FontAwesomeIcons.list, color: Colors.white, size: 15,),
                              width: 30,
                            ),
                            SizedBox(
                              child: Text(
                                "MULTI TIME",
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
                  Divider(
                    color: Colors.black26,
                    height: 1.0,
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
                            'DPL HISTORY',
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
                            "See all the direct payment link transaction details.",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black38
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.pop(context);
//                        Navigator.push(context, MaterialPageRoute(
//                          builder: (context)=> limits_Increase(),
//                        ));
                      },
                      color: Colors.blue,
                      disabledColor: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 100,
                            ),
                            SizedBox(
                              child: Icon(FontAwesomeIcons.backward, color: Colors.white, size: 15,),
                              width: 30,
                            ),
                            SizedBox(
                              child: Text(
                                "DPL HISTORY",
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
                    height: 35,
                  ),
                  Divider(
                    color: Colors.black26,
                    height: 1.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: FlatButton(
                      onPressed: (){
//                        Send_money();
                      },
                      child: Text(
                        "HOW TO?",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget Limits_list({String title, String description, String samount, String eamount}) {

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
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),
                      ),
                    ),
                    Text(
                      samount,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 14
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
                        description,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black45
                        ),
                      ),
                    ),
                    Text(
                      eamount,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black38
                      ),
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
            height:0.8,
          )
        ],
      ),
    );
  }
}
