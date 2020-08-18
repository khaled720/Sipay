import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Witdrawal/json_models/withdrawal_bank_model.dart';
import 'package:fluttersipay/Witdrawal/providers/create_bank_withdrawal_provider.dart';
import 'package:fluttersipay/Witdrawal/withdrawal_otp.dart';
import 'package:fluttersipay/corporate/withdrawal/json_models/withdraw_request_ui_model.dart';
import 'package:fluttersipay/dashboard/Live_support.dart';
import 'package:fluttersipay/loading_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart' as translator;
import '../base_main_repo.dart';

int button_set = 0;

class CreateWithdrawScreen extends StatefulWidget {
  final BaseMainRepository mainRepo;
  final List userWallets;
  final int data;

  CreateWithdrawScreen(this.mainRepo, this.userWallets, this.data);

  @override
  _CreateWithdrawScreenState createState() => _CreateWithdrawScreenState();
}

class _CreateWithdrawScreenState extends State<CreateWithdrawScreen> {
  var tryValue1;
  var tryValue2;
  var tryValue3;
  var tryValue4;
  var savedAccount;
  var bankValue;

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
        create: (context) => CreateBankWithdrawProvider(
            widget.mainRepo,
            widget.userWallets,
            TextEditingController(),
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
                if (tryValue1 == null &&
                    tryValue2 == null &&
                    tryValue3 == null &&
                    tryValue4 == null &&
                    savedAccount == null &&
                    bankValue == null) {
                  tryValue1 = tryValue2 = tryValue3 = tryValue4 = users.trys[0];
                  savedAccount = users.accountSelect[0];
                  bankValue = users.bankSelect[0];
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
                  body: Consumer<CreateBankWithdrawProvider>(
                      builder: (context, snapshot, _) {
                    return Stack(
                      alignment: Alignment.center,
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                                          snapshot.getAvailableWalletAmount(2) +
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
                                height: ScreenUtil.getInstance().setHeight(50),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0, right: 30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      users.tobank ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(10),
                                    ),
                                    Text(
                                      users.select ?? '',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(30),
                                    ),
                                    Text(
                                      users.withdrawField[0] ?? '',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12),
                                    ),
                                    snapshot.savedBanksDropdown != null
                                        ? DropdownButton<WithdrawalBankModel>(
                                            icon:
                                                Icon(Icons.keyboard_arrow_down),
                                            items: snapshot.savedBanksDropdown,
                                            onChanged: (value) {
                          
                                              
                                              snapshot
                                                  .setSavedBankAccountDropdownValue(
                                                      value);
                                            },
                                            value: snapshot
                                                .savedAccountSelectedDropdownValue,
                                            isExpanded: true,
                                          )
                                        : SizedBox(
                                            width: 0.0,
                                          ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(30),
                                    ),
                                    Text(
                                      users.withdrawField[1],
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12),
                                    ),
                                    snapshot.bankList != null
                                        ? DropdownButton<WithdrawalBankModel>(
                                            icon:
                                                Icon(Icons.keyboard_arrow_down),
                                            items: snapshot.banksDropdown,
                                            onChanged: (bank) {
                                              snapshot.selectedDropDownValue =
                                                  bank;
                                      //          print("aaa"+bank.issuerName);
                                            },
                                            value: snapshot
                                                .selectedBankDropDownValue,
                                            isExpanded: true,
                                          )
                                        : SizedBox(
                                            width: 0.0,
                                          ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(30),
                                    ),
                                    Text(
                                      users.withdrawField[2],
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12),
                                    ),
                                    Container(
                                      child: DropdownButton<String>(
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        items: snapshot.currenciesDropDown
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                               Icon(FontAwesomeIcons.moneyBillWaveAlt,color: Colors.grey,), 
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
                                              .setCurrencyDropDownValue(value);
                                        },
                                        value: snapshot
                                            .selectedCurrencyDropDownValue,
                                        isExpanded: true,
                                      ),
                                      width: ScreenUtil.getInstance()
                                          .setWidth(300),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: ScreenUtil.getInstance()
                                              .setHeight(10),
                                        ),
                                        Text(
                                          users.withdrawField[3],
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12),
                                        ),
                                        new TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          controller:
                                              snapshot.accountHolderController,
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45,
                                                    width: 1.0)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45,
                                                    width: 1.0)),
                                            prefixIcon: const Icon(
                                              Icons.person,
                                              size: 16,
                                              color: Colors.black45,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter ACCOUNT HOLDER NAME';
                                            }
                                            return null;
                                          },
                                          obscureText: false,
                                        ),
                                        SizedBox(
                                          height: ScreenUtil.getInstance()
                                              .setHeight(10),
                                        ),
                                        Text(
                                          users.withdrawField[4],
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12),
                                        ),
                                        TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          controller: snapshot.ibanController,
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45,
                                                    width: 1.0)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45,
                                                    width: 1.0)),
                                            prefixIcon: const Icon(
                                              FontAwesomeIcons.hashtag,
                                              size: 16,
                                              color: Colors.black45,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter IBAN';
                                            }
                                            return null;
                                          },
                                          obscureText: false,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Visibility(
                                          visible:
                                              snapshot.showSwiftCode ?? false,
                                          child: Column(
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
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  controller:
                                                      snapshot.swiftController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black45,
                                                                    width:
                                                                        1.0)),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black45,
                                                                    width:
                                                                        1.0)),
                                                    prefixIcon: const Icon(
                                                      FontAwesomeIcons.hashtag,
                                                      size: 16,
                                                      color: Colors.black45,
                                                    ),
                                                  ),
                                                  validator: (value) => value
                                                          .isEmpty
                                                      ? 'Please enter Swift Code'
                                                      : null),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          users.withdrawField[5],
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12),
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: TextFormField(
                                                   inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
    ],
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  controller:
                                                      snapshot.amountController,
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black45,
                                                                    width:
                                                                        1.0)),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black45,
                                                                    width:
                                                                        1.0)),
                                                    prefixIcon: const Icon(
                                                  FontAwesomeIcons.moneyBillWaveAlt,
                                                      size: 16,
                                                      color: Colors.black45,
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
                                                      color: Colors.black54,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                ),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                                                    icon: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      size: 16,
                                                    ),
                                                    items: snapshot
                                                        .currencyDropDown
                                                        .map<
                                                            DropdownMenuItem<
                                                                String>>((String
                                                            value) {
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
//                                                          _try_value_2 = value;
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
                                          height: 10,
                                        ),
                                        Text(
                                          users.withdrawField[6],
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12),
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
                                                  enabled: false,
                                                  controller:
                                                      snapshot.feeController,
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black45,
                                                                    width:
                                                                        1.0)),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black45,
                                                                    width:
                                                                        1.0)),
                                                    prefixIcon: const Icon(
                                                      Icons.save,
                                                      size: 16,
                                                      color: Colors.black45,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Container(
                                                decoration: new BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Colors.black54,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                ),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                                                    icon: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      size: 16,
                                                    ),
                                                    items: snapshot
                                                        .currencyDropDown
                                                        .map<
                                                            DropdownMenuItem<
                                                                String>>((String
                                                            value) {
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
                                          height: 10,
                                        ),
                                        Text(
                                        "NEW AMOUNT", // users.withdrawField[7],
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12),
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
                                                   inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
    ],
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  controller: snapshot
                                                      .netAccountController,
                                                  enabled: false,
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black45,
                                                                    width:
                                                                        1.0)),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black45,
                                                                    width:
                                                                        1.0)),
                                                    prefixIcon: const Icon(
                                                      FontAwesomeIcons.database,
                                                      size: 16,
                                                      color: Colors.black45,
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
                                                      color: Colors.black54,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                ),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                                                    icon: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      size: 16,
                                                    ),
                                                    items: snapshot
                                                        .currencyDropDown
                                                        .map<
                                                            DropdownMenuItem<
                                                                String>>((String
                                                            value) {
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
//                                                          _try_value_4 = value;
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
                                        width: double.infinity,
                                        child: Align(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              Checkbox(
                                                value: snapshot.checkbox,
                                                onChanged: (bool value) {
                                                  snapshot.setCheckBox(value);
                                                },
                                              ),
                                              Container(
                                                child: Text(users.save),
                                              )
                                            ],
                                          ),
                                          alignment: Alignment.centerRight,
                                        )),
                                    Visibility(
                                      visible:
                                          snapshot.withdrawalErrorText != null,
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
                                          snapshot.createWithdrawal(
                                              (phoneNumber, otpModel, mainRepo,
                                                  userType) {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        WithdrawalOTPScreen(
                                                            phoneNumber,
                                                            otpModel,
                                                            userType,
                                                            mainRepo)));
                                          }, (description) async {
         
                                            Flushbar(
                                              title: "Failure",
                                              message: "Something went worng ,try again later",
                                              duration: Duration(seconds: 3),
                                            )..show(context);
                                          });
                                        },
                                        color: Colors.blue,
                                        disabledColor: Colors.blue,
                                        padding: EdgeInsets.all(15.0),
                                        child: Text(
                                          users.button[button_set],
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
                                          .setHeight(20),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        LoadingWidget(
                          isVisible: snapshot.showLoad ?? false,
                        )
                      ],
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
