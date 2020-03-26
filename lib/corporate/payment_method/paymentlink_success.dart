import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/payment_method/mobilepos_success.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Paymentlink_Success extends StatefulWidget {
  Paymentlink_Success({Key key}) : super(key: key);
  @override
  _Paymentlink_Success createState() => _Paymentlink_Success();
}
class _Paymentlink_Success extends State<Paymentlink_Success> {
  var _value = 'SINGLE PAYMENT';

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
          title: Text('PAYMENT LINK'),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: ScreenUtil.getInstance().setHeight(240),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(50),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'SUCCESS',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height:
                    ScreenUtil.getInstance().setHeight(70),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Payment link has been sent successfully.\nYou can follow transaction status this page or from 'Transaction History' menu.",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black45,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height:
                    ScreenUtil.getInstance().setHeight(50),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Image.asset(
                          'assets/down_time.png',
                          height: ScreenUtil.getInstance().setHeight(140),
                        ),
                        width: 160,
                      ),
                      Expanded(
                        child: Text(
                          'Remaining time until the link is valid.',
                          style: TextStyle(color: Colors.black45, fontSize: 16, height: 1.8),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Text('Transaction ID', style: TextStyle(color: Colors.black45, fontSize: 15)),
                      ),
                      Expanded(
                        child: Container(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                '#391023',
                                style: TextStyle(color: Colors.black87, fontSize: 15),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black26,
                    height: 1.0,
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Text('Status', style: TextStyle(color: Colors.black45, fontSize: 15)),
                      ),
                      Expanded(
                        child: Container(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'Pending',
                                style: TextStyle(color: Colors.black87, fontSize: 15),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black26,
                    height: 1.0,
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(50),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Text('Amount', style: TextStyle(color: Colors.black45, fontSize: 15)),
                      ),
                      Expanded(
                        child: Container(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                '25,00₺',
                                style: TextStyle(color: Colors.black87, fontSize: 15),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black26,
                    height: 1.0,
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(50),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Text('Customer GSM', style: TextStyle(color: Colors.black45, fontSize: 15)),
                      ),
                      Expanded(
                        child: Container(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                '+90 555 987 65 43',
                                style: TextStyle(color: Colors.black87, fontSize: 15),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black26,
                    height: 1.0,
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(50),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

}
