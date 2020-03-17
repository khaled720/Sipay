import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:fluttersipay/corporate/money/Send_corp.dart';
import 'package:fluttersipay/corporate/money/Send_individual.dart';

class MoneyPanel extends StatefulWidget {
  MoneyPanel({Key key}) : super(key: key);
  @override
  _MoneyPanel createState() => _MoneyPanel();
}

class _MoneyPanel extends State<MoneyPanel> {


  var _value = "INDIVIDUAL";
  List<String> _listViewData = [
    "INDIVIDUAL",
    "CORP"
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
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("MONEY TRANSFER"),
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
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(50),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      'AVAILABLE BALANCE',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(50),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            decoration: new BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Colors.black54,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                '292,20₺',
                                style: TextStyle(color: Colors.black54, fontSize: 16),
                              ),
                            )),
                      ),
                      Expanded(
                        child: Container(
                            decoration: new BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Colors.black54,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "80,00\$",
                                style: TextStyle(color: Colors.black54, fontSize: 16),
                              ),
                            )),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '774,80€',
                              style: TextStyle(color: Colors.black54, fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(80),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'SEND MONEY',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(30),
                        ),
                        Text(
                          'WALLET TYPE',
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                        DropdownButton<String>(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          ),
                          items:_listViewData.map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.creditCard,
                                    color: Colors.grey,
                                    size: 15,
                                  ),
                                  SizedBox(width: 25),
                                  Expanded(
                                    child:  Text(
                                      value,
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
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(100),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: FlatButton(
                            onPressed: (){
                              Send_money();
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
                  )
                ],
              ),
            ),
          ],
        )
    );
  }

  void Send_money() {
    if(_value == _listViewData[0]) {
      Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => Send_individual(),
          ));
    }
    else{
      Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => Send_corp(),
          ));
    }
  }
}
