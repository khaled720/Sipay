import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Deposit/create_deposit_card.dart';
import 'package:fluttersipay/bottom_navigator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'merchant_panel.dart';

TextEditingController _countryController = new TextEditingController();
TextEditingController _cityController = new TextEditingController();
TextEditingController _addressController = new TextEditingController();

Widget PROFILE_Panel() {
  return PROFILE_SETTINGPanel();
}

class PROFILE_SETTINGPanel extends StatefulWidget {
  PROFILE_SETTINGPanel({Key key}) : super(key: key);
  @override
  _PROFILE_SETTINGPanel createState() => _PROFILE_SETTINGPanel();
}

class _PROFILE_SETTINGPanel extends State<PROFILE_SETTINGPanel> {


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
          title: Text('PROFILE SETTINGS'),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: CircleAvatar(
                            backgroundImage: Image.asset(
                              'assets/user_avatar.png',
                            ).image,
                          ),
                          height: ScreenUtil.getInstance().setHeight(130),
                          width: ScreenUtil.getInstance().setHeight(130),
                        ),
                        Expanded(
                          child:  Padding(
                            padding: EdgeInsets.only(
                              left: 30,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    'ŞALLI ÇEYİZ PERDE',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  width: ScreenUtil.getInstance().setWidth(500),
                                ),
                                SizedBox(
                                  height: ScreenUtil.getInstance().setHeight(20),
                                ),
                                Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '+90 555 892 3116',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: FlatButton(
                        onPressed: (){
                        },
                        color: Colors.blue,
                        disabledColor: Colors.blue,
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "UPDATE LOGO",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      width: ScreenUtil.getInstance().setWidth(690),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "COUNTRY",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                    TextField(
                      style: TextStyle(color: Colors.black ),
                      controller: _countryController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26 , width: 1.0)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38 , width: 1.0)),
                          prefixIcon: const Icon(
                            Icons.location_on,
                            color: Colors.black38,
                            size: 16,
                          )
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
                    Text(
                      "CITY",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                    TextField(
                      style: TextStyle(color: Colors.black ),
                      controller: _cityController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26 , width: 1.0)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38 , width: 1.0)),
                          prefixIcon: const Icon(
                            Icons.location_on,
                            color: Colors.black38,
                            size: 16,
                          )
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
                    Text(
                      "ADDRESS",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                    TextField(
                      style: TextStyle(color: Colors.black ),
                      controller: _addressController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26 , width: 1.0)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38 , width: 1.0)),
                          prefixIcon: const Icon(
                            Icons.location_on,
                            color: Colors.black38,
                            size: 16,
                          )
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
                        },
                        color: Colors.blue,
                        disabledColor: Colors.blue,
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      width: ScreenUtil.getInstance().setWidth(690),
                    ),
                    SizedBox(
                      height: 60,
                    )
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

