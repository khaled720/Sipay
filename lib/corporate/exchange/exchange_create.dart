import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/dashboard/support.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttersipay/corporate/exchange/exchange_rate.dart';


TextEditingController _amont_ontroller = TextEditingController();

Widget Exchange_Create() {
  return Exchange_panel();
}

class Exchange_panel extends StatefulWidget {
  Exchange_panel({Key key}) : super(key: key);
  @override
  _Exchange_panel createState() => _Exchange_panel();
}

class _Exchange_panel extends State<Exchange_panel> {

  final _formKey = GlobalKey<FormState>();

  int _selectedItemPosition = 0;

  var _try_value1 = "TRY";
  List<String> _listtryData1 = [
    "TRY",
    "TRYS"
  ];

  var _try_value2 = "TRY";
  List<String> _listtryData2 = [
    "TRY",
    "TRYS"
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
          title: Text("EXCHANGE"),
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
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      'AVAILABLE BALANCE',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            decoration: new BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Colors.black38,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                '292,20₺',
                                style: TextStyle(color: Colors.black38, fontSize: 16),
                              ),
                            )),
                      ),
                      Expanded(
                        child: Container(
                            decoration: new BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Colors.black38,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "80,00\$",
                                style: TextStyle(color: Colors.black38, fontSize: 16),
                              ),
                            )),
                      ),
                      Expanded(
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '774,80€',
                              style: TextStyle(color: Colors.black38, fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height:20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(10),
                              ),
                              Text(
                                'FROM',
                                style: TextStyle(color: Colors.black38, fontSize: 12),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child:Container(
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          keyboardType: TextInputType.phone,
                                          controller: _amont_ontroller,
                                          decoration: InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black45, width: 0.2)),
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black45, width: 0.2)),
                                              prefixIcon: const Icon(
                                                Icons.map,
                                                size: 16,
                                                color: Colors.black45,
                                              ),
                                              hintText: "0,00"
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter AMOUNT';
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
                              SizedBox(
                                height:20,
                              ),
                              Text(
                                'EXCHANGE',
                                style: TextStyle(color: Colors.black38, fontSize: 12),
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(20),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child:  Container(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: DropdownButton<String>(
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,size: 16,
                                          ),
                                          items:_listtryData1.map<DropdownMenuItem<String>>((String value){
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    child:  Text(
                                                      value,
                                                      style: TextStyle(
                                                          color: Colors.black45
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              _try_value1 = value;
                                            });
                                          },
                                          value: _try_value1,
                                          isExpanded: true,
                                        ),
                                      ),
                                      height: ScreenUtil.getInstance().setHeight(110),
//                                width: ScreenUtil.getInstance().setWidth(150),
                                    ),
                                  ),
                                  Container(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          FontAwesomeIcons.exchangeAlt,
                                          color: Colors.black26,
                                          size: 20.0,
                                        ),
                                      ),
                                      width: ScreenUtil.getInstance().setWidth(150),
                                    ),
                                  ),
                                  Expanded(
                                    child:  Container(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: DropdownButton<String>(
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,size: 16,
                                          ),
                                          items:_listtryData2.map<DropdownMenuItem<String>>((String value){
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                    child:  Text(
                                                      value,
                                                      style: TextStyle(
                                                          color: Colors.black45
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              _try_value2 = value;
                                            });
                                          },
                                          value: _try_value2,
                                          isExpanded: true,
                                        ),
                                      ),
                                      height: ScreenUtil.getInstance().setHeight(110),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'TO',
                                style: TextStyle(color: Colors.black38, fontSize: 12),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child:Container(
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          keyboardType: TextInputType.phone,
                                          controller: _amont_ontroller,
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45, width: 0.2)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45, width: 0.2)),
                                            prefixIcon: const Icon(
                                              Icons.map,
                                              size: 16,
                                              color: Colors.black45,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter AMOUNT';
                                            }
                                            return null;
                                          },
                                          obscureText: false,
                                        ),

                                      ),
                                      height: ScreenUtil.getInstance().setHeight(100),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Text('1,00 EUR: ', style: TextStyle(color: Colors.black45, fontSize: 17)),
                      ),
                      Expanded(
                        child: Container(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                '6,00 TRY',
                                style: TextStyle(color: Colors.black87, fontSize: 16),
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
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Text('Last Update: ', style: TextStyle(color: Colors.black45, fontSize: 17)),
                      ),
                      Expanded(
                        child: Container(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                '18.09.2019 - 00:55',
                                style: TextStyle(color: Colors.black87, fontSize: 16),
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
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Container(
                          child: FlatButton(
                            onPressed: () {
                              check_verify();
                            },
                            color: Colors.blue,
                            disabledColor: Colors.blue,
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "EXCHANGE",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          width: ScreenUtil.getInstance().setWidth(640),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 90,
                  ),

                ],
              ),
            ),
          ],
        )
    );
  }

  void check_verify(){
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => Exchange_rate(),
//        builder: (context) => Verify_attention(),
        ));
  }
}


