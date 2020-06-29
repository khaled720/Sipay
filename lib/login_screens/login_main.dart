import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttersipay/login_screens/ErrorDialog.dart';
import 'package:fluttersipay/login_screens/SMS_Verification.dart';
import 'package:fluttersipay/login_screens/login_repo.dart';
import 'package:fluttersipay/login_screens/login_widgets.dart';
import 'package:fluttersipay/login_screens/password_verify.dart';
import 'package:fluttersipay/login_screens/providers/login_provider.dart';
import 'package:fluttersipay/login_screens/reset_password.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:provider/provider.dart';

import 'login_slide.dart';

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
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
    return ChangeNotifierProvider<LoginProvider>(
        create: (context) => LoginProvider(
            LoginRepository(),
            TextEditingController(),
            TextEditingController(),
            TextEditingController()),
        child: Scaffold(body: SingleChildScrollView(
          child: Consumer<LoginProvider>(builder: (context, snapshot, _) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: SingleChildScrollView(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/home_logo.png',
                                width: ScreenUtil.getInstance().setWidth(300),
                                height:
                                    ScreenUtil.getInstance().setHeight(190)),
                          ],
                        )),
                      ),
                      width: ScreenUtil.getInstance().setWidth(750),
                      height: ScreenUtil.getInstance().setHeight(190),
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(60),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: IntrinsicWidth(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    decoration: new BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: snapshot.customerOrCorporate
                                              ? Colors.blue
                                              : Colors.black26,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: SizedBox(
                                          width: ScreenUtil.getInstance()
                                              .setWidth(345),
                                          child: OutlineButton(
                                            onPressed: () {
                                              snapshot
                                                  .toggleCustomerCorporate();
                                            },
                                            borderSide: new BorderSide(
                                              style: BorderStyle.none,
                                            ),
                                            child: new Text(
                                              'INDIVIDUAL',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: snapshot
                                                          .customerOrCorporate
                                                      ? Colors.blue
                                                      : Colors.black26,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: new BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: snapshot.customerOrCorporate
                                              ? Colors.black26
                                              : Colors.blue,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: SizedBox(
                                        width: ScreenUtil.getInstance()
                                            .setWidth(345),
                                        child: OutlineButton(
                                          onPressed: () {
                                            snapshot.toggleCustomerCorporate();
                                          },
                                          borderSide: new BorderSide(
                                            style: BorderStyle.none,
                                          ),
                                          child: new Text(
                                            'CORPORATE',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color:
                                                    snapshot.customerOrCorporate
                                                        ? Colors.black26
                                                        : Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      width: ScreenUtil.getInstance().setWidth(750),
                      height: ScreenUtil.getInstance().setHeight(80),
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(10),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: snapshot.customerOrCorporate
                                  ? IndividualWidget(snapshot)
                                  : CorporateWidget(snapshot),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(20),
                            ),
                            Container(
                              child: Row(
                            //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Checkbox(
                                            value: snapshot.rememberPassword,
                                            onChanged: (bool value) {
                                              snapshot
                                                  .setRememberPassword(value);
                                            }),
                                        Text("Remember Me"),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ResetPasswordScreen()),
                                          );
                                        },
                                        child: Text(
                                          'Forgot Password',
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(30),
                            ),
                            Container(
                              width: ScreenUtil.getInstance().setWidth(690),
                              child: FlatButton(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                color: Colors.blue,
                                onPressed: () {
                                  snapshot.login((loginData) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VerifyPasswordScreen(
                                                    loginData)));
                                  }, (loginData) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SMSVerificationScreen(
                                                    loginData,
                                                    NavigationToSMSTypes.Login,
                                                    snapshot.userType)));
                                  }, (errorMsg) {
                                    showDialog(
                                        context: context,
                                        child: ErrorDialog(() {
                                          Navigator.of(context).pop();
                                        }));
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(10),
                            ),
                            Container(
                              child: snapshot.customerOrCorporate
                                  ? NoAccountWidget()
                                  : null,
                            ),
                          ],
                        ),
                      ),
                      width: ScreenUtil.getInstance().setWidth(750),
                      height: ScreenUtil.getInstance().setHeight(610),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 40.0, right: 40.0),
                      child: Text(
                        '%10 OFF SHOPPING IN JUNE!',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      width: ScreenUtil.getInstance().setWidth(750),
                      height: ScreenUtil.getInstance().setHeight(80),
                    ),
                    Container(
                      child: LoginPage(),
                      width: ScreenUtil.getInstance().setWidth(750),
                      height: ScreenUtil.getInstance().setHeight(270),
                    )
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
          }),
        )));
  }

//  _showDialog(bool customer) {
//    if (!customer) {
//      String data = _emailController.text;
//      if (data.length != 0) {
//        setState(() {
//          _checkEmail = false;
//        });
//        showDialog(context: context, builder: (_) => ErrorDialog(resetGame));
//      }
//    } else {
//      String data = _phoneController.text;
//      if (data.length != 0) {
//        setState(() {
//          _checkPhone = false;
//        });
//      } else {
//        Navigator.pushNamed(context, '/merchant');
//      }
//    }
//  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
  }
}
