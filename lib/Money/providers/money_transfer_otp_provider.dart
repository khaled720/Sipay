import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/dashboard/repos/individual_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/otp/base_otp_provider.dart';
import 'package:fluttersipay/utils/constants.dart';

class MoneyTransferOTPProvider extends BaseOTPVerificationProvider {
  BaseMainRepository _baseMainRepository;
  UserTypes _sendUserType;
  MainApiModel _otpModel;

  MoneyTransferOTPProvider(phoneNumber, this._sendUserType,
      this._baseMainRepository, this._otpModel, smsController, countDownTimer)
      : super(phoneNumber, smsController, countDownTimer);

  @override
  Future<MainApiModel> resendOTPImpl() async {
    var data = _otpModel.data['inputs'];
    switch (_sendUserType) {
      //Sending money to an individual
      case UserTypes.Individual:
        IndividualMainRepository userRepo = _baseMainRepository;
        MainApiModel resendOTPUserModel =
            await userRepo.resendOTPMoneySendToUser(
          data['sender_name'],
          data['sender_phone'],
          data['sender_id'],
          data['sender_user_category'],
          data['receiver_phone'],
          data['amount'],
          int.parse(data['currency_id']),
          data['description'],
          data['send_type'],
          data['user_type'],
          data['receiver_email'],
        );
        return resendOTPUserModel;
        break;
      case UserTypes.Corporate:
        IndividualMainRepository userRepo = _baseMainRepository;
        MainApiModel resendOTPMerchantModel =
            await userRepo.resendOTPMoneySendToMerchant(
          data['sender_name'],
          data['sender_phone'],
          data['sender_id'],
          data['sender_user_category'],
          data['receiver_phone'],
          data['amount'],
          int.parse(data['currency_id']),
          data['description'],
          data['send_type'],
          data['user_type'],
          data['receiver_user_type'],
          data['receiver_email'],
        );
        return resendOTPMerchantModel;
        break;
    }
    return null;
  }

  @override
  Future<MainApiModel> verifyOTPImpl() async {
    var data = _otpModel.data['inputs'];
    switch (_sendUserType) {
      //Sending money to an individual
      case UserTypes.Individual:
        IndividualMainRepository userRepo = _baseMainRepository;
        return await userRepo.createMoneySendToUserVerifyOTP(
            data['sender_name'],
            data['sender_phone'],
            data['sender_id'],
            data['sender_user_category'],
            data['receiver_phone'],
            data['amount'],
            data['currency_id'],
            data['description'],
            data['send_type'],
            data['user_type'],
            data['receiver_email'],
            smsController.text.trim());
        break;
      case UserTypes.Corporate:
        IndividualMainRepository userRepo = _baseMainRepository;
        return await userRepo.createMoneySendToMerchantVerifyOTP(
            data['sender_name'],
            data['sender_phone'],
            data['sender_id'],
            data['sender_user_category'],
            data['receiver_phone'],
            data['amount'],
            data['currency_id'],
            data['description'],
            data['send_type'],
            data['user_type'],
            data['receiver_email'],
            data['receiver_user_type'],
            smsController.text.trim());
        break;
    }
    return null;
  }
}
