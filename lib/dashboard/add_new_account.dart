import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/avaliable_banks_model.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/dashboard/providers/add_bank_account_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../loading_widget.dart';

class AddNewBankAccountScreen extends StatefulWidget {
  final BaseMainRepository baseRepo;

  AddNewBankAccountScreen(this.baseRepo);

  @override
  _AddNewBankAccountScreenState createState() =>
      _AddNewBankAccountScreenState();
}

class _AddNewBankAccountScreenState extends State<AddNewBankAccountScreen> {
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
          .loadString('assets/json/dashboard/add_new_account.json');
      return {
        'merchant': jsonA,
      };
    }

    return ChangeNotifierProvider(
        create: (context) => AddBankAccountProvider(
            widget.baseRepo,
            TextEditingController(),
            TextEditingController(),
            TextEditingController(),
            null),
        child: FutureBuilder(
            future: loadJson(),
            builder: (context, snapshot) {
              addaccount_json users;
              var parsedJson;
              var footerJson;
              if (snapshot.hasData) {
                parsedJson = json.decode(snapshot.data['merchant'].toString());
                users = addaccount_json.fromJson(parsedJson);
                return new Scaffold(
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
                  body: Consumer<AddBankAccountProvider>(
                      builder: (context, snapshot, _) {
                    return Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        SingleChildScrollView(
                            child: Padding(
                          padding: EdgeInsets.only(right: 30.0, left: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(30),
                              ),
                              Text(
                                users.add,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                users.account,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12),
                              ),
                              TextField(
                                style: TextStyle(color: Colors.black),
                                controller: snapshot.accountNameTextController,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 0.5)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black45, width: 1.0)),
                                  prefixIcon: const Icon(
                                      FontAwesomeIcons.signature,
                                      size: 16,
                                      color: Colors.black26),
                                ),
                                obscureText: false,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                users.bank,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12),
                              ),
                              snapshot.bankList != null
                                  ? DropdownButton<AvailableBankModel>(
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      items: snapshot.banksDropDown,
                                      onChanged: (bank) {
                                        snapshot.selectedBankDropDownValue =
                                            bank;
                                      },
                                      value: snapshot.selectedBankDropDownValue,
                                      isExpanded: true,
                                    )
                                  : SizedBox(
                                      width: 0.0,
                                    ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                users.currency,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12),
                              ),
                              Container(
                                child: DropdownButton<String>(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black26,
                                  ),
                                  items: snapshot.currenciesList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Icon(
                                            Icons.map,
                                            size: 18,
                                            color: Colors.black38,
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
                                    snapshot.selectedCurrencyDropDownValue =
                                        value;
                                  },
                                  value: snapshot.selectedCurrencyDropDownValue,
                                  isExpanded: true,
                                ),
                                width: ScreenUtil.getInstance().setWidth(300),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                users.accountHolder,
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 12),
                              ),
                              TextField(
                                style: TextStyle(color: Colors.black),
                                controller:
                                    snapshot.accountHolderNameController,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 0.5)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 0.5)),
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    size: 16,
                                    color: Colors.black45,
                                  ),
                                ),
                                obscureText: false,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                users.iban,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12),
                              ),
                              TextField(
                                style: TextStyle(color: Colors.black),
                                controller: snapshot.ibanController,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 0.5)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 0.5)),
                                  prefixIcon: const Icon(
                                    FontAwesomeIcons.hashtag,
                                    size: 16,
                                    color: Colors.black45,
                                  ),
                                ),
                                obscureText: false,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                users.status,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12),
                              ),
                              Container(
                                child: DropdownButton<String>(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black26,
                                  ),
                                  items: snapshot.activeList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Icon(
                                            Icons.map,
                                            color: Colors.black38,
                                            size: 18,
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
                                    snapshot.selectedActiveDropDownValue =
                                        value;
                                  },
                                  value: snapshot.selectedActiveDropDownValue,
                                  isExpanded: true,
                                ),
                                width: ScreenUtil.getInstance().setWidth(300),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Visibility(
                                visible: snapshot.addBankErrorText != null,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      snapshot.addBankErrorText ?? '',
                                      style: TextStyle(
                                          color: Colors.red[800], fontSize: 14),
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
                                    snapshot.addNewBankAccount(() {
                                      Navigator.of(context).pop();
                                      Flushbar(
                                        title: "Success",
                                        message:
                                            'A new bank account was added successfully.',
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
                                    users.button,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                width: ScreenUtil.getInstance().setWidth(690),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        )),
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

class addaccount_json {
  String header;
  String add;
  String account;
  String bank;
  List<String> bankList;
  String currency;
  List<String> currencyList;
  String accountHolder;
  String iban;
  String status;
  List<String> statusList;
  String button;

  addaccount_json(
      {this.header,
      this.add,
      this.account,
      this.bank,
      this.bankList,
      this.currency,
      this.currencyList,
      this.accountHolder,
      this.iban,
      this.status,
      this.statusList,
      this.button});

  addaccount_json.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    add = json['add'];
    account = json['account'];
    bank = json['bank'];
    bankList = json['bank_list'].cast<String>();
    currency = json['currency'];
    currencyList = json['currency_list'].cast<String>();
    accountHolder = json['account_holder'];
    iban = json['iban'];
    status = json['status'];
    statusList = json['status_list'].cast<String>();
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['add'] = this.add;
    data['account'] = this.account;
    data['bank'] = this.bank;
    data['bank_list'] = this.bankList;
    data['currency'] = this.currency;
    data['currency_list'] = this.currencyList;
    data['account_holder'] = this.accountHolder;
    data['iban'] = this.iban;
    data['status'] = this.status;
    data['status_list'] = this.statusList;
    data['button'] = this.button;
    return data;
  }
}
