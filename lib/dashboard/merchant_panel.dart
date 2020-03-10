import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/withdrawal/witdrawal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MerchantPanel extends StatefulWidget {
  MerchantPanel({Key key}) : super(key: key);
  @override
  MerchantPanelState createState() => MerchantPanelState();
}

class MerchantPanelState extends State<MerchantPanel> {
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
          title: Image.asset(
            'assets/logo-dashboard.png',
            height: ScreenUtil.getInstance().setHeight(40),
            fit: BoxFit.fitHeight,
          ),
          flexibleSpace: Image(
            image: AssetImage('assets/appbar_bg.png'),
            height: 100,
            fit: BoxFit.fitWidth,
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.dehaze),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              padding: const EdgeInsets.only(right: 20.0),
              icon: Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        drawer: Drawer(
            child: ListView(
          // Important: Remove any padding from the ListView.
          children: <Widget>[
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(120),
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                          iconSize: 16,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      height: ScreenUtil.getInstance().setHeight(120),
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'MENU',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      height: ScreenUtil.getInstance().setHeight(120),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image: AssetImage("assets/appbar_bg.png"),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(20),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    child: CircleAvatar(
                      backgroundImage: Image.asset(
                        'assets/user_avatar.png',
                        fit: BoxFit.cover,
                      ).image,
                    ),
                    height: ScreenUtil.getInstance().setHeight(100),
                    width: ScreenUtil.getInstance().setHeight(100),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          'ŞALLI ÇEYİZ PERDE',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        width: ScreenUtil.getInstance().setWidth(300),
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(10),
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '+90 555 892 3116',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        width: ScreenUtil.getInstance().setWidth(300),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(10),
            ),
            Container(
                child: Align(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.chartBar,
                      color: Colors.blue,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Dashboard'),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )),
            Divider(
              color: Colors.black12,
              height: 1.0,
            ),
            Container(
                child: Align(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.format_list_bulleted,
                      color: Colors.blue,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Transactions'),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )),
            Divider(
              color: Colors.black12,
              height: 1.0,
            ),
            Container(
                child: Align(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.database,
                      color: Colors.blue,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Deposits'),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/deposit_panel');
                },
              ),
            )),
            Divider(
              color: Colors.black12,
              height: 1.0,
            ),
            Container(
                child: Align(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.database,
                      color: Colors.blue,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Withdrawals'),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WithdrawalPanelScreen(),
                      ));
                },
              ),
            )),
            Divider(
              color: Colors.black12,
              height: 1.0,
            ),
            Container(
                child: Align(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.exchangeAlt,
                      color: Colors.blue,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Exchange'),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )),
            Divider(
              color: Colors.black12,
              height: 1.0,
            ),
            Container(
                child: Align(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.paperPlane,
                      color: Colors.blue,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Money Transfer'),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )),
            Divider(
              color: Colors.black12,
              height: 1.0,
            ),
            Container(
                child: Align(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.settings,
                      color: Colors.blue,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Settings'),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )),
            Divider(
              color: Colors.black12,
              height: 1.0,
            ),
            Container(
                child: Align(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.security,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Security'),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )),
            Divider(
              color: Colors.black12,
              height: 1.0,
            ),
            Container(
                child: Align(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.headset_mic,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Help'),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )),
            Divider(
              color: Colors.black12,
              height: 1.0,
            ),
            Container(
                child: Align(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.chat_bubble,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Support'),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )),
            Divider(
              color: Colors.black12,
              height: 1.0,
            ),
          ],
        )),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        child: FlatButton(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.map,
                                color: Colors.white,
                                size: 15,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Deposit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/deposit_panel');
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        child: FlatButton(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.paperPlane,
                                color: Colors.white,
                                size: 15,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'MoneyTransfer',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        child: FlatButton(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.database,
                                color: Colors.white,
                                size: 15,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Withdraw',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WithdrawalPanelScreen(),
                                ));
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        child: FlatButton(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.exchangeAlt,
                                color: Colors.white,
                                size: 15,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Exchange',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                height: 60,
                width: double.infinity,
              ),
            )
          ],
        ));
  }
}
