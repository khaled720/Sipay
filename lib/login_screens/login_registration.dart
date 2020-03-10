import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttersipay/login_screens/login_repo.dart';
import 'package:fluttersipay/login_screens/providers/register_provider.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:fluttersipay/utils/custom_text_style.dart';
import 'package:provider/provider.dart';

import 'SMS_Verification.dart';
import 'json_models/individual_ui_registration_model.dart';

class UserRegistrationScreen extends StatefulWidget {
  @override
  UserRegistrationScreenState createState() => UserRegistrationScreenState();
}

class UserRegistrationScreenState extends State<UserRegistrationScreen> {
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
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/json/register/2.2Registration.json'),
        builder: (context, snapshot) {
          RegistrationModel users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
            users = RegistrationModel.fromJson(parsedJson);
            return Scaffold(
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
                      child: ChangeNotifierProvider<RegisterProvider>(
                          create: (context) => RegisterProvider(
                              LoginRepository(), TextEditingController()),
                          child: Consumer<RegisterProvider>(
                              builder: (context, snapshot, _) {
                            return Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height:
                                          ScreenUtil.getInstance().setWidth(60),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        users.registration,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          ScreenUtil.getInstance().setWidth(60),
                                    ),
                                    Container(
                                      child: Text(
                                        users.enter,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black45,
                                        ),
                                      ),
                                      width: ScreenUtil.getInstance()
                                          .setWidth(690),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(10),
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
                                                    color: Colors.blue)),
                                            TextSpan(
                                                text: ' & ',
                                                style: TextStyle(
                                                    color: Colors.black45)),
                                            TextSpan(
                                                text: users.user.privacy,
                                                style: TextStyle(
                                                    color: Colors.blue)),
                                          ])),
                                      width: ScreenUtil.getInstance()
                                          .setWidth(690),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(200),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(20),
                                    ),
                                    TextField(
                                      style: TextStyle(color: Colors.black),
                                      controller: snapshot.telephoneController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                          hintText: 'Phone Number',
                                          hintStyle: CustomTextStyle.formField(
                                              context),
                                          errorText:
                                              snapshot.phoneNumberErrorText,
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black38,
                                                  width: 1.0)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black38,
                                                  width: 1.0)),
                                          prefixIcon: const Icon(
                                            Icons.phone,
                                            color: Colors.black38,
                                          )),
                                      inputFormatters: [maskFormatter],
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(30),
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
                                        onPressed: () {
                                          Navigator.popUntil(context,
                                              ModalRoute.withName('/'));
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
                                      height: ScreenUtil.getInstance()
                                          .setHeight(60),
                                    ),
                                    Container(
                                      child: FlatButton(
                                        onPressed: () {
                                          snapshot.registerIndividual(
                                              (loginData) {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SMSVerificationScreen(
                                                          loginData,
                                                          NavigationToSMSTypes
                                                              .Register,
                                                        )));
                                          }, (errorMsg) {
                                            Flushbar(
                                                title: "Error in login",
                                                message: '$errorMsg',
                                                duration: Duration(seconds: 5))
                                              ..show(context);
                                          });
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
                                      width: ScreenUtil.getInstance()
                                          .setWidth(690),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: snapshot.showLoad,
                                  child: SpinKitChasingDots(
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            );
                          })))),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }
}
