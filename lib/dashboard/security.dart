import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Dashboard/merchant_panel.dart';

TextEditingController _countryController = new TextEditingController();
TextEditingController _cityController = new TextEditingController();
TextEditingController _addressController = new TextEditingController();

Widget Security() {
  return Security_Panel();
}

class Security_Panel extends StatefulWidget {
  Security_Panel({Key key}) : super(key: key);
  @override
  _Security_Panel createState() => _Security_Panel();
}

class _Security_Panel extends State<Security_Panel> {


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
          title: Text('SECURITY'),
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
                      height: ScreenUtil.getInstance().setHeight(40),
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "CHANGE YOUR PASSWORD OR E-MAIL",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setWidth(30),
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "You can change your password and e-mail for security reasons from this age. To change your phone number please contact to our customer services. 0 212 706 11 12",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black38,
                            height: 1.6,
                          ),
                        ),
                      ),
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
                      height: 20,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.black38 ),
//                      controller: _countryController,
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
//                      controller: _cityController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54 , width: 0.3)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38 , width: 0.3)),
                        prefixIcon: const Icon(
                          Icons.refresh,
                          color: Colors.black26,
                          size: 20,
                        ),
                        hintText: "New E-mail Address",
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
                    Container(
                      child: FlatButton(
                        onPressed: (){
//                          Navigator.pop(context);
                        },
                        color: Colors.blue,
                        disabledColor: Colors.blue,
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "CHANGE E-MAIL",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      width: ScreenUtil.getInstance().setWidth(690),
                    ),
                    SizedBox(
                      height: 80,
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

