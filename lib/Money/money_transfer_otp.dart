import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Money/individual_attention.dart';
import 'package:fluttersipay/Money/providers/money_transfer_otp_provider.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/otp/otp_base_screen.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:quiver/async.dart';

class MoneyTransferOTPScreen extends StatefulWidget {
  final phoneNumber;
  final otpModel;
  final BaseMainRepository mainRepository;
  final UserTypes userType;

  MoneyTransferOTPScreen(
      this.phoneNumber, this.otpModel, this.userType, this.mainRepository);

  @override
  _MoneyTransferOTPScreenState createState() => _MoneyTransferOTPScreenState();
}

class _MoneyTransferOTPScreenState extends State<MoneyTransferOTPScreen> {
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
        title: Text('OTP VERIFICATION'),
        flexibleSpace: Image(
          image: AssetImage('assets/appbar_bg.png'),
          height: 100,
          fit: BoxFit.fitWidth,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(right: 20.0),
            icon: Icon(
              Icons.chat_bubble_outline,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: ChangeNotifierProvider(
          create: (context) => MoneyTransferOTPProvider(
              widget.phoneNumber,
              widget.userType,
              widget.mainRepository,
              widget.otpModel,
              TextEditingController(),
              CountdownTimer(Duration(seconds: 22), Duration(seconds: 1))),
          child: SingleChildScrollView(
            child: Consumer<MoneyTransferOTPProvider>(
                builder: (context, snapshot, _) {
              return OTPBaseScreen(
                resendOTP: snapshot.resendOTP,
                verifyOTP: snapshot.verifyOTP,
                onFailure: (description) {
                  Flushbar(
                    title: "Failure",
                    message: description,
                    duration: Duration(seconds: 3),
                  )..show(context);
                },
                onSuccess: (model) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          IndividualAttentionScreen(widget.userType, model)));
                },
                errorText: snapshot.otpErrorText,
                showLoad: snapshot.showLoad,
                smsController: snapshot.smsController,
                secondsLeft: snapshot.secondsLeftOtp,
                timerPercent: snapshot.timerPercent,
                phoneNumber: widget.phoneNumber,
              );
            }),
          )),
    );
  }
}
