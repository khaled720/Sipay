import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/dashboard/providers/transaction_history_provider.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../base_main_repo.dart';
import '../loading_widget.dart';
import 'Transaction_detail.dart';
import 'merchant_panel.dart';

class TransactionHistoryScreen extends StatefulWidget {
  final BaseMainRepository baseRepo;
  final List userWallets;
  final UserTypes userType;

  TransactionHistoryScreen(this.baseRepo, this.userWallets, this.userType);

  @override
  _TransactionHistoryScreenState createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  var _tryValue = "CURRENCY";
  List<String> _listTryData = ["CURRENCY", "TRY", "USD", "EUR"];
  var _typeValue = "TYPES";
  List<String> _listTypeData = [
    "TYPES",
    "Purchase",
    "Deposit",
    'Withdrawal',
    'Send',
    'Receive',
    'Exchange'
  ];
  var _statusValue = "STATES";
  List<String> _listStatusData = ["STATES", "Completed", "Rejected", 'Pending'];
  DateTime endDate;
  DateTime startDate;

  Future<dynamic> startDatePicker() async {
    var order = await getDate();
    setState(() {
      startDate = order;
    });
    return order;
  }

  Future<dynamic> endDatePicker() async {
    var order = await getDate();
    setState(() {
      endDate = order;
    });
    return order;
  }

  Future<DateTime> getDate() {
    // Imagine that this function is
    // more complex and slow.
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
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
    return ChangeNotifierProvider(
        create: (context) =>
            TransactionsHistoryProvider(widget.baseRepo, widget.userType),
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('TRANSACTION HISTORY'),
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
                Consumer<TransactionsHistoryProvider>(
                    builder: (context, snapshot, _) {
                  return IconButton(
                    padding: const EdgeInsets.only(right: 20.0),
                    icon: Icon(
                      FontAwesomeIcons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      snapshot.searchUserTransactionList();
                    },
                  );
                })
              ],
            ),
            body: Stack(
              children: <Widget>[
                Consumer<TransactionsHistoryProvider>(
                    builder: (context, snapshot, _) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                        padding:
                                            EdgeInsets.only(right: 5, left: 5),
                                        child: Container(
                                          decoration: new BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.black54,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Icon(
                                                FontAwesomeIcons.calendarAlt,
                                                color: Colors.black45,
                                                size: 16,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  startDate == null
                                                      ? ''
                                                      : startDate.day
                                                              .toString() +
                                                          '-' +
                                                          startDate.month
                                                              .toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              IconButton(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    size: 16,
                                                    color: Colors.black45,
                                                  ),
                                                  onPressed: () async {
                                                    snapshot.startDate =
                                                        await startDatePicker();
                                                  }),
                                            ],
                                          ),
                                        )),
                                  ),
                                  Expanded(
                                    child: Padding(
                                        padding:
                                            EdgeInsets.only(right: 5, left: 5),
                                        child: Container(
                                          decoration: new BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.black54,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Icon(
                                                FontAwesomeIcons.calendarAlt,
                                                color: Colors.black45,
                                                size: 16,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  endDate == null
                                                      ? ''
                                                      : endDate.day.toString() +
                                                          '-' +
                                                          endDate.month
                                                              .toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              IconButton(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    size: 16,
                                                    color: Colors.black45,
                                                  ),
                                                  onPressed: () async {
                                                    snapshot.endDate =
                                                        await endDatePicker();
                                                  }),
                                            ],
                                          ),
                                        )),
                                    flex: 1,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(right: 5, left: 5),
                                      child: Container(
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
                                            items: _listTryData
                                                .map<DropdownMenuItem<String>>(
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
                                                            color:
                                                                Colors.black45),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              snapshot.selectedCurrency = value;
                                            },
                                            value: snapshot.selectedCurrency,
                                            isExpanded: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                ],
                              ),
                              widget.userType == UserTypes.Individual
                                  ? Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right: 5, left: 5),
                                            child: TextFormField(
                                              style: TextStyle(
                                                  color: Colors.black),
                                              onChanged: (key) {
                                                snapshot.searchKey = key;
                                              },
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.black45,
                                                            width: 1.0)),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.black45,
                                                            width: 1.0)),
                                                prefixIcon: const Icon(
                                                  FontAwesomeIcons.search,
                                                  size: 16,
                                                  color: Colors.black45,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right: 5, left: 5),
                                            child: Container(
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
                                                  items: _listStatusData.map<
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
                                                    setState(() {
                                                      _statusValue = value;
                                                      snapshot.selectedTransactionState =
                                                          value;
                                                    });
                                                  },
                                                  value: _statusValue,
                                                  isExpanded: true,
                                                ),
                                              ),
                                            ),
                                          ),
                                          flex: 1,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right: 5, left: 5),
                                            child: Container(
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
                                                  items: _listTypeData.map<
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
                                                    setState(() {
                                                      _typeValue = value;
                                                    });
                                                    snapshot.selectedTransactionType =
                                                        value;
                                                  },
                                                  value: _typeValue,
                                                  isExpanded: true,
                                                ),
                                              ),
                                            ),
                                          ),
                                          flex: 1,
                                        ),
                                      ],
                                    )
                                  : SizedBox(
                                      width: 0.0,
                                    ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                child: Text(
                                  'ALL TRANSACTIONS',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      decoration: new BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.black26,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: new BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.blue,
                                            width: 2.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: new BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.black26,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: new ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.userTransactionsList().length,
                              primary: true,
                              itemBuilder: (BuildContext content, int index) {
                                return transactionsList(
                                        title: snapshot
                                                .getDataFromTransactionsList(
                                                    TransactionData.Title,
                                                    index) ??
                                            '',
                                        value: snapshot
                                                .getDataFromTransactionsList(
                                                    TransactionData.Value,
                                                    index) ??
                                            '',
                                        id: snapshot.getDataFromTransactionsList(
                                                TransactionData.ID, index) ??
                                            '',
                                        dates: snapshot
                                                .getDataFromTransactionsList(
                                                    TransactionData.Date,
                                                    index) ??
                                            '',
                                        type:
                                            snapshot.getDataFromTransactionsList(
                                                TransactionData.Type, index)) ??
                                    '';
                              }),
                        ),
                        SizedBox(
                          height: 60,
                        )
                      ],
                    ),
                  );
                }),
                Dashboardbottom(context, widget.baseRepo, widget.userWallets,
                    widget.userType),
                Consumer<TransactionsHistoryProvider>(
                    builder: (context, snapshot, _) {
                  return LoadingWidget(isVisible: snapshot.showLoad ?? false);
                })
              ],
            )));
  }

  Widget transactionsList(
      {String title, String value, String id, String dates, String type}) {
    var _color;
    if (type == "0")
      _color = Colors.red;
    else if (type == "1")
      _color = Colors.green;
    else if (type == "2") _color = Colors.blue;
    return new GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TransactionDetailsScreen(
                  widget.baseRepo, id, title, widget.userType),
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Padding(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Text(
                      value,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _color,
                      ),
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(id),
                    ),
                    Text(
                      dates,
                      textAlign: TextAlign.right,
                    )
                  ],
                )
              ],
            ),
            padding: EdgeInsets.only(right: 30, left: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.black45,
            height: 1.0,
          )
        ],
      ),
    );
  }
}
