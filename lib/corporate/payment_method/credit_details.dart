import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/dashboard/support.dart';
import 'package:fluttersipay/corporate/payment_method/customer_signature.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'nfc.dart';

class Credit_Details extends StatefulWidget {
  Credit_Details({Key key}) : super(key: key);
  @override
  _Credit_Details createState() => _Credit_Details();
}
class _Credit_Details extends State<Credit_Details> {
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
                            
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Live_Support(),
                                          ));
                                    
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
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 25.0, right: 0),
                        child: Container(
                          child: OutlineButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Nfc_Panel(),
                              ));
                            },
                            borderSide: BorderSide(
                              color: Colors.black26, //Color of the border
                              style: BorderStyle.solid, //Style of the border
                              width: 0.8, //width of the border
                            ),
                            color: Colors.white,
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  child: Icon(FontAwesomeIcons.wifi, color: Colors.black, size: 15,),
                                  width: 30,
                                ),
                                SizedBox(
                                  child: Text(
                                    "NFC",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          width: ScreenUtil.getInstance().setWidth(300),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25.0, right: 0),
                        child: Container(
                          child: OutlineButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            borderSide: BorderSide(
                              color: Colors.black26, //Color of the border
                              style: BorderStyle.solid, //Style of the border
                              width: 0.8, //width of the border
                            ),
                            color: Colors.white,
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  child: Icon(FontAwesomeIcons.camera, color: Colors.black, size: 15,),
                                  width: 30,
                                ),
                                SizedBox(
                                  child: Text(
                                    "OCR",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          width: ScreenUtil.getInstance().setWidth(300),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/mobile/cc.png',
                          height: ScreenUtil.getInstance().setHeight(350),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "You can manually enter card information.\nInstallment options appear when the\ncard information is filled.",
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
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'INSTALLMENTS',
                          style: TextStyle(
                              color: Colors.black26, fontSize: 12),
                        ),
                        SizedBox(
                          height:
                          ScreenUtil.getInstance().setHeight(20),
                        ),
                        DropdownButton<String>(
                          icon: Icon(Icons.keyboard_arrow_down, color: Colors.black26,),
                          items: ['SINGLE PAYMENT', 'MULTI PAYMENT']
                              .map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(Icons.note, color: Colors.black26, size: 18,),
                                      SizedBox(width: 20),
                                      Expanded(
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.black87),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          },
                          value: _value,
                          isExpanded: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:
                    ScreenUtil.getInstance().setHeight(60),
                  ),
                  Container(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Customer_Signature(),
                        ));
                      },
                      color: Colors.blue,
                      disabledColor: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'CONTINUE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    width: ScreenUtil.getInstance().setWidth(660),
                  ),
                  SizedBox(
                    height:
                    ScreenUtil.getInstance().setHeight(40),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

}
