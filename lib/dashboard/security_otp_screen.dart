import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/dashboard/providers/security_otp_provider.dart';
import 'package:fluttersipay/otp/otp_base_screen.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:quiver/async.dart';

class SecurityOTPScreen extends StatefulWidget {
  final SecuritySettingsTypes securityMethod;
  final phoneNumber;
  final otpModel;
  final BaseMainRepository mainRepository;

  SecurityOTPScreen(this.securityMethod, this.phoneNumber, this.otpModel,
      this.mainRepository);

  @override
  _SecurityOTPScreenState createState() => _SecurityOTPScreenState();
}

class _SecurityOTPScreenState extends State<SecurityOTPScreen> {
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
        title: Text(translator.translate("otp")),
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
          create: (context) => SecurityOTPProvider(
              widget.phoneNumber,
              widget.securityMethod,
              widget.mainRepository,
              widget.otpModel,
              TextEditingController(),
              CountdownTimer(Duration(seconds: 22), Duration(seconds: 1))),
          child: SingleChildScrollView(
            child:
                Consumer<SecurityOTPProvider>(builder: (context, snapshot, _) {
              return OTPBaseScreen(
                resendOTP: snapshot.resendOTP,
                verifyOTP: snapshot.verifyOTP,
                onFailure: (description) {
                  Flushbar(
                    title: translator.translate("fail"),
                    message: description,
                    duration: Duration(seconds: 3),
                  )..show(context);
                },
                onSuccess: (model) {
                  Navigator.of(context).pop();
                  Flushbar(
                    title: translator.translate("success"),
                    message:
                        widget.securityMethod == SecuritySettingsTypes.Password
                            ? translator.translate("passupdated")
                            : translator.translate("emailupdated"),
                    duration: Duration(seconds: 3),
                  )..show(context);
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
