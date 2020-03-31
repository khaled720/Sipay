import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'login_main.dart';

TextEditingController _phoneController = TextEditingController();
Widget USEREGISTRICATION() {
  return userr_registration();
}

class userr_registration extends StatefulWidget {


  userr_registration({Key key}) : super(key: key);
  @override
  _userr_registration createState() => _userr_registration();
}

class _userr_registration extends State<userr_registration> {
  bool _checkphone = true;
  @override
  void initState(){
    super.initState();
  }


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
    return new FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/json/register/2.2Registration.json'),
        builder: (context, snapshot){
          registration users;
          var parsedJson;
          if (snapshot.hasData){
            parsedJson = json.decode(snapshot.data.toString());
            users = registration.fromJson(parsedJson);
            return new Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(users.header),
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
                        Navigator.pop(
                            context
                        );
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
              body: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: ScreenUtil.getInstance().setWidth(60),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              users.rEGISTRATION,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setWidth(60),
                          ),
                          Container(
                            child: Text(
                              users.enter,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black45,
                              ),
                            ),
                            width: ScreenUtil.getInstance().setWidth(690),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(10),
                          ),
                          Container(
                            child: RichText(
                                text: TextSpan(
                                  // set the default style for the children TextSpans
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: users.user.agreement,
                                          style: TextStyle(
                                              color: Colors.blue
                                          )
                                      ),
                                      TextSpan(
                                          text: ' & ',
                                          style: TextStyle(
                                              color: Colors.black45
                                          )
                                      ),
                                      TextSpan(
                                          text: users.user.privacy,
                                          style: TextStyle(
                                              color: Colors.blue
                                          )
                                      ),
                                    ]
                                )
                            ),
                            width: ScreenUtil.getInstance().setWidth(690),
                          ),
                          SizedBox(
                            height:  ScreenUtil.getInstance().setHeight(200),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(20),
                          ),
                          TextField(
                            style: TextStyle(color: Colors.black ),
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: CustomTextStyle.formField(context),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black38 , width: 1.0)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black38 , width: 1.0)),
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: Colors.black38,
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
                            height: ScreenUtil.getInstance().setHeight(30),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              users.already,
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                              onPressed: (){
                                Navigator.popUntil(context, ModalRoute.withName('/'));
                              },
                              child: Text(
                                users.login,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(60),
                          ),
                          Container(
                            child: FlatButton(
                              onPressed: (){
                                Navigator.pushNamed(context, '/smsverification');
                              },
                              color: Colors.blue,
                              disabledColor: Colors.blue,
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                users.button,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            width: ScreenUtil.getInstance().setWidth(690),
                          ),
                        ],
                      )
                  )


              ),
            );
          } else if (snapshot.hasError){
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();

        });
  }
}
class registration {
  String header;
  String rEGISTRATION;
  String enter;
  User user;
  String already;
  String login;
  String button;

  registration(
      {this.header,
        this.rEGISTRATION,
        this.enter,
        this.user,
        this.already,
        this.login,
        this.button});

  registration.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    rEGISTRATION = json['REGISTRATION'];
    enter = json['enter'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    already = json['already'];
    login = json['login'];
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['REGISTRATION'] = this.rEGISTRATION;
    data['enter'] = this.enter;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['already'] = this.already;
    data['login'] = this.login;
    data['button'] = this.button;
    return data;
  }
}

class User {
  String agreement;
  String privacy;

  User({this.agreement, this.privacy});

  User.fromJson(Map<String, dynamic> json) {
    agreement = json['agreement'];
    privacy = json['privacy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agreement'] = this.agreement;
    data['privacy'] = this.privacy;
    return data;
  }
}