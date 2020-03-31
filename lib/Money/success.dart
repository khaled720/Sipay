import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/utils/app_utils.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class TransferSuccessScreen extends StatefulWidget {
  final MainApiModel otpModel;
  final UserTypes userType;
  TransferSuccessScreen(this.userType, this.otpModel);
  @override
  _TransferSuccessScreenState createState() => _TransferSuccessScreenState();
}

class _TransferSuccessScreenState extends State<TransferSuccessScreen> {
  var otpModelData;
  String amount;
  String currency;
  String date;
  String data;
  @override
  void initState() {
    super.initState();
    otpModelData = widget.otpModel.data['inputs'];
    currency =
        AppUtils.mapCurrencyIDToText(int.parse(otpModelData['currency_id']));
    amount = '${otpModelData['amount']} $currency';
    final df = DateFormat('dd.MM.yyyy hh:mm');
    date = df.format(DateTime.now());
    data = otpModelData['receiver_phone'];
//    if (widget.userType == UserTypes.Individual) {
//      data = otpModelData['receiver_phone'];
//    } else {
//      data = otpModelData['merchant_id'];
//    }
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Money TRANSFER"),
        flexibleSpace: Image(
          image: AssetImage('assets/appbar_bg.png'),
          height: 120,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(50),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: ScreenUtil.getInstance().setHeight(250),
                    ),
                  ),
                  height: ScreenUtil.getInstance().setHeight(280),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(40),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'SUCCESSFUL',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(60),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Your money transfer was successful.',
                      style: TextStyle(color: Colors.black45, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(100),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Text(
                        'Amount Sent: ',
                        style: TextStyle(color: Colors.black45, fontSize: 17),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          amount ?? '',
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                        ),
                      )),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.black26,
                  height: 1.0,
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(50),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Text('Reciever GSM NO: ',
//                          widget.userType == UserTypes.Individual
//                              ? 'Reciever GSM NO: '
//                              : 'Reciever Merchant ID: ',
                          style:
                              TextStyle(color: Colors.black45, fontSize: 17)),
                    ),
                    Expanded(
                      child: Container(
                          child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          data ?? '',
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                        ),
                      )),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.black26,
                  height: 1.0,
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(50),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Text('Transaction Date: ',
                          style:
                              TextStyle(color: Colors.black45, fontSize: 17)),
                    ),
                    Expanded(
                      child: Container(
                          child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          date ?? '',
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                        ),
                      )),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.black26,
                  height: 1.0,
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(50),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Container(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.blue,
                      disabledColor: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "NEW TRANSFER",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    width: ScreenUtil.getInstance().setWidth(690),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(40),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
