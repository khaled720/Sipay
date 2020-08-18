import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Witdrawal/providers/withdrawal_otp_provider.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/corporate/withdrawal/withdrawal_success.dart';
import 'package:fluttersipay/otp/otp_base_screen.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:quiver/async.dart';
import 'package:translator/translator.dart' as translator;
class WithdrawalOTPScreen extends StatefulWidget {
  final phoneNumber;
  final otpModel;
  final BaseMainRepository mainRepository;
  final UserTypes userType;

  WithdrawalOTPScreen(
      this.phoneNumber, this.otpModel, this.userType, this.mainRepository);

  @override
  _WithdrawalOTPScreenState createState() => _WithdrawalOTPScreenState();
}

class _WithdrawalOTPScreenState extends State<WithdrawalOTPScreen> {
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
          create: (context) => WithdrawalOTPProvider(
              widget.phoneNumber,
              widget.userType,
              widget.mainRepository,
              widget.otpModel,
              TextEditingController(),
              CountdownTimer(Duration(seconds: 180), Duration(seconds: 1))),
          child: SingleChildScrollView(
            child: Consumer<WithdrawalOTPProvider>(
                builder: (context, snapshot, _) {
              return OTPBaseScreen(
                resendOTP: snapshot.resendOTP,
                verifyOTP: snapshot.verifyOTP,
                onFailure: (description) async{

                var txt=await   translator.GoogleTranslator().translate(
       description.toString(), to: 'en');
                  Flushbar(
                    title: "Failure",
                    message: txt,
                    duration: Duration(seconds: 3),
                  )..show(context);
                },
                onSuccess: (model) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => WithdrawSuccessScreen()));
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
