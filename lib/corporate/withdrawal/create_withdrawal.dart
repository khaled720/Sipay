import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Witdrawal/withdrawal_otp.dart';
import 'package:fluttersipay/corporate/withdrawal/json_models/withdraw_request_ui_model.dart';
import 'package:fluttersipay/corporate/withdrawal/providers/providers/create_bank_withdrawal_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../base_main_repo.dart';
import 'json_models/corporate_withdrawal_bank_model.dart';

int button_set = 0;

class CreateCorporateWithdrawalsPanelScreen extends StatefulWidget {
  final BaseMainRepository mainRepo;
  final List userWallets;
  CreateCorporateWithdrawalsPanelScreen(this.mainRepo, this.userWallets);
  @override
  _CreateCorporateWithdrawalsPanelScreenState createState() =>
      _CreateCorporateWithdrawalsPanelScreenState();
}

class _CreateCorporateWithdrawalsPanelScreenState
    extends State<CreateCorporateWithdrawalsPanelScreen> {
  var _try_value_1 = null;
  var _try_value_2 = null;
  var _try_value_3 = null;
  var _try_value_4 = null;
  var _savedaccount = null;
  var _bank_value = null;

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
        create: (context) => CreateCorporateBankWithdrawProvider(
            widget.mainRepo,
            widget.userWallets,
            TextEditingController(),
            TextEditingController(),
            TextEditingController(),
            TextEditingController(),
            TextEditingController()),
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/json/Withdrawl/8.6Withdraw_request.json'),
            builder: (context, snapshot) {
              RequestWithdrawUiModel users;
              var parsedJson;
              if (snapshot.hasData) {
                parsedJson = json.decode(snapshot.data.toString());
                users = RequestWithdrawUiModel.fromJson(parsedJson);
                if (_try_value_1 == null &&
                    _try_value_2 == null &&
                    _try_value_3 == null &&
                    _try_value_4 == null &&
                    _savedaccount == null &&
                    _bank_value == null) {
                  _try_value_1 = _try_value_2 =
                      _try_value_3 = _try_value_4 = users.trys[0];
                  _savedaccount = users.accountSelect[0];
                  _bank_value = users.bankSelect[0];
                }
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
                  body: Consumer<CreateCorporateBankWithdrawProvider>(
                      builder: (context, snapshot, _) {
                    return SingleChildScrollView(
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
                                        snapshot.getAvailableWalletAmount(0) +
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
                                        snapshot.getAvailableWalletAmount(1) +
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
                                      snapshot.getAvailableWalletAmount(2) +
                                          '€',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 16),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(50),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  users.tobank,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(20),
                                ),
                                Text(
                                  users.select,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15,
                                      height: 1.3),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(40),
                                ),
                                Text(
                                  'CHOOSE SAVED ACCOUNT',
                                  style: TextStyle(
                                      color: Colors.black26, fontSize: 12),
                                ),
                                snapshot.bankList != null
                                    ? DropdownButton<
                                        CorporateWithdrawalBankModel>(
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        items: snapshot.banksDropdown,
                                        onChanged: (bank) {
                                          snapshot.selectedDropDownValue = bank;
                                        },
                                        value:
                                            snapshot.selectedBankDropDownValue,
                                        isExpanded: true,
                                      )
                                    : SizedBox(
                                        width: 0.0,
                                      ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(30),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'AMOUNT',
                                      style: TextStyle(
                                          color: Colors.black26, fontSize: 12),
                                    ),
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: TextFormField(
                                              style: TextStyle(
                                                  color: Colors.black),
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  snapshot.amountController,
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.black26,
                                                            width: 0.5)),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.black26,
                                                            width: 0.5)),
                                                prefixIcon: const Icon(
                                                  Icons.map,
                                                  size: 16,
                                                  color: Colors.black26,
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter WITHDRAW AMOUNT';
                                                }
                                                return null;
                                              },
                                              obscureText: false,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            decoration: new BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.black26,
                                                  width: 0.5,
                                                ),
                                              ),
                                            ),
                                            child: DropdownButton<String>(
                                              icon: Icon(
                                                  Icons.keyboard_arrow_down),
                                              items: snapshot.currenciesDropDown
                                                  .map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Icon(Icons.map),
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
                                                snapshot
                                                    .setCurrencyDropDownValue(
                                                        value);
                                              },
                                              value: snapshot
                                                  .selectedCurrencyDropDownValue,
                                              isExpanded: true,
                                            ),
                                            width: 100,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      users.withdrawField[6],
                                      style: TextStyle(
                                          color: Colors.black26, fontSize: 12),
                                    ),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Expanded(
                                            child: TextFormField(
                                              style: TextStyle(
                                                  color: Colors.black),
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  snapshot.feeController,
                                              enabled: false,
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.black26,
                                                            width: 0.5)),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.black26,
                                                            width: 0.5)),
                                                prefixIcon: const Icon(
                                                  Icons.save,
                                                  size: 16,
                                                  color: Colors.black26,
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter TRANSACTION FEE';
                                                }
                                                return null;
                                              },
                                              obscureText: false,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            decoration: new BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.black26,
                                                  width: 0.5,
                                                ),
                                              ),
                                            ),
                                            child: DropdownButton<String>(
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                size: 16,
                                              ),
                                              items: snapshot.currencyDropDown
                                                  .map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      SizedBox(width: 10),
                                                      Expanded(
                                                        child: Text(
                                                          value,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black45),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
//                                                        setState(() {
//                                                          _try_value_2 = value;
//                                                        });
                                              },
                                              value:
                                                  snapshot.currencyDropDown[0],
                                              isExpanded: true,
                                            ),
                                            width: 100,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'SWIFT CODE',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12),
                                        ),
                                        TextFormField(
                                            style:
                                                TextStyle(color: Colors.black),
                                            controller:
                                                snapshot.swiftController,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black45,
                                                          width: 1.0)),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black45,
                                                          width: 1.0)),
                                              prefixIcon: const Icon(
                                                FontAwesomeIcons.hashtag,
                                                size: 16,
                                                color: Colors.black45,
                                              ),
                                            ),
                                            validator: (value) => value.isEmpty
                                                ? 'Please enter Swift Code'
                                                : null),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      users.withdrawField[7],
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12),
                                    ),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Expanded(
                                            child: TextFormField(
                                              style: TextStyle(
                                                  color: Colors.black),
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  snapshot.netAccountController,
                                              enabled: false,
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.black26,
                                                            width: 0.5)),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.black26,
                                                            width: 0.5)),
                                                prefixIcon: const Icon(
                                                  FontAwesomeIcons.database,
                                                  size: 16,
                                                  color: Colors.black26,
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter WITHDRAW AMOUNT';
                                                }
                                                return null;
                                              },
                                              obscureText: false,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            decoration: new BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.black26,
                                                  width: 0.5,
                                                ),
                                              ),
                                            ),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                icon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  size: 16,
                                                ),
                                                items: snapshot.currencyDropDown
                                                    .map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        SizedBox(width: 10),
                                                        Expanded(
                                                          child: Text(
                                                            value,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black45),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
//                                                        setState(() {
//                                                          _try_value_3 = value;
//                                                        });
                                                },
                                                value: snapshot
                                                    .currencyDropDown[0],
                                                isExpanded: true,
                                              ),
                                            ),
                                            width: 100,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(10),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(40),
                                ),
                                Visibility(
                                  visible: snapshot.withdrawalErrorText != null,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        snapshot.withdrawalErrorText ?? '',
                                        style: TextStyle(
                                            color: Colors.red[800],
                                            fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil.getInstance()
                                            .setHeight(30),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: FlatButton(
                                    onPressed: () {
                                      snapshot.createWithdrawal((phoneNumber,
                                          otpModel, mainRepo, userType) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WithdrawalOTPScreen(
                                                        phoneNumber,
                                                        otpModel,
                                                        userType,
                                                        mainRepo)));
                                      }, (description) {
                                        Flushbar(
                                          title: "Failure",
                                          message: description,
                                          duration: Duration(seconds: 3),
                                        )..show(context);
                                      });
//                                      Navigator.push(
//                                          context,
//                                          MaterialPageRoute(
//                                            builder: (context) =>
//                                                WithdrawSuccessScreen(),
//                                          ));
                                    },
                                    color: Colors.blue,
                                    disabledColor: Colors.blue,
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      'SEND REQUEST',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  width: ScreenUtil.getInstance().setWidth(690),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(20),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }));
  }
}
