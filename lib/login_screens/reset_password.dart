import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/login_screens/login_repo.dart';
import 'package:fluttersipay/login_screens/providers/reset_password_provider.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:fluttersipay/utils/custom_text_style.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart' as translator;

class ResetPasswordScreen extends StatefulWidget {
  @override
  ResetPasswordScreenState createState() => ResetPasswordScreenState();
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("RESET PASSWORD"),
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
            child: ChangeNotifierProvider<ResetPasswordProvider>(
                create: (context) => ResetPasswordProvider(
                    LoginRepository(), TextEditingController()),
                child: Consumer<ResetPasswordProvider>(
                    builder: (context, snapshot, _) {
                  return Stack(alignment: Alignment.center, children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                            child: Padding(
                          padding: EdgeInsets.only(top: 30.0, left: 30.0),
                          child: Text(
                            'FORGOT YOUR PASSWORD?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        )),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(30),
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                            child: Text(
                              'Enter your e-mail address linked to your account to reset your password.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(130),
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black38),
                              controller: snapshot.emailController,
                              decoration: InputDecoration(
                                hintText: 'E-mail',
                                errorText: snapshot.emailErrorText,
                                hintStyle: CustomTextStyle.formField(context),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black38, width: 1.0)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black38, width: 1.0)),
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Colors.black38,
                                ),
                              ),
                              obscureText: false,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(80),
                        ),
                        Container(
                          width: ScreenUtil.getInstance().setWidth(690),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: FlatButton(
                              onPressed: (){
                                snapshot.resetPassword((msg) async{
        var translation = await translator.GoogleTranslator().translate(msg, to: 'pl');
   
                                  print(msg);
                                  Navigator.of(context).pop();
                                  Flushbar(
                                      title: "Successful",
                                      message:translation.toString(),
                                      duration: Duration(seconds: 5))
                                    ..show(context);
                                }, () {});
                              },
                              color: Colors.blue,
                              disabledColor: Colors.blue,
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'SEND RESET LINK',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(visible: snapshot.showLoad, child: defaultLoader)
                  ]);
                }))));
  }
}
