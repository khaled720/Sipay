
import 'dart:convert';
import 'package:localize_and_translate/localize_and_translate.dart';

import './activity_details.dart';
import 'package:animated_dialog/AnimatedDialog.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttersipay/Exchange/exchange.dart';
import 'package:fluttersipay/Money/Requset_money.dart';
import 'package:fluttersipay/Money/Send_money.dart';
import 'package:fluttersipay/Witdrawal/witdrawal.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/corporate/money/money_panel.dart';
import 'package:fluttersipay/corporate/withdrawal/create_withdrawal.dart';
import 'package:fluttersipay/dashboard/json_models/merchant_panel_ui_model.dart';
import 'package:fluttersipay/dashboard/providers/individual_panel_dashboard_provider.dart';
import 'package:fluttersipay/dashboard/repos/individual_repo.dart';
import 'package:fluttersipay/dashboard/security.dart';
import 'package:fluttersipay/deposit/deposit_panel.dart';
import 'package:fluttersipay/login_screens/login_main.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/src/custom_clipper.dart';
import 'package:fluttersipay/utils/app_utils.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Bank_account.dart';
import 'Help_panel.dart';
import 'Live_support.dart';
import 'Notification_settings.dart';
import 'Profilesetting_panel.dart';
import 'Transaction_history.dart';
import 'Transfer_settins.dart';

class MerchantPanelScreen extends StatefulWidget {
  final MainApiModel loginModel;
  final String token;

  MerchantPanelScreen(this.loginModel, this.token);

  @override
  _MerchantPanelScreenState createState() => _MerchantPanelScreenState();
}

class _MerchantPanelScreenState extends State<MerchantPanelScreen> {

String To2double(String val){
var s=double.parse(val).toStringAsFixed(2);
  return s; 
}

