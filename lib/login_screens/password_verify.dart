import 'dart:convert';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/loading_widget.dart';
import 'package:fluttersipay/login_screens/login_repo.dart';
import 'package:fluttersipay/login_screens/reset_password.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:fluttersipay/utils/custom_text_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'SMS_Verification.dart';
import 'json_models/password_verification_ui_model.dart';
import 'providers/verify_password_provider.dart';
import 'package:translator/translator.dart';
class VerifyPasswordScreen extends StatefulWidget {
  final String userPhoneNumber;
String pass;
  VerifyPasswordScreen(this.userPhoneNumber,{this.pass});

  @override
  VerifyPasswordScreenState createState() => VerifyPasswordScreenState();
}

class VerifyPasswordScreenState extends State<VerifyPasswordScreen> {
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     
  }
  @override
  Widget build(BuildContext context) {
    print("User Data from mainlogin "+widget.userPhoneNumber);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1304, allowFontScaling: true)
          ..init(context);
    return new FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(
            'assets/json/register/2.3registerSMSverification1.json'),
        builder: (context, snapshot) {
          //PasswordSMSVerificationModel users;
        //  var parsedJson;
          if (snapshot.hasData) {
          //  parsedJson = json.decode(snapshot.data.toString());
        //    users = PasswordSMSVerificationModel.fromJson(parsedJson);
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
translator.translate("pass")
,

                ),
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

             
              body: ChangeNotifierProvider(
                  create: (context) => VerifyPasswordProvider(LoginRepository(),
        TextEditingController(text:widget.pass??""), widget.userPhoneNumber),
                  child: SingleChildScrollView(
                    child: Consumer<VerifyPasswordProvider>(
                        builder: (context, snapshot, _) {
                      return Container(
                          child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: ScreenUtil.getInstance().setWidth(60),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0, right: 30.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                              translator.translate("pass"),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setWidth(30),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0, right: 30.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    translator.translate("passInfo"),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(30),
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(80),
                                    ),
                                    Image.asset(
                                      'assets/password.png',
                                      height: ScreenUtil.getInstance()
                                          .setHeight(300),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(80),
                                    ),
                                  ],
                                ),
//                          height: ScreenUtil.getInstance().setHeight(380),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0, right: 30.0),
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  controller: snapshot.passwordController,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        CustomTextStyle.formField(context),
                                    errorMaxLines: 50,
                                    errorText: snapshot.passwordErrorText,
             

                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 1.0)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 1.0)),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Colors.black38,
                                    ),
                                  ),
                                  obscureText: true,
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(30),
                              ),
                              Row(
//                          padding: EdgeInsets.only(right: 40),
                                children: <Widget>[
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ResetPasswordScreen()));
                                        },
                                        child: Text(
                                            translator.translate("forgetPass"),
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 15,
                                              height: 1.6),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).popUntil(
                                              (route) => route.isFirst);
                                        },
                                        child: Text(
                                          translator.translate("diffrenAcc")
                                     ,  style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 15,
                                              height: 1.6),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(100),
                              ),
                              Container(
                                child: FlatButton(
                                  onPressed: () async {

                        SharedPreferences prefs = await SharedPreferences.getInstance();

                                    snapshot.verifyPassword((loginData) {
prefs.setString("pass", snapshot.passwordController.text);
print("SUCCESS.........indi pass saved........"+prefs.getString("pass").toString());

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                       SMSVerificationScreen(
                                                      loginData,
                                                      NavigationToSMSTypes
                                                          .Login,
                                                  userType: UserTypes.Individual
                                                      
                                                      
                                                      
                                                      )));
                                    }, () {});
                                  },
                                  color: Colors.blue,
                                  disabledColor: Colors.blue,
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                       translator.translate("verify"),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                width: ScreenUtil.getInstance().setWidth(660),
                              )
                            ],
                          ),
                          LoadingWidget(
                            isVisible: snapshot.showLoad,
                          )
                        ],
                      ));
                    }),
                  )),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }
}
