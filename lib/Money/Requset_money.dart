import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Money/providers/request_money_provider.dart';
import 'package:fluttersipay/loading_widget.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../base_main_repo.dart';
import '../bottom_navigator.dart';

class RequestMoneyScreen extends StatefulWidget {
  final BaseMainRepository baseRepo;
  final List wallets;

  RequestMoneyScreen(this.baseRepo, this.wallets);

  @override
  _RequestMoneyScreenState createState() => _RequestMoneyScreenState();
}

class _RequestMoneyScreenState extends State<RequestMoneyScreen> {
  List<String> _list_footer = [
    "Deposit",
    "Money Transfer",
    "Withdraw",
    "Exchange"
  ];
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
        create: (context) => MoneyRequestProvider(
            widget.baseRepo,
            widget.wallets,
            TextEditingController(),
            TextEditingController(),
            TextEditingController()),
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Request MONEY"),
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
            body:
                Consumer<MoneyRequestProvider>(builder: (context, snapshot, _) {
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
                                      snapshot.getAvailableWalletAmount(0) +
                                          '₺',
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
                                      snapshot.getAvailableWalletAmount(1) +
                                          "\$",
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
                                'REQUEST MONEY',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(50),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height:
                                        ScreenUtil.getInstance().setHeight(50),
                                  ),
                                  Text(
                                    'SENDER PHONE NUMBER',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 12),
                                  ),
                                  TextFormField(
                                    style: TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [maskFormatter],
                                    controller: snapshot.phoneController,
                                    onFieldSubmitted: (value) {
                                      snapshot.onReceiverPhoneSubmitted(value);
                                    },
                                    decoration: InputDecoration(
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
                                          : Icon(
                                              Icons.phone,
                                              size: 16,
                                              color: Colors.black45,
                                            ),
                                    ),
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
                                                ? FontAwesomeIcons.userTimes
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
                                        child: Container(
                                          child: Text(
                                            '',
                                            style: TextStyle(
                                              color: Colors.black38,
                                            ),
                                          ),
                                          height: 0,
                                        )
//                                          : RichText(
//                                              textAlign: TextAlign.right,
//                                              text: TextSpan(
//                                                  // set the default style for the children TextSpans
//                                                  style: TextStyle(
//                                                      fontSize: 13,
//                                                      wordSpacing: 3),
//                                                  children: [
//                                                    WidgetSpan(
//                                                      child: Icon(
//                                                        FontAwesomeIcons
//                                                            .userCheck,
//                                                        size: 14,
//                                                        color: Colors.blue,
//                                                      ),
//                                                    ),
//                                                    TextSpan(
//                                                        text:
//                                                            ' AIGERIM KAIROLDAYEVA',
//                                                        style: TextStyle(
//                                                            color:
//                                                                Colors.blue)),
//                                                  ])),
                                        ),
                                  ),
                                  Text(
                                    'AMOUNT',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: TextFormField( inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
    ],
                                            keyboardType: TextInputType.number,
                                            controller:
                                                snapshot.amountController,
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .black45,
                                                            width: 1.0)),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.black45,
                                                            width: 1.0)),
                                                prefixIcon: const Icon(
                                                  Icons.map,
                                                  size: 16,
                                                  color: Colors.black45,
                                                )
//                                                  : const Icon(
//                                                      Icons.cancel,
//                                                      size: 16,
//                                                      color: Colors.red,
//                                                    ),
                                                ),
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
                                              items: snapshot.currencyList.map<
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
                                                snapshot.currencyDropDown =
                                                    value;
                                              },
                                              value: snapshot.selectedCurrency,
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
//                                  Padding(
//                                    padding: EdgeInsets.only(right: 120),
//                                    child: Container(
//                                      alignment: Alignment.centerRight,
//                                      child: Text(
//                                        "Please enter valid amount",
//                                        textAlign: TextAlign.right,
//                                        style: TextStyle(
//                                          color: Colors.red,
//                                        ),
//                                      ),
//                                    ),
//                                  ),
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
                                    keyboardType: TextInputType.text,
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
                                        return 'Please enter DESCRIPTION';
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
                                        snapshot.createMoneyRequest(() {
                                          Navigator.of(context).pop();
                                          Flushbar(
                                            title: "Successful",
                                            message:
                                                'Money was requested successfully.',
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
                                        "SUBMIT REQUEST",
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
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        )
                      ],
                    ),
                  ),
                  getCustomNavigator(context, _list_footer, 1, widget.baseRepo,
                      widget.wallets, UserTypes.Individual),
                  LoadingWidget(
                    isVisible: snapshot.showLoad ?? false,
                  )
                ],
              );
            })));
  }
}
