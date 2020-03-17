import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttersipay/Dashboard/security.dart';
import 'package:fluttersipay/Exchange/exchange.dart';
import 'package:fluttersipay/corporate/Money/money_panel.dart';
import 'package:fluttersipay/corporate/withdrawal/create_withdrawal.dart';
import 'package:fluttersipay/corporate/payment/payment_link.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'support.dart';
import 'Profilesetting_panel.dart';
import 'Transaction_history.dart';
import 'installment.dart';
import 'notification_panel.dart';
import '../limits/limits_panel.dart';
import 'agreements.dart';


Widget C_Merchant_panel() {
  return MerchantPanel();
}


class MerchantPanel extends StatefulWidget {
  MerchantPanel({Key key}) : super(key: key);
  @override
  _MerchantPanel createState() => _MerchantPanel();
}

class _MerchantPanel extends State<MerchantPanel> {


  String _language_value = 'gb';

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
    final _media = MediaQuery.of(context).size;

    Future<Map<String, String>> loadJson() async {
      final jsonA = await DefaultAssetBundle.of(context).loadString('assets/json/dashboard/c_merchant_panel.json');
      final jsonB = await DefaultAssetBundle.of(context).loadString('assets/json/dashboard/footer_tab.json');
      return {
        'merchant': jsonA,
        'footer': jsonB,
      };
    }

