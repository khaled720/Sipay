import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/dashboard/repos/individual_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/otp/base_otp_provider.dart';
import 'package:fluttersipay/utils/constants.dart';

class WithdrawalOTPProvider extends BaseOTPVerificationProvider {
  BaseMainRepository _baseMainRepository;
  UserTypes _sendUserType;
  MainApiModel _otpModel;

  WithdrawalOTPProvider(phoneNumber, this._sendUserType,
      this._baseMainRepository, this._otpModel, smsController, countDownTimer)
      : super(phoneNumber, smsController, countDownTimer);

  @override
  Future<MainApiModel> resendOTPImpl() async {
    var data = _otpModel.data;
    IndividualMainRepository userRepo = _baseMainRepository;
    MainApiModel resendOTPUserModel = await userRepo.resendWithdrawOTP(
      data['swift_code'],
      data['bank_static_id'],
      data['account_holder_name'],
      data['iban_no'],
      data['amount'],
      data['currency_id'],
      data['bank_name'],
      data['logo'],
      data['bankSaveCheck'],
      data['savedBankAccount'],
      data['user_type'],
    );
    return resendOTPUserModel;
  }

  @override
  Future<MainApiModel> verifyOTPImpl() async {
    var data = _otpModel.data;
    IndividualMainRepository userRepo = _baseMainRepository;
    return await userRepo.withdrawOTP(
        data['swift_code'],
        data['bank_static_id'],
        data['account_holder_name'],
        data['iban_no'],
        data['amount'],
        data['currency_id'],
        data['bank_name'],
        data['logo'],
        data['bankSaveCheck'],
        data['savedBankAccount'],
        data['user_type'],
        smsController.text.trim());
  }
}
