import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

import '../main_api_data_model.dart';

abstract class BaseOTPVerificationProvider with ChangeNotifier {
  TextEditingController _smsController;
  String _secondsLeftToResendOTP = '20';
  double _timerPercent = 1.0;
  CountdownTimer _countdownTimer;
  bool _showLoad = false;
  String _otpErrorText;
  int resetCounter;
  String _phoneNumber;

  TextEditingController get smsController => _smsController;

  get secondsLeftOtp => _secondsLeftToResendOTP;

  get otpErrorText => _otpErrorText;

  get showLoad => _showLoad;

  get phoneNumber => _phoneNumber;

  get timerPercent => _timerPercent;

  BaseOTPVerificationProvider(
      this._phoneNumber, this._smsController, this._countdownTimer) {
    resetCounter = 0;
    _initCountDownTimer();
  }

  _initCountDownTimer() {
    if (_countdownTimer == null) {
      _countdownTimer =
          CountdownTimer(Duration(seconds: 22), Duration(seconds: 1));
    }
    _countdownTimer.listen((data) {
      _secondsLeftToResendOTP = data.remaining.inSeconds.toString();
      _timerPercent = data.remaining.inSeconds / 20.round();
      notifyListeners();
    });
  }

  void setShowLoading(bool load) {
    _showLoad = load;
    notifyListeners();
  }

  void setOTPErrorText(bool isError, String errorMsg) {
    isError ? _otpErrorText = errorMsg : _otpErrorText = null;
    notifyListeners();
  }

  //OTP SMS methods

  Future<MainApiModel> verifyOTPImpl();

  Future<MainApiModel> resendOTPImpl();

  verifyOTP(Function onSuccess, Function onFailure) async {
    if (_smsController.text.isNotEmpty) {
      if (int.parse(_secondsLeftToResendOTP) <= 0)
        setOTPErrorText(true, 'Please click on resend the code again.');
      else {
        setOTPErrorText(false, '');
        if (_countdownTimer.isRunning) _countdownTimer.cancel();
        setShowLoading(true);
        MainApiModel verifyOTPModel = await verifyOTPImpl();
        setShowLoading(false);
        if (verifyOTPModel != null) {
          verifyOTPModel.statusCode != 100
              ? setOTPErrorText(true, verifyOTPModel.description)
              : onSuccess(verifyOTPModel);
        } else {
          setOTPErrorText(true, 'Some error happened. Please try again.');
        }
      }
    }
  }

  resendOTP(Function onSuccess, Function onFailure) async {
    if (resetCounter < 2) {
      setOTPErrorText(false, '');
      _cancelCountDownTimer();
      setShowLoading(true);
      MainApiModel resendOTPImplModel = await resendOTPImpl();
      if (resendOTPImplModel != null) {
        resetCounter++;
        setShowLoading(false);
        resendOTPImplModel.statusCode != 100
            ? onFailure(resendOTPImplModel.description)
            : _initCountDownTimer();
      } else
        onFailure('Some error happened. Please try again.');
    }
  }

  _cancelCountDownTimer() {
    if (_countdownTimer != null) {
      _countdownTimer.cancel();
      _countdownTimer = null;
    }
  }

  @override
  void dispose() {
    _cancelCountDownTimer();
    super.dispose();
  }
}
