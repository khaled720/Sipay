import 'package:flutter/cupertino.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/utils/api_endpoints.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:fluttersipay/utils/network_utils.dart';

import '../../main_api_data_model.dart';

class IndividualMainRepository extends BaseMainRepository {
  String bearerToken;

  IndividualMainRepository(this.bearerToken)
      : super(bearerToken, UserTypes.Individual);

  //Individual logout
  Future<MainApiModel> logoutIndividual() async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kAPIIndividualLogoutEndPoint, bearerToken);
    print('logout result $result');
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual Wallet
  Future<MainApiModel> getUserWallet() async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiIndividualWalletEndPoint, bearerToken);
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
  Future<MainApiModel> moneyTransferListRequestMoney(String currency,
      String dateRange, String searchKey, String receiverGSM) async {
    Map<String, String> values = {
      'currency': currency,
      'daterange': dateRange,
      'search_key': searchKey,
      'receiver_gsm': receiverGSM
    };
    final newUri = Uri.parse(
            APIEndPoints.kApiIndividualMoneyTransferListRequestMoneyEndPoint)
        .replace(queryParameters: values);
    String result = await NetworkHelper.makeGetRequest(newUri, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual money transfer send money list
  Future<MainApiModel> moneyTransferListSendMoney(String currency,
      String dateRange, String searchKey, String receiverGSM) async {
    Map<String, String> values = {
      'currency': currency,
      'daterange': dateRange,
      'search_key': searchKey,
      'receiver_gsm': receiverGSM
    };
    final newUri =
        Uri.parse(APIEndPoints.kApiIndividualMoneyTransferListSendMoneyEndPoint)
            .replace(queryParameters: values);
    String result = await NetworkHelper.makeGetRequest(newUri, bearerToken);
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
    var merchantID,
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
    debugPrint('send to merchant result is $result', wrapWidth: 1024);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual verify OTP from money send to user
  Future<MainApiModel> createMoneySendToUserVerifyOTP(
    String senderName,
    String senderPhone,
    var senderID,
    var senderUserCategory,
    String receiverPhone,
    String amount,
    var currencyID,
    String description,
    var sendType,
    var userType,
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
      'receiver_email': receiverEmail ?? '',
      'otp_code': otpCode
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualSendMoneyToUserOrMerchantCreateEndPoint,
        values,
        bearerToken);
    debugPrint('send money otp response is $result');
    return MainApiModel.mapJsonToModel(result);
  }

  Future<MainApiModel> createMoneySendToMerchantVerifyOTP(
    String senderName,
    String senderPhone,
    var senderID,
    var senderUserCategory,
    String receiverPhone,
    String amount,
    var currencyID,
    String description,
    var sendType,
    var userType,
    String receiverEmail,
    var receiverUserType,
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
      'receiver_email': receiverEmail ?? '',
      'receiver_user_type': receiverUserType.toString(),
      'otp_code': otpCode
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualSendMoneyToUserOrMerchantCreateEndPoint,
        values,
        bearerToken);
    debugPrint('send money to merchant verify otp is $result', wrapWidth: 1024);
    return MainApiModel.mapJsonToModel(result);
  }

  Future<MainApiModel> moneyTransferReceiverInfo(
      var merchantID, var phone) async {
    print('merchant id is $merchantID');
    Map<String, String> values = {
      'merchant_id': merchantID.toString() ?? '',
      'phone': phone ?? '',
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualGetMerchantReceiverInfoEndPoint,
        values,
        bearerToken);
    debugPrint('money receiver $result', wrapWidth: 1024);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual resend OTP from money request to merchant
  Future<MainApiModel> resendOTPMoneySendToMerchant(
    String senderName,
    String senderPhone,
    var senderID,
    var senderUserCategory,
    String receiverPhone,
    String amount,
    var currencyID,
    String description,
    var sendType,
    var userType,
    var receiverUserType,
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
      'receiver_email': receiverEmail ?? ''
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualSendMoneyToUserOrMerchantCreateEndPoint,
        values,
        bearerToken);
    debugPrint('resend merchant otp result is $result', wrapWidth: 1024);
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
    debugPrint('send to user result is $result', wrapWidth: 1024);
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
      'receiver_email': receiverEmail ?? ''
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualSendMoneyToUserOrMerchantCreateEndPoint,
        values,
        bearerToken);
    debugPrint('resend otp is $result', wrapWidth: 1024);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual transactions list activity
  Future<MainApiModel> individualTransactionsListActivity(
      String currency, String dateRange) async {
    Map<String, String> values = {
      'currency': currency,
      'daterange': dateRange,
    };
    final newUri =
        Uri.parse(APIEndPoints.kApiIndividualTransactionsListActivityEndPoint)
            .replace(queryParameters: values);
    String result = await NetworkHelper.makeGetRequest(newUri, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual transactions list activity
  Future<MainApiModel> individualTransactionsListActivity2(
      String currency, String dateRange) async {
    Map<String, String> values = {
      'currency': currency,
      'daterange': dateRange,
    };
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiIndividualTransactionsListActivityEndPoint,
        bearerToken);
    print('transactions list $result');
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual transaction details
  Future<MainApiModel> individualTransactionsDetailsActivity(
      int transactionID, String transactionType) async {
    Map<String, String> values = {
      'transactionType': transactionType,
    };
    final newUri = Uri.parse(
            '${APIEndPoints.kApiIndividualTransactionDetailsEndPoint}/${transactionID.toString()}')
        .replace(queryParameters: values);
    String result = await NetworkHelper.makeGetRequest(newUri, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual transactions list
  Future<MainApiModel> individualTransactionsList(
      String searchKey,
      String transactionState,
      String currency,
      String transactionType,
      String dateRange) async {
    Map<String, String> values = {
      'searchkey': searchKey,
      'transactionState': transactionState,
      'currency': currency,
      'transactionType': transactionType,
      'daterange': dateRange
    };
    final newUri = Uri.parse(APIEndPoints.kApiIndividualTransactionListEndPoint)
        .replace(queryParameters: values);
    String result = await NetworkHelper.makeGetRequest(newUri, bearerToken);
    print('transactions list is $result');
    return MainApiModel.mapJsonToModel(result);
  }
}
