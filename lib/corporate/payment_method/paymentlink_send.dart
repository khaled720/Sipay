import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/dashboard/support.dart';
import 'package:fluttersipay/corporate/payment_method/mobilepos_failed.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'paymentlink_success.dart';

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
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30),
                    child: Text(
                      "SEND RECEIPT link",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        height: 1.6,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30),
                    child: Text(
                      "You can send payment link as SMS or E-mail.",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black45,
                        height: 1.6,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30),
                    child: Text(
                      'PHONE NUMBER',
                      style: TextStyle(color: Colors.black38, fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height:20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 30),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child:Container(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: TextFormField(
                                style: TextStyle(color: Colors.black26),
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 0.5)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 0.5)),
                                    prefixIcon: const Icon(
                                      Icons.phone,
                                      size: 17,
                                      color: Colors.black26,
                                    ),
//                                    hintText: "example@email.com",
//                                    hintStyle: TextStyle(color: Colors.black26, fontSize: 17)
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter PHONE NUMBER';
                                  }
                                  return null;
                                },
                                obscureText: false,
                              ),

                            ),
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:40,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => Paymentlink_Success(),
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
                              child: Text(
                                "SEND RECEIPT",
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
                    height:
                    ScreenUtil.getInstance().setHeight(80),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30),
                    child: Text(
                      'E-MAIL ADDRESS',
                      style: TextStyle(color: Colors.black38, fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height:20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 30),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child:Container(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: TextFormField(
                                style: TextStyle(color: Colors.black26),
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 0.2)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 0.2)),
                                    prefixIcon: const Icon(
                                      Icons.mail,
                                      size: 17,
                                      color: Colors.black26,
                                    ),
                                    hintText: "example@email.com",
                                    hintStyle: TextStyle(color: Colors.black26, fontSize: 17)
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter E-MAIL';
                                  }
                                  return null;
                                },
                                obscureText: false,
                              ),

                            ),
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: FlatButton(
                      onPressed: (){
                  //      Navigator.push(context,
                    //        MaterialPageRoute(
//                              builder: (context) => C_Merchant_panel(),
                      //      ));
                      },
                      color: Colors.blue,
                      disabledColor: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 105,
                            ),
                            SizedBox(
                              child: Text(
                                "NEW PAYMENT",
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
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

}
