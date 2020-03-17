import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Money/request_details.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../dashboard/merchant.dart';

class Agreements_Panel extends StatefulWidget {
  Agreements_Panel({Key key}) : super(key: key);
  @override
  _Agreements_Panel createState() => _Agreements_Panel();
}
class _Agreements_Panel extends State<Agreements_Panel> {

  var agreements_data = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vehicula tincidunt facilisis. Fusce cursus vitae magna nec aliquet.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vehicula tincidunt facilisis. Fusce cursus vitae magna nec aliquet.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vehicula tincidunt facilisis. Fusce cursus vitae magna nec aliquet.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vehicula tincidunt facilisis. Fusce cursus vitae magna nec aliquet.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vehicula tincidunt facilisis. Fusce cursus vitae magna nec aliquet.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vehicula tincidunt facilisis. Fusce cursus vitae magna nec aliquet."
  ];
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
          title: Text('AGREEMENTS'),
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
                            'PROTECTION OF PERSONAL DATA AND STORAGE',
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
                            'LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT. PRAESENT VEHICULA TINCIDUNT FACILISIS.',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                                height: 1.7
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: new ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: agreements_data.length,
                            primary: true,
                            itemBuilder: (BuildContext content, int index){
                              return agreements_list(
                                  data: agreements_data[index],
                                  num: index
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
    ),
    ],
    ),
    );
  }

  Widget agreements_list({String data, int num}) {
    return new Container(
      child: Container(
//        padding: EdgeInsets.only(left: 30.0, right: 30.0,top: 10, bottom: 10),
        child: Column(
//          crossAxisAlignment: num %2 == 0? CrossAxisAlignment.start: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              '${num+1} . $data',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.black45
              ),
            ),
            SizedBox(
              height: 17,
            ),
          ],
        ),
      ),
    );
  }
}
