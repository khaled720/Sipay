import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'create_deposit.dart';
import 'package:fluttersipay/corporate/deposit/providers/corporate_deposit_panel_provider.dart';
import 'package:fluttersipay/corporate/deposit/json_models/c_bank_list_model.dart';


List<String> _listViewData;

class C_Depost_Panel extends StatefulWidget {
  final BaseMainRepository mainRepo;
  final List userWallets;
  C_Depost_Panel(this.mainRepo, this.userWallets);
  @override
  _Depostpanel createState() => _Depostpanel();
}

class _Depostpanel extends State<C_Depost_Panel> {


  var _value = null;
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
      create: (context) => Corporate_DepositPanelProvider(
        widget.mainRepo,
        widget.userWallets,
      ),
      child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/json/deposit/6.1DepositMethod.json'),
          builder: (context, snapshot) {
            depositpanel_json users;
            var parsedJson;
            if (snapshot.hasData) {
              parsedJson = json.decode(snapshot.data.toString());
              users = depositpanel_json.fromJson(parsedJson);
              if( _value == null) _value = users.method[0];
              _listViewData = ['CHOOSE BANK'];
              return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: Text(users.header),
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
                  body: Consumer<Corporate_DepositPanelProvider>(
                    builder: (context, snapshot, _){
                      return Stack(
                        children: <Widget>[
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: ScreenUtil.getInstance().setHeight(50),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 30, right: 30),
                                  child: Text(
                                    users.abailable,
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenUtil.getInstance().setHeight(50),
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
                                              snapshot.getAvailableWalletAmount(0) + '₺',
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
                                              snapshot.getAvailableWalletAmount(1) + "\$",
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
                                            snapshot.getAvailableWalletAmount(2) + '€',
                                            style: TextStyle(
                                                color: Colors.black54, fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: ScreenUtil.getInstance().setHeight(100),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        users.deposit,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                        ScreenUtil.getInstance().setHeight(50),
                                      ),
                                      Text(
                                        'BANK',
                                        style: TextStyle(
                                            color: Colors.black26, fontSize: 12),
                                      ),
                                      SizedBox(
                                        height:
                                        ScreenUtil.getInstance().setHeight(20),
                                      ),
                                      snapshot.bankList != null
                                          ? DropdownButton<CorporateBankModel>(
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 16,
                                        ),
                                        value:
                                        snapshot.selectedDropDownValue,
                                        items: snapshot.banksDropdown,
                                        onChanged: (CorporateBankModel bank) {
                                          snapshot.selectedDropDownValue =
                                              bank;
                                        },
                                        isExpanded: true,
                                      )
                                          : SizedBox(
                                        width: 0.0,
                                      ),
                                      SizedBox(
                                        height:
                                        ScreenUtil.getInstance().setHeight(100),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: FlatButton(
                                          onPressed: () {
                                            List data = snapshot.bankList;
                                            if (data.length == 0) return;
                                            Navigator.push(context, MaterialPageRoute(
                                              builder: (context) => C_Create_deposits(snapshot.mainRepo, snapshot.userWallets, snapshot.banksDropdown, snapshot.selectedDropDownValue),
                                            ));
                                          },
                                          child: Text(
                                            users.howto,
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
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
                        ],
                      );
                    }
                  )
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          }),
    );
  }

}

class depositpanel_json {
  String header;
  String abailable;
  List<String> abailableBalances;
  String deposit;
  String choose;
  List<String> method;
  String howto;
  List<String> footerTab;

  depositpanel_json(
      {this.header,
        this.abailable,
        this.abailableBalances,
        this.deposit,
        this.choose,
        this.method,
        this.howto,
        this.footerTab});

  depositpanel_json.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    abailable = json['abailable'];
    abailableBalances = json['abailable_balances'].cast<String>();
    deposit = json['deposit'];
    choose = json['choose'];
    method = json['method'].cast<String>();
    howto = json['howto'];
    footerTab = json['footer_tab'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['abailable'] = this.abailable;
    data['abailable_balances'] = this.abailableBalances;
    data['deposit'] = this.deposit;
    data['choose'] = this.choose;
    data['method'] = this.method;
    data['howto'] = this.howto;
    data['footer_tab'] = this.footerTab;
    return data;
  }
}
