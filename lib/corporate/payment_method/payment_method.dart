import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/dashboard/support.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'qr_code.dart';
import 'credit_details.dart';
import 'paymentlink_send.dart';
import 'paymentlink_success.dart';

class Payment_Method extends StatefulWidget {
  Payment_Method({Key key}) : super(key: key);
  @override
  _Payment_Method createState() => _Payment_Method();
}
class _Payment_Method extends State<Payment_Method> {

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
          title: Text('PAYMENT METHOD'),
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
                            
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Live_Support(),
                                          ));
                                    
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
                    height: 40,
                  ),
                  Container(
                    height: 120,
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> Credit_Details(),
                        ));
                      },
                      color: Colors.blue,
                      disabledColor: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                child: Icon(FontAwesomeIcons.wifi, color: Colors.white, size: 15,),
                                width: 30,
                              ),
                              SizedBox(
                                child: Text(
                                  "PAYMENT BY CREDIT CARD",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    height: 1.7
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox( height: 10,),
                          Text(
                            'Obtain card information automatically with\nNFC, OCR or enter manually.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, height: 1.7),
                          ),
                        ],
                      ),
                    ),
                    width: ScreenUtil.getInstance().setWidth(750),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black26,
                    height: 1.0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 120,
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> Qr_Code(),
                        ));
                      },
                      color: Colors.blue,
                      disabledColor: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                child: Icon(FontAwesomeIcons.qrcode, color: Colors.white, size: 15,),
                                width: 30,
                              ),
                              SizedBox(
                                child: Text(
                                  "CREATE QR CODE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      height: 1.7
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox( height: 10,),
                          Text(
                            'Generate OR code to redirect to payment\npage',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, height: 1.7),
                          ),
                        ],
                      ),
                    ),
                    width: ScreenUtil.getInstance().setWidth(750),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black26,
                    height: 1.0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 120,
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> Payment_Link(),
                        ));
                      },
                      color: Colors.blue,
                      disabledColor: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                child: Icon(FontAwesomeIcons.link, color: Colors.white, size: 15,),
                                width: 30,
                              ),
                              SizedBox(
                                child: Text(
                                  "CREATE PAYMENT LINK",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      height: 1.7
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox( height: 10,),
                          Text(
                            'Send payment link by SMS or Email.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, height: 1.7),
                          ),
                        ],
                      ),
                    ),
                    width: ScreenUtil.getInstance().setWidth(750),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black26,
                    height: 1.0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 120,
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> Paymentlink_Success(),
                        ));
                      },
                      color: Colors.blue,
                      disabledColor: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                child: Icon(FontAwesomeIcons.creditCard, color: Colors.white, size: 15,),
                                width: 30,
                              ),
                              SizedBox(
                                child: Text(
                                  "PAYMENT BY WALLET",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      height: 1.7
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox( height: 10,),
                          Text(
                            'Instantly get payment from SiPay Wallet.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, height: 1.7),
                          ),
                        ],
                      ),
                    ),
                    width: ScreenUtil.getInstance().setWidth(750),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black26,
                    height: 1.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: FlatButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Payment_Method(),
                        ));
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
