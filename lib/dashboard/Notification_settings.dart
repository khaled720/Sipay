import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/dashboard/providers/notification_settings_provider.dart';
import 'package:fluttersipay/loading_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../base_main_repo.dart';
import 'merchant_panel.dart';

class NotificationSettingsScreen extends StatefulWidget {
  final BaseMainRepository baseRepo;
  NotificationSettingsScreen(this.baseRepo);
  @override
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  var _check_value =
      List<List<bool>>.generate(4, (i) => List<bool>.generate(3, (j) => false));
  var _setting_data = [
    {
      "title": "Money Transfer",
      "description": " Simply dummy text",
    },
    {
      "title": "Transaction Refunds",
      "description": "Simply dummy text",
    },
    {
      "title": "Money Requests",
      "description": "Simply dummy text",
    },
    {
      "title": "Weekly Report",
      "description": " Simply dummy text",
    },
  ];

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
        create: (context) => NotificationSettingsProvider(widget.baseRepo),
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('NOTIFICATION SETTINGS'),
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
            body: Consumer<NotificationSettingsProvider>(
                builder: (context, snapshot, _) {
              return Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'NOTIFICATION SETTINGS',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Turn on or turn off notification options as desired.',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.phone_android,
                                            color: Colors.blue,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'APP',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black45),
                                          )
                                        ],
                                      ),
                                      width: 40,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            FontAwesomeIcons.commentDots,
                                            color: Colors.blue,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'SMS',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black45),
                                          )
                                        ],
                                      ),
                                      width: 40,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.email,
                                            color: Colors.blue,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'E-MAIL',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black45),
                                          )
                                        ],
                                      ),
                                      width: 40,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: new ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.notificationSettingsUI.length,
                            primary: true,
                            itemBuilder: (BuildContext content, int index) {
                              return new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          snapshot
                                              .notificationSettingsUI[index],
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: Text(''),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Container(
                                                    child: Checkbox(
                                                      value: true,
                                                      onChanged:
                                                          (bool value) {},
                                                    ),
                                                    width: 40,
                                                  ),
                                                  Container(
                                                    child: Checkbox(
                                                      value: snapshot
                                                              .checkedSMSList[
                                                          index],
                                                      onChanged: (bool value) {
                                                        snapshot.setSMSCheckBox(
                                                            index, value);
                                                      },
                                                    ),
                                                    width: 40,
                                                  ),
                                                  Container(
                                                    child: Checkbox(
                                                      value: snapshot
                                                              .checkedEmailList[
                                                          index],
                                                      onChanged: (bool value) {
                                                        snapshot
                                                            .setEmailCheckBox(
                                                                index, value);
                                                      },
                                                    ),
                                                    width: 40,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black45,
                                    height: 1.0,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Container(
                            child: FlatButton(
                              onPressed: () {
                                snapshot.saveNotificationSettings(() {
                                  Navigator.of(context).pop();
                                  Flushbar(
                                    title: "Success",
                                    message:
                                        'Notification Settings updated successfully.',
                                    duration: Duration(seconds: 3),
                                  )..show(context);
                                }, (description) {
                                  Flushbar(
                                    title: "Failure",
                                    message: description,
                                    duration: Duration(seconds: 3),
                                  )..show(context);
                                });
                              },
                              color: Colors.blue,
                              disabledColor: Colors.blue,
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "SAVE",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            width: ScreenUtil.getInstance().setWidth(690),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                        )
                      ],
                    ),
                  ),
                  Dashboardbottom(context, null, null),
                  LoadingWidget(
                    isVisible: snapshot.showLoad ?? false,
                  )
                ],
              );
            })));
  }
}
