import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/bottom_navigator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'merchant.dart';

TextEditingController _countryController = new TextEditingController();
TextEditingController _cityController = new TextEditingController();
TextEditingController _addressController = new TextEditingController();

Widget C_PROFILE_Panel() {
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
                                      'ID: 181072',
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
                      height: 40,
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
                          FontAwesomeIcons.lockOpen,
                          color: Colors.black26,
                          size: 16,
                        ),
                        hintText: "Current Password",
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
                      height: 20,
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
                          FontAwesomeIcons.lock,
                          color: Colors.black26,
                          size: 16,
                        ),
                        hintText: "New Password",
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
                      height: 20,
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
                          Icons.refresh,
                          color: Colors.black26,
                          size: 20,
                        ),
                        hintText: "Confirm Password",
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
                      height: 40,
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
                          "CHANGE PASSWORD",
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

