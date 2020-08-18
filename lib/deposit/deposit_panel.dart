import 'dart:convert';

import 'package:flushbar/flushbar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/dashboard/Live_support.dart';
import 'package:fluttersipay/dashboard/merchant_panel.dart';
import 'package:fluttersipay/deposit/json_models/main_deposit_ui_model.dart';
import 'package:fluttersipay/deposit/providers/deposit_panel_provider.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import './create_deposit_card.dart';

import '../base_main_repo.dart';
import 'create_deposit_transfer.dart';

List<String> _listViewData;

class DepositPanelScreen extends StatefulWidget {
  final BaseMainRepository mainRepo;
  final UserTypes userType;
  final List userWallets;
  DepositPanelScreen(this.mainRepo, this.userWallets, this.userType);
  @override
  _DepositPanelScreenState createState() => _DepositPanelScreenState();
}

class _DepositPanelScreenState extends State<DepositPanelScreen> {
  var _value;
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
            DepositPanelProvider(widget.mainRepo, widget.userWallets),
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/json/deposit/6.1DepositMethod.json'),
            builder: (context, snapshot) {
              DepositMainUIModel users;
              var parsedJson;
              if (snapshot.hasData) {
                parsedJson = json.decode(snapshot.data.toString());
                users = DepositMainUIModel.fromJson(parsedJson);
                if (_value == null) _value = users.method[0];
                _listViewData = users.method;
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
                                      
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Live_Support(),
                                          ));
                                    
                          },
                        )
                      ],
                    ),
                    body: Consumer<DepositPanelProvider>(
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
                                    users.abailable,
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
                                              snapshot.getAvailableWalletAmount(
                                                      0) +
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
                                              snapshot.getAvailableWalletAmount(
                                                      1) +
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
                                            snapshot.getAvailableWalletAmount(
                                                    2) +
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
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(100),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 30.0, right: 30.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        users.deposit,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil.getInstance()
                                            .setHeight(50),
                                      ),
                                      Text(
                                        users.choose,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12),
                                      ),
                                      DropdownButton<String>(
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        items: users.method
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Icon(FontAwesomeIcons.wallet,color: Colors.grey,),
                                                SizedBox(width: 10),
                                                Expanded(
                                                  child: Text(
                                                    value,
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value;
                                          });


                 createDeposit(snapshot.mainRepo,
                                                snapshot.userWallets);  

                                        },
                                        value: _value,
                                        isExpanded: true,
                                      ),
                                      SizedBox(
                                        height: ScreenUtil.getInstance()
                                            .setHeight(30),
                                      ),
                                      Container(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child:
                                              Image.asset('assets/deposit.png'),
                                        ),
                                        height: ScreenUtil.getInstance()
                                            .setHeight(400),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil.getInstance()
                                            .setHeight(30),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                       /*  child: FlatButton(
                                          onPressed: () {

                 createDeposit(snapshot.mainRepo,
                                                snapshot.userWallets);  
                                          },
                                          child: Text(
                                            users.howto,
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ), */
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
                          Dashboardbottom(context, widget.mainRepo,
                              widget.userWallets, widget.userType),
                        ],
                      );
                    }));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }));
  }

   createDeposit(repo, wallets) {

//var list = json.decode(wallets.toString());


    if (_value == _listViewData[0]) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CreateBankTransferDepositScreen(repo, wallets),
          ));
    } else {

//print("#4#"+wallets[0]["allow_cc_deposit"].toString());

var acceptedCurrenciesID=[];
for(int i=0;i<wallets.length;i++){
if(wallets[i]["allow_cc_deposit"]==1)acceptedCurrenciesID.add(wallets[i]["currency_code"]);
}


if(acceptedCurrenciesID.length!=0){



      Navigator.push(
       context,
          MaterialPageRoute(
            builder: (context) => Create_Card(acceptedCurrenciesID),
         )); 
         
         }
         else{

  Flushbar(
    icon: Icon(Icons.warning,color: Colors.red,size: 25,),
                  margin: EdgeInsets.all(8),
                  borderRadius: 15,
                  message:  "You are not allowed to deposit by Credit Card",
                  duration:  Duration(seconds: 5),              
                )..show(context);


         }



    }
  }
}
