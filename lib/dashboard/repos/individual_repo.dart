import 'package:fluttersipay/dashboard/repos/base_main_repo.dart';
import 'package:fluttersipay/utils/api_endpoints.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:fluttersipay/utils/network_utils.dart';

import '../../main_api_data_model.dart';

class IndividualMainRepository extends BaseMainRepository {
  String bearerToken;

  IndividualMainRepository(bearerToken)
      : super(bearerToken, UserTypes.Individual);

  //Individual Profile
  Future<MainApiModel> getUserProfile() async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiIndividualUserProfileEndPoint, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual profile update
  Future<MainApiModel> userProfileUpdate(
      String country, String city, String address) async {
    Map<String, String> values = {
      'country': country,
      'city': city,
      'address': address,
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualUserProfileUpdateEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual profile upload base 64 image
  Future<MainApiModel> uploadBase64Image(String base64Image) async {
    Map<String, String> values = {
      'image': base64Image,
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualUserProfileUploadImageEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual Withdraw methods

  //Withdraw request
  Future<MainApiModel> withdrawCreate(
      String swiftCode,
      int bankStaticId,
      String accountHolderName,
      String ibanNo,
      String amount,
      int currencyID,
      String bankName,
      String bankSaveCheck,
      String savedBankAccount,
      int userType) async {
    Map<String, String> values = {
      'action': 'WithdrawalRequest',
      'swift_code': swiftCode,
      'bank_static_id': bankStaticId.toString(),
      'account_holder_name': accountHolderName,
      'iban_no': ibanNo,
      'amount': amount,
      'currency_id': currencyID.toString(), //method id should be 7...
      'bank_name': bankName,
      'logo': 'logo.jpg',
      'bankSaveCheck': bankSaveCheck,
      'savedBankAccount': savedBankAccount,
      'user_type': userType.toString(),
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualCreateWithdrawEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Withdraw otp
  Future<MainApiModel> withdrawOTP(
    String swiftCode,
    int bankStaticId,
    String accountHolderName,
    String ibanNo,
    String amount,
    int currencyID,
    String bankName,
    String bankSaveCheck,
    String savedBankAccount,
    int userType,
    String withdrawOTP,
  ) async {
    Map<String, String> values = {
      'action': 'VERIFYOTP',
      'swift_code': swiftCode,
      'bank_static_id': bankStaticId.toString(),
      'account_holder_name': accountHolderName,
      'iban_no': ibanNo,
      'amount': amount,
      'currency_id': currencyID.toString(), //method id should be 7...
      'bank_name': bankName,
      'logo': 'logo.jpg',
      'bankSaveCheck': bankSaveCheck,
      'savedBankAccount': savedBankAccount,
      'user_type': userType.toString(),
      'withdraw_otp': withdrawOTP
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualCreateWithdrawEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual transactions list
  Future<MainApiModel> withdrawalsTransactionsList(
      String search, String status, String dateRange) async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiIndividualWithdrawTransactionsListEndPoint,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual money details
  Future<MainApiModel> moneyTransferDetails(
      int transferID, String transactionType) async {
    Map<String, String> values = {'transactiontype': transactionType ?? 'send'};
    String result = await NetworkHelper.makePostRequest(
        '${APIEndPoints.kApiIndividualMoneyTransferDetailsEndPoint}/$transferID',
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual money transfer form
  Future<MainApiModel> moneyTransferForm() async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiIndividualMoneyTransferBaseFormEndPoint, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual money transfer request money list
  Future<MainApiModel> moneyTransferListRequestMoney(
      String currency, String dateRange, String searchKey) async {
    Map<String, String> values = {
      'currency': currency,
      'daterange': dateRange,
      'search_key': searchKey,
      'reciever_gsm': ''
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualMoneyTransferListRequestMoneyEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual money transfer send money list
  Future<MainApiModel> moneyTransferListSendMoney(
      String currency, String dateRange, String searchKey) async {
    Map<String, String> values = {
      'currency': currency,
      'daterange': dateRange,
      'search_key': searchKey,
      'reciever_gsm': ''
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualMoneyTransferListSendMoneyEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual create money request
  Future<MainApiModel> createMoneyRequest(
      String amount, String phone, int currency, String explanation) async {
    Map<String, String> values = {
      'phone': phone,
      'amount': amount,
      'currency': currency.toString(), //method id should be 7...
      'explanation': explanation,
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualCreateMoneyRequestEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual create money send to merchant
  Future<MainApiModel> createMoneySendToMerchantValidate(
    int merchantID,
    String phone,
    String amount,
    int currency,
    String explanation,
  ) async {
    Map<String, String> values = {
      'action': 'SENDMONEYTOMERCHANT',
      'merchant_id': merchantID.toString(),
      'phone': phone,
      'amount': amount,
      'currency': currency.toString(),
      'explanation': explanation,
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualSendMoneyToUserOrMerchantCreateEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual verify OTP from money send to user
  Future<MainApiModel> createMoneySendToUserVerifyOTP(
    String senderName,
    String senderPhone,
    int senderID,
    int senderUserCategory,
    String receiverPhone,
    String amount,
    int currencyID,
    String description,
    int sendType,
    int userType,
    int receiverUserType,
    String receiverEmail,
    String otpCode,
  ) async {
    Map<String, String> values = {
      'action': 'VERIFYOTP',
      'sender_name': senderName,
      'sender_phone': senderPhone,
      'sender_id': senderID.toString(),
      'sender_user_category': senderUserCategory.toString(), //3
      'receiver_phone': receiverPhone,
      'amount': amount,
      'currency_id': currencyID.toString(),
      'description': description,
      'send_type': sendType.toString(), //6
      'user_type': userType.toString(), //0
      'receiver_user_type': receiverUserType.toString(), //2
      'receiver_email': receiverEmail,
      'otp_code': otpCode
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualSendMoneyToUserOrMerchantCreateEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual resend OTP from money request to merchant
  Future<MainApiModel> resendOTPMoneySendToMerchant(
    String senderName,
    String senderPhone,
    int senderID,
    int senderUserCategory,
    String receiverPhone,
    String amount,
    int currencyID,
    String description,
    int sendType,
    int userType,
    int receiverUserType,
    String receiverEmail,
  ) async {
    Map<String, String> values = {
      'action': 'RESENDOTP',
      'sender_name': senderName,
      'sender_phone': senderPhone,
      'sender_id': senderID.toString(),
      'sender_user_category': senderUserCategory.toString(), //3
      'receiver_phone': receiverPhone,
      'amount': amount,
      'currency_id': currencyID.toString(), //1
      'description': description,
      'send_type': sendType.toString(), //6
      'user_type': userType.toString(), //0
      'receiver_user_type': receiverUserType.toString(), //2
      'receiver_email': receiverEmail
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualSendMoneyToUserOrMerchantCreateEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual create money send to user
  Future<MainApiModel> createMoneySendToUserValidate(
    String phone,
    String amount,
    int currency,
    String explanation,
  ) async {
    Map<String, String> values = {
      'action': 'SENDMONEY',
      'phone': phone,
      'amount': amount,
      'currency': currency.toString(),
      'explanation': explanation,
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualSendMoneyToUserOrMerchantCreateEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual resend OTP from money request to user
  Future<MainApiModel> resendOTPMoneySendToUser(
    String senderName,
    String senderPhone,
    int senderID,
    int senderUserCategory,
    String receiverPhone,
    String amount,
    int currencyID,
    String description,
    int sendType,
    int userType,
    String receiverEmail,
  ) async {
    Map<String, String> values = {
      'action': 'RESENDOTP',
      'sender_name': senderName,
      'sender_phone': senderPhone,
      'sender_id': senderID.toString(),
      'sender_user_category': senderUserCategory.toString(), //3
      'receiver_phone': receiverPhone,
      'amount': amount,
      'currency_id': currencyID.toString(), //1
      'description': description,
      'send_type': sendType.toString(), //1
      'user_type': userType.toString(), //0
      'receiver_email': receiverEmail
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualSendMoneyToUserOrMerchantCreateEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual transactions list activity
  Future<MainApiModel> individualTransactionsListActivity(
      String currency, String dateRange) async {
    Map<String, String> values = {
      'currency': currency,
      'daterange': dateRange,
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualTransactionsListActivityEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual transaction details
  Future<MainApiModel> individualTransactionsDetailsActivity(
      int transactionID) async {
    Map<String, String> values = {
      'transactiontype': 'purchase',
    };
    String result = await NetworkHelper.makePostRequest(
        '${APIEndPoints.kApiIndividualTransactionDetailsEndPoint}/transactionID',
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual transactions list
  Future<MainApiModel> individualTransactionsList(
      String searchKey,
      String transactionState,
      String currency,
      String minAmount,
      String maxAmount,
      String merchantName,
      String dateRange) async {
    Map<String, String> values = {
      'searchkey': searchKey,
      'transactionState': transactionState,
      'currency': currency,
      'minamount': minAmount,
      'maxamount': maxAmount,
      'merchantname': merchantName,
      'daterange': dateRange
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualTransactionListEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }
}
