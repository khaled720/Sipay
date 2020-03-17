import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/bottom_navigator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../dashboard/merchant.dart';
import 'limit_success.dart';

TextEditingController _countryController = new TextEditingController();
TextEditingController _cityController = new TextEditingController();
TextEditingController _addressController = new TextEditingController();


class limits_Increase extends StatefulWidget {
  limits_Increase({Key key}) : super(key: key);
  @override
  _limits_Increase createState() => _limits_Increase();
}

class _limits_Increase extends State<limits_Increase> {


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
          title: Text('MOBILE POS LIMITS'),
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
              child: Padding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(60),
                    ),
                    Align(
                      child: Text(
                        'CURRENT LIMITS ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('One Time Limit', style: TextStyle(color: Colors.black45, fontSize: 17)),
                        ),
                        Expanded(
                          child: Container(
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  '2.000,00 TL',
                                  style: TextStyle(color: Colors.black87, fontSize: 16),
                                ),
                              )),
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
                        Expanded(
                          child: Text('Daily Limit', style: TextStyle(color: Colors.black45, fontSize: 17)),
                        ),
                        Expanded(
                          child: Container(
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  '7.500,00 TL',
                                  style: TextStyle(color: Colors.black87, fontSize: 16),
                                ),
                              )),
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
                        Expanded(
                          child: Text('Daily Limit', style: TextStyle(color: Colors.black45, fontSize: 17)),
                        ),
                        Expanded(
                          child: Container(
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  '25.000,00 TL',
                                  style: TextStyle(color: Colors.black87, fontSize: 16),
                                ),
                              )),
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
                      height: 30,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.black38 ),
                      controller: _countryController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26 , width: 0.3)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38 , width: 0.3)),
                        prefixIcon: const Icon(
                          FontAwesomeIcons.indent,
                          color: Colors.black26,
                          size: 16,
                        ),
                        hintText: "One Time Limit",
                        hintStyle: TextStyle(color: Colors.black26, height: 1.3),
                      ),
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        // Fit the validating format.
//                _phoneNumberFormatter,
                      ],
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.black38 ),
                      controller: _cityController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26 , width: 0.3)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38 , width: 0.3)),
                        prefixIcon: const Icon(
                          FontAwesomeIcons.sun,
                          color: Colors.black26,
                          size: 16,
                        ),
                        hintText: "Daily Limit",
                        hintStyle: TextStyle(color: Colors.black26, height: 1.3),
                      ),
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        // Fit the validating format.
//                _phoneNumberFormatter,
                      ],
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.black38 ),
                      controller: _countryController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26 , width: 0.3)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38 , width: 0.3)),
                        prefixIcon: const Icon(
                          FontAwesomeIcons.calendarCheck,
                          color: Colors.black26,
                          size: 17,
                        ),
                        hintText: "Monthly Limit",
                        hintStyle: TextStyle(color: Colors.black26),
                      ),
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        // Fit the validating format.
//                _phoneNumberFormatter,
                      ],
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: (){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> Limit_Success(),
                          ));
                        },
                        color: Colors.blue,
                        disabledColor: Colors.blue,
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "SUBMIT REQUEST",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      width: ScreenUtil.getInstance().setWidth(690),
                    ),
                  ],
                ),
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
              ),
            ),
            Dashboardbottom(context),
          ],
        ));
  }


}