  String _language_value = 'en';
String capitalize(String s) {
 var listOfWords= s.split(" ");
String  inCaps="";//='${listOfWords[0][0].toUpperCase()}${listOfWords[0].substring(1)}';
for(int i=0;i<listOfWords.length;i++){

inCaps = inCaps+' ${listOfWords[i][0].toUpperCase()}${listOfWords[i].substring(1)}';
  
}

return inCaps;
}   

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
      final jsonA = await DefaultAssetBundle.of(context)
          .loadString('assets/json/dashboard/merchant_panel.json');
      final jsonB = await DefaultAssetBundle.of(context)
          .loadString('assets/json/dashboard/footer_tab.json');
      return {
        'merchant': jsonA,
        'footer': jsonB,
      };
    }

    return ChangeNotifierProvider(
        create: (context) => IndividualPanelProvider(
            IndividualMainRepository(widget.token), widget.loginModel),
        child: FutureBuilder(
            future: loadJson(),
            builder: (context, snapshot) {
     
              var parsedJson;
              var footerJson;
              if (snapshot.hasData) {
                parsedJson = json.decode(snapshot.data['merchant'].toString());
                footerJson = json.decode(snapshot.data['footer'].toString());
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
                        Consumer<IndividualPanelProvider>(
                            builder: (context, snapshot, _) {
                          return IconButton(
                            icon: Icon(
                              Icons.notifications_none,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NotificationSettingsScreen(
                                            snapshot.baseMainRepository),
                                  ));
                            },
                          );
                        })
                      ],
                    ),
                    drawer: Consumer<IndividualPanelProvider>(
                        builder: (context, snapshot, _) {
                      return Drawer(
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
                                          icon:
                                              const Icon(Icons.arrow_back_ios),
                                          color: Colors.white,
                                          iconSize: 16,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                      height: ScreenUtil.getInstance()
                                          .setHeight(120),
                                    ),
                                    Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                        translator.translate("menu"),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      height: ScreenUtil.getInstance()
                                          .setHeight(120),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/appbar_bg.png"),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(20),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Container(
                                          child: CircleAvatar(
                                              backgroundImage: snapshot
                                                          .userProfileImage !=
                                                      null
                                                  ? NetworkImage(
                                                      snapshot.userProfileImage
                                                          .toString()
                                                          .trim(),
                                                    )
                                                  : Image.asset(
                                                      'assets/user_avatar.png',
                                                      fit: BoxFit.cover,
                                                    ).image),
                                          height: ScreenUtil.getInstance()
                                              .setHeight(100),
                                          width: ScreenUtil.getInstance()
                                              .setHeight(100),
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
                                                snapshot.userName,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              width: ScreenUtil.getInstance()
                                                  .setWidth(300),
                                            ),
                                            SizedBox(
                                              height: ScreenUtil.getInstance()
                                                  .setHeight(10),
                                            ),
                                            Container(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  snapshot.phoneNumber,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black45,
                                                  ),
                                                ),
                                              ),
                                              width: ScreenUtil.getInstance()
                                                  .setWidth(300),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(10),
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
                                          Text(translator.translate("dash")),
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
                                          Text(translator.translate("tranaction")),
                                        ],
                                      ),
                                    )),
                                    onTap: () {
                                      //Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TransactionHistoryScreen(
                                                      snapshot
                                                          .individualMainRepository,
                                                      snapshot.userWallets,
                                                      UserTypes.Individual)));
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
                                       FontAwesomeIcons.moneyBillWaveAlt,
                                            color: Colors.blue,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(translator.translate("deposit")),
                                        ],
                                      ),
                                    )),
                                    onTap: () async {
                                      Navigator.pop(context);
                                      await Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DepositPanelScreen(
                                                      snapshot
                                                          .individualMainRepository,
                                                      snapshot.userWallets,
                                                      UserTypes.Individual)));
                                      snapshot.getDashboardDataFromApi();
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
                                            FontAwesomeIcons.database,
                                            color: Colors.blue,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(translator.translate("withdraw")),
                                        ],
                                      ),
                                    )),
                                    onTap: () async {
                                      Navigator.pop(context);
                                      await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                UserWithdrawalPanelScreen(
                                                    snapshot
                                                        .individualMainRepository,
                                                    snapshot.userWallets),
                                          ));
                                      snapshot.getDashboardDataFromApi();
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
                                          Text(translator.translate("exchange")),
                                        ],
                                      ),
                                    )),
                                    onTap: () async {
                                      Navigator.pop(context);
                                      await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ExchangePanelScreen(
                                                    snapshot
                                                        .individualMainRepository,
                                                    snapshot.userWallets,
                                                    UserTypes.Individual),
                                          ));
                                      snapshot.getDashboardDataFromApi();
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
                                              FontAwesomeIcons.paperPlane,
                                              color: Colors.blue,
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
translator.translate("moneytrans")


                                            ),
                                          ],
                                        ),
                                      )),
                                      backgroundColor: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.025),
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
                                                Text(
                                              translator.translate("sendmoney")
                                              
                                              ),
                                              ],
                                            ),
                                          )),
                                          onTap: () async {
                                            Navigator.pop(context);
                                            await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MoneyTransferSendScreen(
                                                          snapshot
                                                              .baseMainRepository,
                                                          snapshot.userWallets),
                                                ));
                                            snapshot.getDashboardDataFromApi();
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
                                                  FontAwesomeIcons.university,
                                                  color: Colors.blue,
                                                  size: 20,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(translator.translate("requestMoney")),
                                              ],
                                            ),
                                          )),
                                          onTap: () async {
                                            Navigator.pop(context);
                                            await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      RequestMoneyScreen(
                                                          snapshot
                                                              .baseMainRepository,
                                                          snapshot.userWallets),
                                                ));
                                            snapshot.getDashboardDataFromApi();
                                          },
                                        ),
                                      ]),
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
                                            Text(translator.translate("setting")),
                                          ],
                                        ),
                                      )),
                                      backgroundColor: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.025),
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
                                                Text(
                                        translator.translate("profile")
                                        ),
                                              ],
                                            ),
                                          )),
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfileSettingsScreen(
                                                          snapshot
                                                              .individualMainRepository,
                                                          widget.loginModel),
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
                                                  FontAwesomeIcons.university,
                                                  color: Colors.blue,
                                                  size: 20,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  
                                                  translator.translate("accounts")
                                                  ),
                                              ],
                                            ),
                                          )),
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      BankAccountScreen(snapshot
                                                          .baseMainRepository),
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
                                                  FontAwesomeIcons
                                                      .commentDollar,
                                                  color: Colors.blue,
                                                  size: 20,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                 translator.translate("moneytrans")),
                                              ],
                                            ),
                                          )),
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TransferSettingsScreen(
                                                    baseRepo: snapshot
                                                        .baseMainRepository,
                                                  ),
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
                                                Text(
                                                 translator.translate("Noti")
                                                 ),
                                              ],
                                            ),
                                          )),
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      NotificationSettingsScreen(
                                                          snapshot
                                                              .baseMainRepository),
                                                ));
                                          },
                                        ),
                                      ]),
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
                                            Icons.security,
                                            color: Colors.blue,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            
