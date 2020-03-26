import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/payment_method/mobilepos_success.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'mobilepos_failed.dart';

import 'mobilepos_success.dart';

class Customer_Signature extends StatefulWidget {
  Customer_Signature({Key key}) : super(key: key);
  @override
  _Customer_Signature createState() => _Customer_Signature();
}
class _Customer_Signature extends State<Customer_Signature> {
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
          title: Text('CREDIT CARD DETAILS'),
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
                    height: 70,
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/mobile/sign.png',
                          height: ScreenUtil.getInstance().setHeight(650),
                        ),
//                        SizedBox(
//                          width: 230,
//                          height: 230,
//                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height:
                    ScreenUtil.getInstance().setHeight(100),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "By signing here, you agree to the terms of use and privacy policy.",
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
                    ScreenUtil.getInstance().setHeight(100),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Customer signature confirming the transaction.",
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
                    height: 40,
                  ),
                  Container(
                    width: ScreenUtil.getInstance().setWidth(690),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Mobilepos_Success()
//   faild                         builder: (context) => Mobilepos_Failed()
                        ));
                      },
                      color: Colors.blue,
                      disabledColor: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'COMPLETE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

}
