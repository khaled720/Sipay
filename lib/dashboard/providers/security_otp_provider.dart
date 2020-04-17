import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/otp/base_otp_provider.dart';
import 'package:fluttersipay/utils/constants.dart';

class SecurityOTPProvider extends BaseOTPVerificationProvider {
  BaseMainRepository _baseMainRepository;
  SecuritySettingsTypes _securityMethodType;
  MainApiModel _otpModel;

  SecurityOTPProvider(phoneNumber, this._securityMethodType,
      this._baseMainRepository, this._otpModel, smsController, countDownTimer)
      : super(phoneNumber, smsController, countDownTimer);

  @override
  Future<MainApiModel> resendOTPImpl() async {
    var data = _otpModel.data['inputs'];
    switch (_securityMethodType) {
      case SecuritySettingsTypes.Password:
        return await _baseMainRepository.changePasswordResendOTP(
          data['current_password'],
          data['password'],
          data['confirm_password'],
          data['user_id'],
        );
        break;
      case SecuritySettingsTypes.Email:
        return await _baseMainRepository.changeEmailResendOTP(
            data['current_password'], data['email'], data['user_id']);
        break;
    }
    return null;
  }

  @override
  Future<MainApiModel> verifyOTPImpl() async {
    var data = _otpModel.data['inputs'];
    switch (_securityMethodType) {
      case SecuritySettingsTypes.Password:
        return await _baseMainRepository.changePasswordVerifyOTP(
          data['current_password'],
          data['password'],
          data['confirm_password'],
          smsController.text.trim(),
          data['user_id'],
        );
        break;
      case SecuritySettingsTypes.Email:
        return await _baseMainRepository.changeEmailVerifyOTP(
          data['current_password'],
          data['email'],
          smsController.text.trim(),
          data['user_id'],
        );
        break;
    }
    return null;
  }
}