translator.translate("security")

                                          ),
                                        ],
                                      ),
                                    )),
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SecurityScreen(snapshot
                                                    .baseMainRepository),
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
                                            Icons.headset_mic,
                                            color: Colors.blue,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(translator.translate("help")),
                                        ],
                                      ),
                                    )),
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Help_detail(),
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
                                          Text(
                                            translator.translate("support")
                                          ),
                                        ],
                                      ),
                                    )),
                                    onTap: () {


                                      
                                    //////////////////////////////////////////
                                    //////////////////////////////////////////
                                    ////////////////////////////////////////////
                                    
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Live_Support(),
                                          ));
                                    
                                    
                                    
                                    },
                                  ),
                                  Divider(
                                    color: Colors.black12,
                                    height: 1.0,
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(60),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 10.0, right: 10.0),
                                          child: Container(
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 1.0,
                                                      style: BorderStyle.solid,
                                                      color: Colors.black45),
                                                ),
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  icon: Icon(Icons
                                                      .keyboard_arrow_down),
                                                  items: [
                                                    DropdownMenuItem(
                                                      value: 'en',
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          SizedBox(width: 10),
                                                          SizedBox(
                                                            child: Image.asset(
                                                              'icons/flags/png/gb.png',
                                                              package:
                                                                  'country_icons',
                                                              width: 20,
                                                            ),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Expanded(
                                                            child: Text(
                                                            "ENGLISH",
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    DropdownMenuItem(
                                                      value: 'tr',
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          SizedBox(width: 10),
                                                          SizedBox(
                                                            child: Image.asset(
                                                              'icons/flags/png/tr.png',
                                                              package:
                                                                  'country_icons',
                                                              width: 20,
                                                            ),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Expanded(
                                                            child: Text(
                                                            "Turkish",
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  
                                                  ],
                                                  onChanged: (value) {
print(value.toString());
                                                    if(value=="tr")translator.setNewLanguage(context, newLanguage: "tr", restart: false);
                                                    if(value=="en")translator.setNewLanguage(context, newLanguage: "en", restart: false);
                                                   
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
                                          padding: EdgeInsets.only(
                                              left: 10.0, right: 10.0),
                                          child: Container(
                                            child: FlatButton(
                                              onPressed: () {


var remem=false,email="",pass="",phone="",passCor="";

 SharedPreferences.getInstance().then((prefs) {

setState(() {
  remem = prefs.getBool("remember");
 
});

if(remem==true){

phone=prefs.getString("phone");
pass=prefs.getString("pass");
email=prefs.getString("email");
passCor=prefs.getString("passCor");

}



 });


                                                snapshot.logoutUser(() {
                                                  Navigator.of(context)
                                                       .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                  MyLoginPage(remem??false,email??"","",phone??"",false,""),));



                                                  Flushbar(
                                                    title: "Logout Successful!",
                                                    message:
                                                        "Logged out successfully.",
                                                    duration:
                                                        Duration(seconds: 3),
                                                  )..show(context);
                                                }, () {
                                                  Flushbar(
                                                    title: "Logout Failure!",
                                                    message:
                                                        "Failed to logout. Please try again.",
                                                    duration:
                                                        Duration(seconds: 3),
                                                  )..show(context);
                                                });
                                              },
                                              color: Colors.blue,
                                              disabledColor: Colors.blue,
                                              padding: EdgeInsets.all(16.0),
                                              child: Text(
                                              translator.translate("logout"),
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
                                    height:
                                        ScreenUtil.getInstance().setHeight(50),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                    backgroundColor: Colors.white,
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
                                              image: AssetImage(
                                                  'assets/dash_back.png')),
                                        ),
                                      ),
                                      new Opacity(
                                        opacity: 0.2,
                                        child:
                                            new Container(color: Colors.blue),
                                      ),
                                       new Transform.translate(
                                        offset: Offset(0.0, 50.0),
                                        child: Container(
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.0,
                                                  right: 10.0,
                                                  top: 30),
                                              child: new Swiper.children(
                                                autoplay: false,
                                                pagination:
                                                    new SwiperPagination(
                                                        margin: new EdgeInsets
                                                                .fromLTRB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                        builder:
                                                            new DotSwiperPaginationBuilder(
                                                          color: Colors.white54,
                                                          activeColor:
                                                              Colors.white,
                                                          size: 7.0,
                                                          activeSize: 7.0,
                                                        )),
                                                children: <Widget>[
                                   _getSlide(null, 0),
                         _getSlide(null, 1),
                     _getSlide(null, 2),
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
                         /*     new Transform.translate(
                              offset: Offset(0.0, 130.0),
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 0),
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
                                            margin: new EdgeInsets.fromLTRB(
                                                0.0, 0.0, 0.0, 10.0),
                                            builder:
                                                new DotSwiperPaginationBuilder(
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
                            ),  */
                            new Transform.translate(
                                offset:
                                    Offset(0.0, 130.0 + _media.height / 24.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 30.0, right: 30.0),
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                         translator.translate("lastActivity"),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                              ),
                                          ),
                                        )),
                                    Consumer<IndividualPanelProvider>(
                                        builder: (context, snapshot, _) {
                             //             print("     "+snapshot.getTransactionsListActivity()[0].toString());
                                      return SingleChildScrollView(
                                        child: Container(
                                          child: RefreshIndicator(
                                            onRefresh: snapshot
                                                .getDashboardDataFromApi,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: snapshot
                                                  .getTransactionsListActivity()
                                                  .length,
                                              itemBuilder:
                                                  (BuildContext content,
                                                      int index) {
                                       //    print(snapshot.userLastTransactionsActivity[
                                         ///                           index].toString());
                                                return lastActivityList(
                                                    title: AppUtils
                                                        .getTransactionableType(
                                                            snapshot.userLastTransactionsActivity[
                                                                    index][
                                                                'transactionable_type']),
                                                    value:
                                                        '${snapshot.userLastTransactionsActivity[index]['money_flow']} ${To2double(snapshot.userLastTransactionsActivity[index]['gross'].toString())} ${snapshot.userLastTransactionsActivity[index]['currency_symbol']}',
                                                    description:
                                                        this.capitalize(snapshot.userLastTransactionsActivity[index]['entity_name'].toString()),///(#${snapshot.userLastTransactionsActivity[index]['id']})
                                                    dates: snapshot
                                                            .userLastTransactionsActivity[
                                                        index]['created_at']
                                                        ,
                                         body: {

                               "id":snapshot.userLastTransactionsActivity[index]["id"],
                               "transactionable_id":snapshot.userLastTransactionsActivity[index]["transactionable_id"]
                              
                              , "payment_id":snapshot.userLastTransactionsActivity[index]["payment_id"]
                             ,
                               "entity_name":snapshot.userLastTransactionsActivity[index]["entity_name"]
                        
                               ,"money_flow":snapshot.userLastTransactionsActivity[index]["money_flow"]
                               ,"net":snapshot.userLastTransactionsActivity[index]["net"]
                               ,"currency_symbol":snapshot.userLastTransactionsActivity[index]["currency_symbol"]
                             ,"created_at":snapshot.userLastTransactionsActivity[index]["created_at"]
                             ,    "updated_at":snapshot.userLastTransactionsActivity[index]["updated_at"]
,  "transactionable_type":snapshot.userLastTransactionsActivity[index]["transactionable_type"]
                              







                                         }                                      
                                                      
                                                        );
                                              },
                                            ),
                                          ),
                                          height: _media.height * 0.5 - 45,
                                        ),
                                      );
                                    })
                                  ],
                                )),
                          ],
                        )),
                        Consumer<IndividualPanelProvider>(
                            builder: (context, snapshot, _) {
                          return Dashboardbottom(
                              context,
                              snapshot.baseMainRepository,
                              snapshot.userWallets,
                              UserTypes.Individual);
                        }),
                      ],
                    ));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }));
  }

   Widget _getSlide(users, index) {
    return Consumer<IndividualPanelProvider>(builder: (context, snapshot, _) {
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
                       translator.translate("balance"),
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
                                  text:
                                   snapshot.getTotalWalletAmount(index),
                                  style: TextStyle(
                                      color: Colors.white,
                                          fontSize:    25.0-snapshot.getAvailableWalletAmount(index).toString().length,
       
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                    text: snapshot.getWalletCurrencyCode2(index),
                                    style: TextStyle(
                                      
                                              fontSize:    23.0-snapshot.getAvailableWalletAmount(index).toString().length,
       
                                      color: Colors.white)),
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
                       translator.translate("availableBalance"),
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
                                  text:
                                      snapshot.getAvailableWalletAmount(index),
                                  style: TextStyle(
                                      color: Colors.white,
                 fontSize:    25.0-snapshot.getAvailableWalletAmount(index).toString().length,
        fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                    text: snapshot.getWalletCurrencyCode2(index),
                                    style: TextStyle(
                                    fontSize:    23.0-snapshot.getAvailableWalletAmount(index).toString().length,
                 
                                      color: Colors.white)),
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
    });
  }

