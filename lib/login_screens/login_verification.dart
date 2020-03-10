import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/utils/custom_text_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

TextEditingController surnameController = TextEditingController();
TextEditingController tokenController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmController = TextEditingController();
TextEditingController dateController = TextEditingController();
TextEditingController professionController = TextEditingController();
TextEditingController nameController = TextEditingController();


class UserVerificationScreen extends StatefulWidget {
  UserVerificationScreen({Key key}) : super(key: key);
  @override
  UserVerificationScreenState createState() => UserVerificationScreenState();
}

class UserVerificationScreenState extends State<UserVerificationScreen> {
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
            .loadString('assets/json/register/2_4KYC.json'),
        builder: (context, snapshot) {
          LoginVerificationModel users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
            users = LoginVerificationModel.fromJson(parsedJson);
            var inputData = users.inputField
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", "")
                .split(" ");
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
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
                actions: <Widget>[
                  IconButton(
                    padding: const EdgeInsets.only(right: 20.0),
                    icon: Icon(
                      Icons.chat_bubble_outline,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Text(
                          users.alert,
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            inputData[0],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        TextField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.phone,
                          controller: nameController,
                          decoration: InputDecoration(
                            hintStyle: CustomTextStyle.formField(context),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black12, width: 1.0)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 1.0)),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.black38,
                            ),
                          ),
                          obscureText: false,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(30),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            inputData[1],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        TextField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.phone,
                          controller: surnameController,
                          decoration: InputDecoration(
                            hintStyle: CustomTextStyle.formField(context),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black12, width: 1.0)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 1.0)),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.black38,
                            ),
                          ),
                          obscureText: false,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(30),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            inputData[2],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        TextField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.phone,
                          controller: tokenController,
                          decoration: InputDecoration(
                            hintStyle: CustomTextStyle.formField(context),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black12, width: 1.0)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 1.0)),
                            prefixIcon: const Icon(
                              FontAwesomeIcons.hashtag,
                              color: Colors.black38,
                            ),
                          ),
                          obscureText: false,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(30),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            inputData[3],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        TextField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.phone,
                          controller: emailController,
                          decoration: InputDecoration(
                            hintStyle: CustomTextStyle.formField(context),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black12, width: 1.0)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 1.0)),
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.black38,
                            ),
                          ),
                          obscureText: false,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(30),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            inputData[4],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        TextField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.phone,
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintStyle: CustomTextStyle.formField(context),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black12, width: 1.0)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 1.0)),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black38,
                            ),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(30),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            inputData[5],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        TextField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.phone,
                          controller: confirmController,
                          decoration: InputDecoration(
                            hintStyle: CustomTextStyle.formField(context),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black12, width: 1.0)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 1.0)),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black38,
                            ),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(30),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            inputData[6],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        TextField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,
                          controller: dateController,
                          decoration: InputDecoration(
                            hintStyle: CustomTextStyle.formField(context),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black12, width: 1.0)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 1.0)),
                            prefixIcon: const Icon(
                              Icons.date_range,
                              color: Colors.black38,
                            ),
                          ),
                          obscureText: false,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(30),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            inputData[7],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        TextField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,
                          controller: professionController,
                          decoration: InputDecoration(
                            hintStyle: CustomTextStyle.formField(context),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black12, width: 1.0)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 1.0)),
                            prefixIcon: const Icon(
                              Icons.room_service,
                              color: Colors.black38,
                            ),
                          ),
                          obscureText: false,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Container(
                          child: FlatButton(
                            onPressed: () {
                              Navigator.popUntil(
                                  context, ModalRoute.withName('/'));
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
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                      ],
                    )),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }
}

class LoginVerificationModel {
  String header;
  String alert;
  List<String> inputField;
  String button;

  LoginVerificationModel(
      {this.header, this.alert, this.inputField, this.button});

  LoginVerificationModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    alert = json['alert'];
    inputField = json['input_field'].cast<String>();
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['alert'] = this.alert;
    data['input_field'] = this.inputField;
    data['button'] = this.button;
    return data;
  }
}
