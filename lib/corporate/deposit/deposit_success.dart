import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/dashboard/merchant.dart';
import 'package:fluttersipay/corporate/dashboard/support.dart';
import 'package:fluttersipay/corporate/datas.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttersipay/corporate/deposit/json_models/c_deposit_success.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'create_deposit.dart';


class C_Deposit_success extends StatefulWidget {
  final C_DepositSuccessModel successModel;
  C_Deposit_success(this.successModel);
  @override
  _Deposit_success_panel createState() => _Deposit_success_panel();
}

class _Deposit_success_panel extends State<C_Deposit_success> {
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
        title: Text(translator.translate("deposit").toUpperCase()),
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
                      widget.successModel.status,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(70),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    widget.successModel.message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black45, fontSize: 16, height: 1.5),
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
                        translator.translate("iban")+': ',
                        style: TextStyle(color: Colors.black45, fontSize: 17),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          widget.successModel.iban,
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
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Text(translator.translate("deposit")+" "+translator.translate("amount").toLowerCase(),
                          style:
                              TextStyle(color: Colors.black45, fontSize: 17)),
                    ),
                    Expanded(
                      child: Container(
                          child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          widget.successModel.amount + '₺',
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
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                Divider(
                  color: Colors.black26,
                  height: 1.0,
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(80),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 40.0, right: 30.0),
                      child: Container(
                        child: OutlineButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          borderSide: BorderSide(
                            color: Colors.black26, //Color of the border
                            style: BorderStyle.solid, //Style of the border
                            width: 0.8, //width of the border
                          ),
                          color: Colors.white,
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            translator.translate("newdep"),
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        width: ScreenUtil.getInstance().setWidth(250),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Container(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CorporateMerchantPanelScreen(datas.loginModel, datas.tokens),
                                ));
                          },
                          color: Colors.blue,
                          disabledColor: Colors.blue,
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                          translator.translate("dash"),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        width: ScreenUtil.getInstance().setWidth(250),
                      ),
                    ),
                  ],
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
