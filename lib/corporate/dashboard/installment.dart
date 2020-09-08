import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/dashboard/support.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../dashboard/merchant.dart';

TextEditingController _countryController = new TextEditingController();
TextEditingController _cityController = new TextEditingController();
TextEditingController _addressController = new TextEditingController();


class Installment_Rates extends StatefulWidget {
  Installment_Rates({Key key}) : super(key: key);
  @override
  _Installment_Rates createState() => _Installment_Rates();
}

class _Installment_Rates extends State<Installment_Rates> {

  List<String> installment_rate = [
    "% 1,66",
    "% 2,33",
    "% 3,12",
    "% 3,68",
    "% 4,11",
    "% 4,33",
    "% 4,44",
    "% 5,12",
    "% 5,99",
    "% 6,23",
    "% 6,88",
    "% 7,12",
    "% 8.16",
    "% 9,65",
    "% 10,12",
    "% 12,31",
    "% 14,44",
  ];

  var cards_list = [
    {
      "key": "BONUS",
      "val": "2 - 4 Installments",
    },
    {
      "key": "PARAF, ADVANTAGE",
      "val": "2 - 8 Installments",
    },
  ] ;

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
          title: Text(translator.translate("installRate")),
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
      body:
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
           translator.translate("attention"),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(30),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
               translator.translate("installInfo"),   style: TextStyle(fontSize: 15, color: Colors.black54, height: 2),
                ),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(50),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                translator.translate("installRate").toUpperCase(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(50),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                  child: new Container(
                    height: 300.0,
                    child: new ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.black26,
                      ),
                      padding: EdgeInsets.all(8.0),
                      itemCount: installment_rate.length,
                      primary: true,
                      itemBuilder: (BuildContext content, int index) {
                        return installment_list(
                            rate: installment_rate[index],
                            num: index
                        );
                      },
                    ),
                  ),
                ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(50),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  translator.translate("cards"),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(50),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: new Container(
                  height: 300.0,
                  child: new ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.black26,
                    ),
                    padding: EdgeInsets.all(8.0),
                    itemCount: cards_list.length,
                    itemBuilder: (context, i) {
                      return new Container(
                        height: 30.0,
                        child: new Text('${cards_list[i]['key']}                   ${cards_list[i]['val']} '),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.black26,
                height: 1.0,
              ),
              SizedBox(
                height: 30,
              ),
            ]
          ),
        ),
    );
  }


  Widget installment_list({String rate, int num}){

    return new Row(
      children: <Widget>[
        num % 2 ==0 ?
        Expanded(
          child: Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${num+1} '+translator.translate("install")+'$rate',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              )),
        )
        :
        Expanded(
          child: Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${num+1} '+translator.translate("install")+ '$rate',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              )),
        ),
      ],
//                          height: 30.0,
//                          child: new Text('${i+1} installments   ${installment_rate[i]}'),

    );
  }
}

