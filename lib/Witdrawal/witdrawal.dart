import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Witdrawal/json_models/withdrawal_main_ui_model.dart';
import 'package:fluttersipay/Witdrawal/providers/withdrawal_provider.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/bottom_navigator.dart';
import 'package:fluttersipay/dashboard/Live_support.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import './withdraw_history.dart';
import 'create_withdraw.dart';

class UserWithdrawalPanelScreen extends StatefulWidget {
  UserWithdrawalPanelScreen(this.mainRepo, this.userWallets);

  final BaseMainRepository mainRepo;
  final List userWallets;

  @override
  _UserWithdrawalPanelScreen createState() => _UserWithdrawalPanelScreen();
}

class _UserWithdrawalPanelScreen extends State<UserWithdrawalPanelScreen> {
  int _index = 0;

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
        create: (context) =>
            WithdrawalProvider(widget.mainRepo, widget.userWallets),
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/json/Withdrawl/8.5Withdraw.json'),
            builder: (context, snapshot) {
            
              if (snapshot.hasData) {
            
                return Scaffold(
                    appBar: AppBar(
                      centerTitle: true,
                      title: Text(translator.translate("withdraw").toUpperCase()),
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
                    body: Consumer<WithdrawalProvider>(
                        builder: (context, snapshot, _) {
                      return Stack(
                        children: <Widget>[
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(50),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 30, right: 30),
                                  child: Text(
                              translator.translate("availableBalance"),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(50),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                          decoration: new BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                color: Colors.black54,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                  
                                                      
                            double.parse(snapshot.getAvailableWalletAmount(0).toString()).toStringAsFixed(2)+
                                                  '₺',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16),
                                            ),
                                          )),
                                    ),
                                    Expanded(
                                      child: Container(
                                          decoration: new BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                color: Colors.black54,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                      
                                                      
                            double.parse(snapshot.getAvailableWalletAmount(1).toString()).toStringAsFixed(2)+
                                                  "\$",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16),
                                            ),
                                          )),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                         
                                                      
                            double.parse(snapshot.getAvailableWalletAmount(2).toString()).toStringAsFixed(2)+
                                                '€',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 30.0, right: 30.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: ScreenUtil.getInstance()
                                            .setHeight(50),
                                      ),
                                      Container(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                              'assets/withdraw.png'),
                                        ),
                                        height: ScreenUtil.getInstance()
                                            .setHeight(450),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil.getInstance()
                                            .setHeight(20),
                                      ),
                               /*        Align(
                                        alignment: Alignment.center,
                                        child: FlatButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      CreateWithdrawScreen(
                                                          snapshot.mainRepo,
                                                          snapshot.userWallets,
                                                          0),
                                                ));
                                          },
                                          child: Text(
                                            users.howto,
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ), */
                                      SizedBox(
                                        height: ScreenUtil.getInstance()
                                            .setHeight(10),
                                      ),
                                      Container(
                                        child: FlatButton(
                                          onPressed: () {

                                            
                                                 Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      CreateWithdrawScreen(
                                                          snapshot.mainRepo,
                                                          snapshot.userWallets,
                                                          0),
                                                ));
                                        
                                             Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      CreateWithdrawScreen(
                                                          snapshot.mainRepo,
                                                          snapshot.userWallets,
                                                          1),
                                                )); 
                                          },
                                          color: Colors.blue,
                                          disabledColor: Colors.blue,
                                          padding: EdgeInsets.all(15.0),
                                          child: Text(
                                          translator.translate("newReq"),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        width: ScreenUtil.getInstance()
                                            .setWidth(690),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil.getInstance()
                                            .setHeight(30),
                                      ),
                                      Container(
                                        child: FlatButton(
                                          onPressed: () {

// withdrawal history





 Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      withdrawHistorty(
                                                    widget.mainRepo
                                                          //snapshot.mainRepo,
                                                          //snapshot.userWallets,
                                                          ),
                                                )); 




                                          },
                                          color: Colors.blue,
                                          disabledColor: Colors.blue,
                                          padding: EdgeInsets.all(15.0),
                                          child: Text(
                                            translator.translate("WithHis"),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        width: ScreenUtil.getInstance()
                                            .setWidth(690),
                                      ),
                                      SizedBox(
                                        height: 60,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          getCustomNavigator(
                              context,
                        [
    translator.translate("deposit"),
    translator.translate("moneytrans"),
    translator.translate("withdraw"),
    translator.translate("exchange")
  ],
                              2,
                              widget.mainRepo,
                              widget.userWallets,
                              UserTypes.Individual),
                        ],
                      );
                    }));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }));
  }
}
