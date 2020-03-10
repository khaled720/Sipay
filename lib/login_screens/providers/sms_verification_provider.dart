import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttersipay/login_screens/login_models.dart';
import 'package:fluttersipay/login_screens/login_repo.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:quiver/async.dart';

class SMSVerificationProvider with ChangeNotifier {
  LoginModel _loginModel;
  LoginRepository _loginRepo;
  TextEditingController _smsController;
  String _secondsLeftToResendOTP = '20';
  double _timerPercent = 1.0;
  CountdownTimer _countdownTimer;
  NavigationToSMSTypes _navType;

  TextEditingController get smsController => _smsController;

  get phoneNumber {
    String phoneNumber;
    _navType == NavigationToSMSTypes.Login
        ? phoneNumber = _loginModel.data['user']['phone']
        : phoneNumber = _loginModel.data['inputs']['phone'];
    return phoneNumber;
  }

  get secondsLeftOtp => _secondsLeftToResendOTP;
  get timerPercent => _timerPercent;

  SMSVerificationProvider(this._navType, this._loginModel, this._loginRepo,
      this._smsController, this._countdownTimer) {
    _initCountDownTimer();
  }

  _initCountDownTimer() {
    _countdownTimer.listen((data) {
      if (data.isRunning) {
        _secondsLeftToResendOTP = data.remaining.inSeconds.toString();
        _timerPercent = data.remaining.inSeconds / 20.round();
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _countdownTimer.cancel();
    super.dispose();
  }
}
