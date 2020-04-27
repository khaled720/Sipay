import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/dashboard/merchant_repo.dart';
import 'package:fluttersipay/corporate/dashboard/providers/corporate_profile_provider.dart';
import 'package:fluttersipay/loading_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CorporateProfileSettingsScreen extends StatefulWidget {
  final MerchantMainRepository corporateRepo;
  final userModel;
  CorporateProfileSettingsScreen(this.corporateRepo, this.userModel);
  @override
  _CorporateProfileSettingsScreenState createState() =>
      _CorporateProfileSettingsScreenState();
}

class _CorporateProfileSettingsScreenState
    extends State<CorporateProfileSettingsScreen> {
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
        create: (context) => CorporateProfileSettingsProvider(
            widget.corporateRepo,
            TextEditingController(),
            TextEditingController(),
            TextEditingController()),
        child: Scaffold(
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
            body: Consumer<CorporateProfileSettingsProvider>(
                builder: (context, snapshot, _) {
              return Stack(
                alignment: Alignment.center,
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
                                    backgroundImage:
                                        snapshot.userProfileAvatar != null
                                            ? NetworkImage(
                                                snapshot.userProfileAvatar
                                                    .toString()
                                                    .trim(),
                                              )
                                            : (snapshot.imageFromGallery != null
                                                ? FileImage(
                                                    snapshot.imageFromGallery,
                                                  )
                                                : Image.asset(
                                                    'assets/user_avatar.png',
                                                    fit: BoxFit.cover,
                                                  ).image)),
                                height: ScreenUtil.getInstance().setHeight(130),
                                width: ScreenUtil.getInstance().setHeight(130),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 30,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          snapshot.userName ?? '',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        width: ScreenUtil.getInstance()
                                            .setWidth(500),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil.getInstance()
                                            .setHeight(20),
                                      ),
                                      Container(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'ID: ${snapshot.userID ?? ''}',
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
                              onPressed: () {
                                snapshot.pickImageFromLibrary(() {
                                  Flushbar(
                                      title: "Successful",
                                      message: 'Image Uploaded!',
                                      duration: Duration(seconds: 3))
                                    ..show(context);
                                }, (description) {
                                  Flushbar(
                                      title: "Error",
                                      message: description,
                                      duration: Duration(seconds: 3))
                                    ..show(context);
                                });
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
                            style: TextStyle(color: Colors.black38),
                            controller: snapshot.currentPasswordController,
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
                              hintText: "Current Password",
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
                            controller: snapshot.newPasswordController,
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
                              hintText: "New Password",
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
                            controller: snapshot.confirmPasswordController,
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
                              hintText: "Confirm Password",
                              hintStyle:
                                  TextStyle(color: Colors.black26, height: 1.3),
                            ),
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            child: FlatButton(
                              onPressed: () {
                                snapshot.savePasswordUpdate(() {
                                  Navigator.of(context).pop();
                                  Flushbar(
                                      title: "Successful",
                                      message:
                                          'Your Password was successfully uploaded',
                                      duration: Duration(seconds: 3))
                                    ..show(context);
                                }, () {
                                  Flushbar(
                                      title: "Failure",
                                      message:
                                          'Failed to update your password. Please try again.',
                                      duration: Duration(seconds: 3))
                                    ..show(context);
                                });
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
                  LoadingWidget(
                    isVisible: snapshot.showLoad ?? false,
                  ),
                ],
              );
            })));
  }
}