/*   Widget _getSlideS(users) {
    return new Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Text(
            users.welcome,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Image.asset(
              'assets/welcome.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  } */ 

  Widget lastActivityList(
      {String title, String value, String description, String dates,dynamic body}) {
    return InkWell(

      onTap: (){

//print(map2.toString());
//print(title+"  "+body["id"].toString());
 
  Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => 
              ActivityDetailsScreen(body: body,)
));  
  
      },
          child: new Column(
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
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Expanded(
                      child: Text(
                  //    double.parse(value.replaceAll("+","").
              value
              ,
                        textAlign: TextAlign.right,
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
      ),
    );
  }
}

Widget Dashboardbottom(BuildContext context, BaseMainRepository baseRepo,
    var wallets, UserTypes userType) {
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
              FontAwesomeIcons.moneyBillWaveAlt,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                  translator.translate("deposit"),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                onPressed: ()async {
baseRepo.depositForm().then((x){
print("111111111111111111=>"+x.data.toString());
print("222222222222222222=>"+"/////"+wallets.toString());
print("33333333333333333=>"+userType.toString());

});
//print("NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN");
                Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DepositPanelScreen(baseRepo, wallets, userType))); 
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
                    translator.translate("moneytrans"),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => userType == UserTypes.Individual
                              ? MoneyTransferSendScreen(baseRepo, wallets)
                              : MoneyPanelScreen(baseRepo, wallets)));
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
                      FontAwesomeIcons.database,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                     translator.translate("withdraw"),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                onPressed: () {
                  userType == UserTypes.Individual
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context2) =>
                                UserWithdrawalPanelScreen(baseRepo, wallets),
                          ))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context2) =>
                                CreateCorporateWithdrawalsPanelScreen(
                                    baseRepo, wallets),
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
                      FontAwesomeIcons.exchangeAlt,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                 translator.translate("exchange"),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExchangePanelScreen(
                            baseRepo, wallets, UserTypes.Individual),
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
