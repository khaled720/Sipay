import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttersipay/login_screens/login_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:quiver/async.dart';


class SMSVerificationProvider with ChangeNotifier {
  MainApiModel _loginModel;
  LoginRepository _loginRepo;
  TextEditingController _smsController;
  String _secondsLeftToResendOTP = '20';
  double _timerPercent = 1.0;
  CountdownTimer _countdownTimer;
  NavigationToSMSTypes _navType;
  bool _showLoad = false;
  String _otpErrorText;
  int resetCounter;

  TextEditingController get smsController => _smsController;

  get phoneNumber {
    String phoneNumber;
    _navType == NavigationToSMSTypes.Login
        ? phoneNumber = _loginModel.data['user']['phone']
        : phoneNumber = _loginModel.data['inputs']['phone'];
    return phoneNumber;
  }

  get secondsLeftOtp => _secondsLeftToResendOTP;

  get otpErrorText => _otpErrorText;

  get showLoad => _showLoad;

  get timerPercent => _timerPercent;

  SMSVerificationProvider(this._navType, this._loginModel, this._loginRepo,
      this._smsController, this._countdownTimer) {
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

  void _setShowLoading(bool load) {
    _showLoad = load;
    notifyListeners();
  }

  void _setOTPErrorText(bool isError, String errorMsg) {
    isError ? _otpErrorText = errorMsg : _otpErrorText = null;
    notifyListeners();
  }

  //Login SMS methods

  verifyLoginSMS(
      UserTypes userType, Function onSuccess, Function onFailure) async {
    if (_smsController.text.isNotEmpty) {
      int userID = _loginModel.data['user']['id'];
      if (int.parse(_secondsLeftToResendOTP) <= 0)
        _setOTPErrorText(true, 'Please click on resend the code again.');
      else {
        _setOTPErrorText(false, '');
        if (_countdownTimer.isRunning) _countdownTimer.cancel();
        switch (userType) {
          case UserTypes.Individual:
            _setShowLoading(true);
            MainApiModel verifyIndividualSMS =
                await _loginRepo.verifyIndividualSMSOTP(
                    _smsController.text.trim(), userID.toString());
            _setShowLoading(false);
            verifyIndividualSMS.statusCode != 100
                ? _setOTPErrorText(true, verifyIndividualSMS.description)
                : onSuccess(_loginModel, verifyIndividualSMS.data['token']);
            break;
          case UserTypes.Corporate:
            _setShowLoading(true);
            MainApiModel verifyCorporateSMS =
                await _loginRepo.verifyCorporateSMSOTP(
                    _smsController.text.trim(), userID.toString());
            _setShowLoading(false);
            verifyCorporateSMS.statusCode != 100
                ? _setOTPErrorText(true, verifyCorporateSMS.description)
                : onSuccess(_loginModel, verifyCorporateSMS.data['token']);
            break;
        }
      }
    }
  }

  resendLoginVerificationSMS(
      UserTypes userType, Function onSuccess, Function onFailure) async {
    if (resetCounter < 2) {
      int userID = _loginModel.data['user']['id'];
      _setOTPErrorText(false, '');
      _cancelCountDownTimer();
      switch (userType) {
        case UserTypes.Individual:
          _setShowLoading(true);
          MainApiModel resendIndividualSMS =
              await _loginRepo.resendIndividualSMSOTP(userID.toString());
          resetCounter++;
          _setShowLoading(false);
          resendIndividualSMS.statusCode != 100
              ? onFailure()
              : _initCountDownTimer();
          break;
        case UserTypes.Corporate:
          _setShowLoading(true);
          MainApiModel resendCorporateSMS =
              await _loginRepo.resendCorporateSMSOTP(userID.toString());
          resetCounter++;
          _setShowLoading(false);
          resendCorporateSMS.statusCode != 100
              ? onFailure()
              : _initCountDownTimer();
          break;
      }
    }
  }

  // Register SMS methods

  verifyUserRegisterSMS(
      String phoneNumber, Function onSuccess, Function onFailure) async {
    if (_smsController.text.isNotEmpty) {
      if (int.parse(_secondsLeftToResendOTP) <= 0)
        _setOTPErrorText(true, 'Please click on resend the code again.');
      else {
        _setOTPErrorText(false, '');
        if (_countdownTimer.isRunning) _countdownTimer.cancel();
        _setShowLoading(true);
        MainApiModel smsVerifyRegister =
            await _loginRepo.smsVerifyRegisterIndividual(
                phoneNumber.trim(), _smsController.text.trim());
        _setShowLoading(false);
        smsVerifyRegister.statusCode != 100
            ? _setOTPErrorText(true, smsVerifyRegister.description)
            : onSuccess(smsVerifyRegister);
      }
    }
  }

  resendRegisterUserVerifySMS(
      String phoneNumber, Function onSuccess, Function onFailure) async {
    if (resetCounter < 2) {
      _setOTPErrorText(false, '');
      _cancelCountDownTimer();
      _setShowLoading(true);
      MainApiModel resendIndividualSMS =
          await _loginRepo.resendSMSVerifyRegisterIndividual(phoneNumber);
      resetCounter++;
      _setShowLoading(false);
      resendIndividualSMS.statusCode != 100
          ? onFailure()
          : _initCountDownTimer();
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
