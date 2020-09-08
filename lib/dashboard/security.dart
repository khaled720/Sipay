import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/dashboard/Live_support.dart';
import 'package:fluttersipay/dashboard/providers/security_settings_provider.dart';
import 'package:fluttersipay/dashboard/security_otp_screen.dart';
import 'package:fluttersipay/loading_widget.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
   import 'package:translator/translator.dart' as translator1;
    
class SecurityScreen extends StatefulWidget {
  final BaseMainRepository mainRepository;

  SecurityScreen(this.mainRepository);

  @override
  _SecurityScreenState createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
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
    return ChangeNotifierProvider(
        create: (context) => SecuritySettingsProvider(
            widget.mainRepository,
            TextEditingController(),
            TextEditingController(),
            TextEditingController(),
            TextEditingController(),
            TextEditingController()),
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(translator.translate("security")),
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
                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Live_Support(),
                                          ));
                    // do something
                  },
                )
              ],
            ),
            body: Consumer<SecuritySettingsProvider>(
                builder: (context, snapshot, _) {
              return Stack(
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
                               translator.translate("SecurityTitle"),
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
                         translator.translate("securityInfo"),
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
                            style: TextStyle(color: Colors.black38),
                            controller: snapshot.currentPassword,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              errorText: snapshot.currentPasswordErrorMessage,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black26, width: 0.3)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black38, width: 0.3)),
                              prefixIcon: const Icon(
                                FontAwesomeIcons.lockOpen,
                                color: Colors.black26,
                                size: 16,
                              ),
                              hintText: translator.translate("curntPass"),
                              hintStyle:
                                  TextStyle(color: Colors.black26, height: 1.3),
                            ),
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.black38),
                            controller: snapshot.newPassword,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              errorText: snapshot.newPasswordErrorMessage,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black26, width: 0.3)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black38, width: 0.3)),
                              prefixIcon: const Icon(
                                FontAwesomeIcons.lock,
                                color: Colors.black26,
                                size: 16,
                              ),
                              hintText: translator.translate("newPass"),
                              hintStyle:
                                  TextStyle(color: Colors.black26, height: 1.3),
                            ),
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.black38),
                            controller: snapshot.confirmPassword,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              errorText: snapshot.confirmPasswordErrorMessage,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black26, width: 0.3)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black38, width: 0.3)),
                              prefixIcon: const Icon(
                                Icons.refresh,
                                color: Colors.black26,
                                size: 20,
                              ),
                              hintText: translator.translate("ConfPass"),
                              hintStyle:
                                  TextStyle(color: Colors.black26, height: 1.3),
                            ),
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: FlatButton(
                              onPressed: () {
                                snapshot.changePassword(
                                    (MainApiModel passwordModel) {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SecurityOTPScreen(
                                          SecuritySettingsTypes.Password,
                                          passwordModel.data['user']['phone'],
                                          passwordModel,
                                          widget.mainRepository)));
                                }, (description) async{
                                   var translation = await translator1.GoogleTranslator().translate(description, to: 'en');
   
                                  Flushbar(
                                    title: translator.translate("fail"),
                                    message: translation.toString(),
                                    duration: Duration(seconds: 3),
                                  )..show(context);
                                });
                              },
                              color: Colors.blue,
                              disabledColor: Colors.blue,
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                            translator.translate("changePassbtn"),
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
                            style: TextStyle(color: Colors.black38),
                            controller: snapshot.currentPasswordEmail,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              errorText:
                                  snapshot.currentPasswordEmailErrorMessage,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black26, width: 0.3)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black38, width: 0.3)),
                              prefixIcon: const Icon(
                                FontAwesomeIcons.lock,
                                color: Colors.black26,
                                size: 16,
                              ),
                              hintText:translator.translate("curntPass"),
                              hintStyle:
                                  TextStyle(color: Colors.black26, height: 1.3),
                            ),
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.black38),
                            controller: snapshot.newEmail,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              errorText: snapshot.newEmailErrorMessage,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 0.3)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black38, width: 0.3)),
                              prefixIcon: const Icon(
                                Icons.refresh,
                                color: Colors.black26,
                                size: 20,
                              ),
                              hintText: translator.translate("newEmailHint"),
                              hintStyle:
                                  TextStyle(color: Colors.black26, height: 1.3),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: FlatButton(
                              onPressed: () {
                                snapshot.changeEmail((MainApiModel emailModel) {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SecurityOTPScreen(
                                          SecuritySettingsTypes.Email,
                                          emailModel.data['user']['phone'],
                                          emailModel,
                                          widget.mainRepository)));
                                }, (msg) async{
                                   var translation = await translator1.GoogleTranslator().translate(msg, to: 'pl');
   
                                  Flushbar(
                                    title: translator.translate("fail"),
                                    message: translation.toString(),
                                    duration: Duration(seconds: 3),
                                  )..show(context);
                                });
                              },
                              color: Colors.blue,
                              disabledColor: Colors.blue,
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                translator.translate("changeEmail"),
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
                  LoadingWidget(
                    isVisible: snapshot.showLoad ?? false,
                  ),
                  // Dashboardbottom(context, null, null, UserTypes.Individual)
                ],
              );
            })));
  }
}
