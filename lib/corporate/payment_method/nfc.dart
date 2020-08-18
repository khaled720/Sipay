import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/dashboard/support.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../money/success.dart';
import 'credit_details.dart';
import 'customer_signature.dart';

class Nfc_Panel extends StatefulWidget {
  Nfc_Panel({Key key}) : super(key: key);
  @override
  _Nfc_Panel createState() => _Nfc_Panel();
}
class _Nfc_Panel extends State<Nfc_Panel> {
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
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "To recieve the card information, approach the card to your device's NFC reader.",
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
                  Container(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/mobile/NFC.png',
                          height: ScreenUtil.getInstance().setHeight(450),
                        ),
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
                        "OR",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
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
                                  builder: (context) => Credit_Details()
                              ));
                            },
                            borderSide: BorderSide(
                              color: Colors.black26, //Color of the border
                              style: BorderStyle.solid, //Style of the border
                              width: 0.8, //width of the border
                            ),
                            color: Colors.white,
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "MANUEL",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          width: ScreenUtil.getInstance().setWidth(300),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Container(
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(
                                  builder: (context) => Transfer_success(),
                                  ));
                            },
                            color: Colors.blue,
                            disabledColor: Colors.blue,
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  child: Icon(FontAwesomeIcons.camera, color: Colors.white, size: 15,),
                                  width: 30,
                                ),
                                SizedBox(
                                  child: Text(
                                    "OCR",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          width: ScreenUtil.getInstance().setWidth(290),
                        ),
                      ),
                    ],
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