    return new FutureBuilder(
        future: loadJson(),

        builder: (context, snapshot) {
          merchantpanel_json users;
          footer_json footers;
          var parsedJson;
          var footerJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data['merchant'].toString());
            footerJson = json.decode(snapshot.data['footer'].toString());
            users = merchantpanel_json.fromJson(parsedJson);
            footers = footer_json.fromJson(footerJson);

            return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  title: Image.asset(
                    'assets/logo-dashboard.png',
                    height: ScreenUtil.getInstance().setHeight(40),
                    fit: BoxFit.fitHeight,
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
                      icon: Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context)=> C_Notification_Panel(),
                            ));
                        // do something
                      },
                    )
                  ],
                ),
                drawer: Drawer(
                  child:ListView(
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
                                    users.menuList.menu,
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
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
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
                                          users.profile.name,
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
                                            users.profile.phone,
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
                            ListTile(
                              title: Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
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
                                        Text(users.menuList.dashboard),
                                      ],
                                    ),
                                  )),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            Divider(
                              color: Colors.black12,
                              height: 1.0,
                            ),
                            ListTile(
                              title: Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
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
                                        Text(users.menuList.transactions),
                                      ],
                                    ),
                                  )),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(context,
                                    MaterialPageRoute(
                                      builder: (context) => C_Transaction_History(),
                                    )
                                );
                              },
                            ),
                            Divider(
                              color: Colors.black12,
                              height: 1.0,
                            ),
                            ListTile(
                              title: Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.dollarSign,
                                          color: Colors.blue,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(users.menuList.transactions),
                                      ],
                                    ),
                                  )),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(context, '/deposit_panel');
                              },
                            ),
                            Divider(
                              color: Colors.black12,
                              height: 1.0,
                            ),
                            ListTile(
                              title: Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
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
                                        Text(users.menuList.exchange),
                                      ],
                                    ),
                                  )),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Exchange(),
                                ));
                              },
                            ),
                            Divider(
                              color: Colors.black12,
                              height: 1.0,
                            ),
                            ListTile(
                              title: Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.map,
                                          color: Colors.blue,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(users.menuList.deposit),
                                      ],
                                    ),
                                  )),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Security(),
                                ));
                              },
                            ),
                            Divider(
                              color: Colors.black12,
                              height: 1.0,
                            ),
                            ListTile(
                              title: Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.indent,
                                          color: Colors.blue,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(users.menuList.mobile),
                                      ],
                                    ),
                                  )),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=> limits_Panel(),
                                ));
                              },
                            ),
                            Divider(
                              color: Colors.black12,
                              height: 1.0,
                            ),
                            ListTile(
                              title: Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.chartPie,
                                          color: Colors.blue,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(users.menuList.installment),
                                      ],
                                    ),
                                  )),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=> Installment_Rates(),
                                ));
                              },
                            ),
                            Divider(
                              color: Colors.black12,
                              height: 1.0,
                            ),
                            ListTile(
                              title: Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
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
                                        Text(users.menuList.agreements),
                                      ],
                                    ),
                                  )),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=> Agreements_Panel(),
                                ));
                              },
                            ),
                            Divider(
                              color: Colors.black12,
                              height: 1.0,
                            ),
                            ListTile(
                              title: Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.chat_bubble,
                                          color: Colors.blue,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(users.menuList.support),
                                      ],
                                    ),
                                  )),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Live_Support(),
                                ));
                              },
                            ),
                            Divider(
                              color: Colors.black12,
                              height: 1.0,
                            ),
                            ExpansionTile(
                                title: Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
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
                                          Text(users.menuList.settings[0]),
                                        ],
                                      ),
                                    )),
                                backgroundColor:
                                Theme.of(context).accentColor.withOpacity(0.025),
                                children: <Widget>[
                                  Divider(
                                    color: Colors.black12,
                                    height: 1.0,
                                  ),
                                  new ListTile(
                                    title: Container(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Icon(
                                                FontAwesomeIcons.userEdit,
                                                color: Colors.blue,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(users.menuList.settings[1]),
                                            ],
                                          ),
                                        )),
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                            builder:
                                                (context)=>C_PROFILE_Panel(),
                                          ));
                                    },
                                  ),
                                  Divider(
                                    color: Colors.black12,
                                    height: 1.0,
                                  ),
                                  new ListTile(
                                    title: Container(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Icon(
                                                Icons.notifications,
                                                color: Colors.blue,
                                                size: 20,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(users.menuList.settings[2]),
                                            ],
                                          ),
                                        )),
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                            builder: (context)=> C_Notification_Panel(),
                                          ));
                                    },
                                  ),
                                ]),

                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(50),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                    child: Container(
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 1.0,
                                                style: BorderStyle.solid,
                                                color: Colors.black45),
                                          ),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            icon: Icon(Icons.keyboard_arrow_down),
                                            items: [
                                              DropdownMenuItem(
                                                value: 'gb',
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    SizedBox(width: 10),
                                                    SizedBox(
                                                      child: Image.asset(
                                                        'icons/flags/png/gb.png',
                                                        package: 'country_icons',
                                                        width: 20,
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Expanded(
                                                      child: Text(
                                                        users.menuList.language[0],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              DropdownMenuItem(
                                                value: 'ru',
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    SizedBox(width: 10),
                                                    SizedBox(
                                                      child: Image.asset(
                                                        'icons/flags/png/ru.png',
                                                        package: 'country_icons',
                                                        width: 20,
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Expanded(
                                                      child: Text(
                                                        users.menuList.language[1],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              DropdownMenuItem(
                                                value: 'tr',
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    SizedBox(width: 10),
                                                    SizedBox(
                                                      child: Image.asset(
                                                        'icons/flags/png/tr.png',
                                                        package: 'country_icons',
                                                        width: 20,
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Expanded(
                                                      child: Text(
                                                        users.menuList.language[2],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                            onChanged: (value) {
                                              setState(() {
                                                _language_value = value;
                                              });
                                            },
                                            value: _language_value,
                                            isExpanded: true,
                                          ),
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                    child: Container(
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.popUntil(
                                              context, ModalRoute.withName('/'));
                                        },
                                        color: Colors.blue,
                                        disabledColor: Colors.blue,
                                        padding: EdgeInsets.all(16.0),
                                        child: Text(
                                          users.menuList.logout,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(50),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                body: Stack(
                  children: <Widget>[
                    Container(
                        child: Stack(
                          children: <Widget>[
                            new Transform.translate(
                              offset: Offset(0.0, -56.0),
                              child: new Container(
                                child: new ClipPath(
                                  clipper: new MyClipper(),
                                  child: new Stack(
                                    children: [
                                      Container(
                                        decoration: new BoxDecoration(
                                          image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage('assets/dash_back.png')),
                                        ),
                                      ),
                                      new Opacity(
                                        opacity: 0.2,
                                        child: new Container(color: Colors.blue),
                                      ),
                                      new Transform.translate(
                                        offset: Offset(0.0, 50.0),
                                        child: Container(
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.0, right: 10.0, top: 30),
                                              child: new Swiper.children(
                                                autoplay: false,
                                                pagination: new SwiperPagination(
                                                    margin: new EdgeInsets.fromLTRB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                    builder: new DotSwiperPaginationBuilder(
                                                      color: Colors.white54,
                                                      activeColor: Colors.white,
                                                      size: 7.0,
                                                      activeSize: 7.0,
                                                    )),
                                                children: <Widget>[
                                                  _getSlide(users),
                                                  _getSlide(users),
                                                  _getSlide(users),
                                                ],
                                              )),
                                          height: 130,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            new Transform.translate(
                              offset: Offset(0.0, 130.0),
                              child: Container(
                                child: Padding(
                                  padding:
                                  EdgeInsets.only(left: 25.0, right: 25.0, top: 0),
                                  child: Container(
                                      decoration: new BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 0.5,
                                          ),
                                        ],
                                        color: Colors.white,
                                      ),
                                      child: new Swiper.children(
                                        autoplay: false,
                                        pagination: new SwiperPagination(
                                            margin:
                                            new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                                            builder: new DotSwiperPaginationBuilder(
                                              color: Colors.blueGrey,
                                              activeColor: Colors.blueAccent,
                                              size: 7.0,
                                              activeSize: 7.0,
                                            )),
                                        children: <Widget>[
                                          _getSlideS(users),
                                          _getSlideS(users),
                                          _getSlideS(users),
                                        ],
                                      )),
                                ),
                                height: _media.height / 4.0,
                              ),
                            ),
                            new Transform.translate(
                                offset: Offset(0.0, 130.0 + _media.height /4.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            users.last,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                        )
                                    ),
                                    SingleChildScrollView(
                                      child: Container(
                                        child: new ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: users.lastActivities.length,
                                          itemBuilder: (BuildContext content, int index){
                                            return LastActivityList(
                                                title: users.lastActivities[index].title,
                                                value: users.lastActivities[index].value,
                                                description: users.lastActivities[index].description,
                                                dates: users.lastActivities[index].dates
                                            );
                                          },
                                        ),
                                        height: _media.height * 0.5 - 160,
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ],
                        )),
                    Dashboardbottom(context),
                  ],
                ));

          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });

  }

  Widget _getSlide(users) {
    return Padding(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: new Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      users.total,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          // set the default style for the children TextSpans
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: users.balance.tot,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text: 'TL',
                                  style: TextStyle(color: Colors.white)),
                            ])),
                    alignment: Alignment.bottomLeft,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              height: 100,
            ),
            flex: 3,
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      users.available,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  Container(
                    child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          // set the default style for the children TextSpans
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: users.balance.avail,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text: 'TL',
                                  style: TextStyle(color: Colors.white)),
                            ])),
                    alignment: Alignment.bottomRight,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              height: 100,
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getSlideS(users) {
    return new Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Text(users.welcome,
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold
            ),),
          Expanded(
            child: Image.asset('assets/welcome.png', fit: BoxFit.cover,),
          )
        ],
      ),
    );
  }

  Widget LastActivityList({String title, String value, String description, String dates}) {

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                  ),
                  Expanded(
                    child: Text(
                      value,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      description,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      dates,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Divider(
          height: 1.0,
          color: Colors.black12,
        )
      ],
    );
  }
}

Widget Dashboardbottom(BuildContext context){
  return Align(
    alignment: Alignment.bottomCenter,
    child: SizedBox(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
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
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Create_withdraws(),
                  ));
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
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
                      'Money Transfer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => MoneyPanel(),
                      ));
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
              child: FlatButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.link,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Payment Link',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Payment_Link(),
                      ));
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
              child: FlatButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.creditCard,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Mobile POS',
                      style: TextStyle(
                          color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => limits_Panel(),
                  ));
                },
              ),
            ),
          ),
        ],
      ),
      height: 60,
      width: double.infinity,
    ),
  );
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height / 3.0);
    p.lineTo(0.0, size.height / 2.5);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class merchantpanel_json {
  String total;
  String available;
  List<String> availableBalances;
  String welcome;
  String last;
  Balance balance;
  Profile profile;
  List<LastActivities> lastActivities;
  MenuList menuList;

  merchantpanel_json(
      {this.total,
        this.available,
        this.availableBalances,
        this.welcome,
        this.last,
        this.balance,
        this.profile,
        this.lastActivities,
        this.menuList});

  merchantpanel_json.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    available = json['available'];
    availableBalances = json['available_balances'].cast<String>();
    welcome = json['welcome'];
    last = json['last'];
    balance =
    json['balance'] != null ? new Balance.fromJson(json['balance']) : null;
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    if (json['last_activities'] != null) {
      lastActivities = new List<LastActivities>();
      json['last_activities'].forEach((v) {
        lastActivities.add(new LastActivities.fromJson(v));
      });
    }
    menuList = json['menu_list'] != null
        ? new MenuList.fromJson(json['menu_list'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['available'] = this.available;
    data['available_balances'] = this.availableBalances;
    data['welcome'] = this.welcome;
    data['last'] = this.last;
    if (this.balance != null) {
      data['balance'] = this.balance.toJson();
    }
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    if (this.lastActivities != null) {
      data['last_activities'] =
          this.lastActivities.map((v) => v.toJson()).toList();
    }
    if (this.menuList != null) {
      data['menu_list'] = this.menuList.toJson();
    }
    return data;
  }
}

class Balance {
  String tot;
  String avail;

  Balance({this.tot, this.avail});

  Balance.fromJson(Map<String, dynamic> json) {
    tot = json['tot'];
    avail = json['avail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tot'] = this.tot;
    data['avail'] = this.avail;
    return data;
  }
}

class Profile {
  String name;
  String phone;

  Profile({this.name, this.phone});

  Profile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}

class LastActivities {
  String title;
  String value;
  String description;
  String dates;

  LastActivities({this.title, this.value, this.description, this.dates});

  LastActivities.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
    description = json['description'];
    dates = json['dates'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['value'] = this.value;
    data['description'] = this.description;
    data['dates'] = this.dates;
    return data;
  }
}

class MenuList {
  String menu;
  String dashboard;
  String transactions;
  String acitvities;
  String exchange;
  String deposit;
  String mobile;
  String installment;
  String agreements;
  String support;
  List<String> settings;
  List<String> language;
  String logout;

  MenuList(
      {this.menu,
        this.dashboard,
        this.transactions,
        this.acitvities,
        this.exchange,
        this.deposit,
        this.mobile,
        this.installment,
        this.agreements,
        this.support,
        this.settings,
        this.language,
        this.logout});

  MenuList.fromJson(Map<String, dynamic> json) {
    menu = json['menu'];
    dashboard = json['dashboard'];
    transactions = json['transactions'];
    acitvities = json['acitvities'];
    exchange = json['exchange'];
    deposit = json['deposit'];
    mobile = json['mobile'];
    installment = json['installment'];
    agreements = json['agreements'];
    support = json['support'];
    settings = json['settings'].cast<String>();
    language = json['language'].cast<String>();
    logout = json['logout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu'] = this.menu;
    data['dashboard'] = this.dashboard;
    data['transactions'] = this.transactions;
    data['acitvities'] = this.acitvities;
    data['exchange'] = this.exchange;
    data['deposit'] = this.deposit;
    data['mobile'] = this.mobile;
    data['installment'] = this.installment;
    data['agreements'] = this.agreements;
    data['support'] = this.support;
    data['settings'] = this.settings;
    data['language'] = this.language;
    data['logout'] = this.logout;
    return data;
  }
}

//Footer

class footer_json {
  List<String> footerTab;

  footer_json({this.footerTab});

  footer_json.fromJson(Map<String, dynamic> json) {
    footerTab = json['footer_tab'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['footer_tab'] = this.footerTab;
    return data;
  }
}