import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Money/providers/send_to_corporate_provider.dart';
import 'package:fluttersipay/loading_widget.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../base_main_repo.dart';
import 'money_transfer_otp.dart';

class SendMoneyToCorporateScreen extends StatefulWidget {
  final BaseMainRepository baseMainRepository;
  final List wallets;
  final UserTypes userType;
  SendMoneyToCorporateScreen(
      this.baseMainRepository, this.wallets, this.userType);
  @override
  _SendMoneyToCorporateScreenState createState() =>
      _SendMoneyToCorporateScreenState();
}

class _SendMoneyToCorporateScreenState
    extends State<SendMoneyToCorporateScreen> {
  final _formKey = GlobalKey<FormState>();

  bool check_state = true;
  bool check_states = true;

  int _selectedItemPosition = 0;
  var _bank_value = "MERCHANT";
  List<String> _listBankData = ["MERCHANT"];
  var _try_value = "TRY";
  List<String> _listtryData = ["TRY", "USD", 'EUR'];
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
        create: (context) => SendMoneyToCorporateProvider(
            widget.baseMainRepository,
            widget.wallets,
            TextEditingController(),
            TextEditingController(),
            TextEditingController(),
            widget.userType),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Money Transfer"),
            flexibleSpace: Image(
              image: AssetImage('assets/appbar_bg.png'),
              height: 100,
              fit: BoxFit.fitWidth,
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                  ),
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
                  size: 16,
                ),
                onPressed: () {
                  // do something
                },
              )
            ],
          ),
          body: Consumer<SendMoneyToCorporateProvider>(
              builder: (context, snapshot, _) {
            return SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(50),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Text(
                          'AVAILABLE BALANCE',
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
                                        color: Colors.black54, fontSize: 16),
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
                                        color: Colors.black54, fontSize: 16),
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
                        height: ScreenUtil.getInstance().setHeight(80),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'SEND MONEY',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(50),
                            ),
                            Text(
                              'WALLET TYPE',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12),
                            ),
                            DropdownButton<String>(
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 16,
                              ),
                              items: _listBankData
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.creditCard,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                      SizedBox(width: 20),
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
                                  _bank_value = value;
                                });
                              },
                              value: _bank_value,
                              isExpanded: true,
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(50),
                                  ),
                                  Text(
                                    'MERCHANT ID',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 12),
                                  ),
                                  TextFormField(
                                    style: TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.phone,
                                    controller: snapshot.receiverController,
                                    onFieldSubmitted: (value) {
                                      snapshot.onReceiverPhoneSubmitted(value);
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Enter Merchant ID',
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black45,
                                              width: 1.0)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black45,
                                              width: 1.0)),
                                      prefixIcon: snapshot.phoneLoading
                                          ? CupertinoActivityIndicator()
                                          : const Icon(
                                              FontAwesomeIcons.hashtag,
                                              size: 16,
                                              color: Colors.black45,
                                            ),
                                    ),
                                    obscureText: false,
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(10),
                                  ),
                                  Visibility(
                                    visible: snapshot.receiverData != null,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Icon(
                                            snapshot.receiverData ==
                                                    'Non SiPay User'
                                                ? FontAwesomeIcons.userSlash
                                                : FontAwesomeIcons.userCheck,
                                            size: 15.0,
                                            color: snapshot.receiverData ==
                                                    'Non SiPay User'
                                                ? Colors.red
                                                : Colors.blue),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          snapshot.receiverData ?? '',
                                          style: TextStyle(
                                              color: snapshot.receiverData ==
                                                      'Non SiPay User'
                                                  ? Colors.red
                                                  : Colors.blue),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(40),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: check_states
                                          ? Container(
                                              child: Text(
                                                '',
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                ),
                                              ),
                                              height: 0,
                                            )
                                          : RichText(
                                              textAlign: TextAlign.right,
                                              text: TextSpan(
                                                  // set the default style for the children TextSpans
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      wordSpacing: 3),
                                                  children: [
                                                    WidgetSpan(
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .industry,
                                                        size: 14,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                        text:
                                                            ' AIGERIM KAIROLDAYEVA',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.blue)),
                                                  ])),
                                    ),
                                  ),
                                  Text(
                                    'AMOUNT *',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 12),
                                  ),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                          child: TextFormField(
                                            style: TextStyle(
                                                color: check_state
                                                    ? Colors.black
                                                    : Colors.red),
                                            keyboardType: TextInputType.phone,
                                            controller:
                                                snapshot.amountController,
                                            onChanged: (text) {
                                              if (text.length > 0 &&
                                                  !check_state) {
                                                setState(() {
                                                  check_state = true;
                                                });
                                              }
                                            },
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
                                              prefixIcon: check_state
                                                  ? const Icon(
                                                      Icons.map,
                                                      size: 16,
                                                      color: Colors.black45,
                                                    )
                                                  : const Icon(
                                                      Icons.cancel,
                                                      size: 16,
                                                      color: Colors.red,
                                                    ),
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Please enter AMOUNT';
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
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                size: 16,
                                              ),
                                              items: _listtryData.map<
                                                      DropdownMenuItem<String>>(
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
                                                snapshot.selectedCurrencyDropdownValue =
                                                    value;
                                              },
                                              value: snapshot
                                                  .selectedCurrencyDropDownValue,
                                              isExpanded: true,
                                            ),
                                          ),
                                          width: 100,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 120),
                                    child: check_state
                                        ? Container(
                                            height: 0,
                                          )
                                        : Container(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "Please enter valid amount",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(20),
                                  ),
                                  Text(
                                    'DESCRIPTION',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 12),
                                  ),
                                  TextFormField(
                                    style: TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.phone,
                                    controller: snapshot.descriptionController,
                                    decoration: InputDecoration(
                                      hintText: "Enter Description",
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black45,
                                              width: 1.0)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black45,
                                              width: 1.0)),
                                      prefixIcon: const Icon(
                                        FontAwesomeIcons.rocketchat,
                                        color: Colors.black45,
                                        size: 16,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter description';
                                      }
                                      return null;
                                    },
                                    obscureText: false,
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(50),
                                  ),
                                  Container(
                                    child: FlatButton(
                                      onPressed: () {
                                        snapshot.moneyTransfer((phoneNumber,
                                            otpModel, mainRepo, userType, b2b) {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MoneyTransferOTPScreen(
                                                          phoneNumber,
                                                          otpModel,
                                                          userType,
                                                          mainRepo,
                                                          b2b)));
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
                                        "SEND",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    width:
                                        ScreenUtil.getInstance().setWidth(690),
                                  ),
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(40),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  LoadingWidget(
                    isVisible: snapshot.showLoad ?? false,
                  )
                ],
              ),
            );
          }),
        ));
  }
}
