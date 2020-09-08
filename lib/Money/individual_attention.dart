import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Money/success.dart';
import 'package:fluttersipay/dashboard/Live_support.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


////////// NOT TRANSLATED


class IndividualAttentionScreen extends StatefulWidget {
  final MainApiModel otpModel;
  final UserTypes userType;
  final bool isB2B;
  IndividualAttentionScreen(this.userType, this.otpModel, this.isB2B);
  @override
  _IndividualAttentionScreenState createState() =>
      _IndividualAttentionScreenState();
}

class _IndividualAttentionScreenState extends State<IndividualAttentionScreen> {
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
        title: Text("Money  Transfer"),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.error,
                      color: Colors.orange,
                      size: ScreenUtil.getInstance().setHeight(230),
                    ),
                  ),
                  height: ScreenUtil.getInstance().setHeight(250),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(40),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'ATTENTION',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(50),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Money will be held for 72 hours until the \n recipient registers to Sipay. \n If the receiver does not register within 72 hours, your money will be returned to \n your account.',
                      style: TextStyle(
                          color: Colors.black45, fontSize: 18, height: 1.5),
                      textAlign: TextAlign.center,
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
                          widget.isB2B ? 'Receiver ID' : 'Reciever GSM: ',
                          style:
                              TextStyle(color: Colors.black45, fontSize: 17)),
                    ),
                    Expanded(
                      child: Container(
                          child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          widget.otpModel != null
                              ? widget.isB2B
                                  ? widget.otpModel.data['b2b']['receiver_id']
                                  : widget.otpModel.data['inputs']
                                      ['receiver_phone']
                              : '',
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
//                Row(
//                  children: <Widget>[
//                    SizedBox(
//                      width: 30,
//                    ),
//                    Expanded(
//                      child: Text('Expiry Date: ',
//                          style:
//                              TextStyle(color: Colors.black45, fontSize: 17)),
//                    ),
//                    Expanded(
//                      child: Container(
//                          child: Align(
//                        alignment: Alignment.bottomRight,
//                        child: Text(
//                          '',
//                          style: TextStyle(color: Colors.black87, fontSize: 16),
//                        ),
//                      )),
//                    ),
//                    SizedBox(
//                      width: 30,
//                    ),
//                  ],
//                ),
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
                            "CANCEL",
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
                                  builder: (context) => TransferSuccessScreen(
                                      widget.userType,
                                      widget.otpModel,
                                      widget.isB2B),
                                ));
                          },
                          color: Colors.blue,
                          disabledColor: Colors.blue,
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "APPROVE",
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
