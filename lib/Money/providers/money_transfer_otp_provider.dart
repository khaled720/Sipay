import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/corporate/dashboard/merchant_repo.dart';
import 'package:fluttersipay/dashboard/repos/individual_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/otp/base_otp_provider.dart';
import 'package:fluttersipay/utils/constants.dart';

class MoneyTransferOTPProvider extends BaseOTPVerificationProvider {
  BaseMainRepository _baseMainRepository;
  UserTypes _sendUserType;
  MainApiModel _otpModel;
  final bool isB2B;

  MoneyTransferOTPProvider(
    phoneNumber,
    this._sendUserType,
    this._baseMainRepository,
    this._otpModel,
    smsController,
    countDownTimer,
    this.isB2B,
  ) : super(phoneNumber, smsController, countDownTimer);

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
        MainApiModel resendOTPMerchantModel;
        if (isB2B) {
          MerchantMainRepository merchantRepo = _baseMainRepository;
          resendOTPMerchantModel = await merchantRepo.corporateB2BPayment(
              int.parse(data['merchant_id']),
              data['merchant_name'],
              int.parse(data['receiver_merchant_id']),
              data['receiver_merchant_name'],
              data['amount'],
              int.parse(data['currency_id']),
              data['description']);
        } else {
          IndividualMainRepository userRepo = _baseMainRepository;
          resendOTPMerchantModel = await userRepo.resendOTPMoneySendToMerchant(
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
              data['receiver_email']);
        }
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
        MainApiModel confirmOTPMerchantModel;
        if (isB2B) {
          MerchantMainRepository merchantRepo = _baseMainRepository;
          confirmOTPMerchantModel =
              await merchantRepo.confirmCorporateOTPB2BPayment(
                  int.parse(data['merchant_id']),
                  data['merchant_name'],
                  int.parse(data['receiver_merchant_id']),
                  data['receiver_merchant_name'],
                  data['amount'],
                  int.parse(data['currency_id']),
                  data['description'],
                  smsController.text.trim());
        } else {
          IndividualMainRepository userRepo = _baseMainRepository;
          confirmOTPMerchantModel =
              await userRepo.createMoneySendToMerchantVerifyOTP(
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
        }
        return confirmOTPMerchantModel;
        break;
    }
    return null;
  }
}
