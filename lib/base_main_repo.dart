import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttersipay/utils/api_endpoints.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:fluttersipay/utils/network_utils.dart';

import 'main_api_data_model.dart';

class BaseMainRepository {
  String bearerToken;
  UserTypes userType;

  BaseMainRepository(this.bearerToken, this.userType);

  //Deposit form
  Future<MainApiModel> depositForm() async {
    String result = await NetworkHelper.makeGetRequest(
        userType == UserTypes.Individual
            ? APIEndPoints.kApiIndividualDepositIndividualEndPoint
            : APIEndPoints.kApiDepositCorporateEndPoint,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Deposit create
  Future<MainApiModel> depositCreate(String amount, int currencyID,
      String pnrCode, int bankID, String ibanNumber) async {
    Map<String, String> values = {
      'amount': amount,
      'currency_id': currencyID.toString(),
      'method_id': '7', //method id should be 7...
      'pnr_code': pnrCode,
      'bank_id': bankID.toString(),
      'iban_no': ibanNumber
    };
    String result = await NetworkHelper.makePostRequest(
        userType == UserTypes.Individual
            ? APIEndPoints.kApiIndividualDepositIndividualEndPoint
            : APIEndPoints.kApiDepositCorporateEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Deposit delete
  Future<MainApiModel> depositDelete(int depositID) async {
    String result = await NetworkHelper.makeGetRequest(
        '${userType == UserTypes.Individual ? APIEndPoints.kApiIndividualDepositDeleteEndPoint : APIEndPoints.kApiCorporateDepositDeleteEndPoint}/$depositID',
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Deposit details
  Future<MainApiModel> depositDetails(int depositID) async {
    String result = await NetworkHelper.makeGetRequest(
        '${userType == UserTypes.Individual ? APIEndPoints.kApiIndividualDepositDetailsEndPoint : APIEndPoints.kApiCorporateDepositDetailsEndPoint}/$depositID',
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Deposit list
  Future<MainApiModel> depositList(String searchKey, String transactionState,
      String depositType, String currency, String dateRange) async {
    String result = await NetworkHelper.makeGetRequest(
        userType == UserTypes.Individual
            ? APIEndPoints.kApiIndividualDepositListEndPoint
            : APIEndPoints.kApiCorporateDepositListEndPoint,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //POST Deposit update
  Future<MainApiModel> depositUpdate(int depositID, String newAmount) async {
    Map<String, String> values = {
      'deposit_id': depositID.toString(),
      'new_amount': newAmount,
    };
    String result = await NetworkHelper.makePostRequest(
        userType == UserTypes.Individual
            ? APIEndPoints.kApiIndividualDepositUpdateEndPoint
            : APIEndPoints.kApiCorporateDepositUpdateEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Withdraw form
  Future<MainApiModel> getWithdrawForm() async {
    String result = await NetworkHelper.makeGetRequest(
        userType == UserTypes.Individual
            ? APIEndPoints.kApiIndividualBaseWithdrawEndPoint
            : APIEndPoints.kApiCorporateBaseWithdrawEndPoint,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Create exchange
  Future<MainApiModel> createExchange(
    int exchangeID,
    int firstCurrencyID,
    int secondCurrencyID,
    String roundedAmount,
    String centAmount,
    String rate,
  ) async {
    Map<String, String> values = {
      'exchange_id': exchangeID.toString(),
      'first_currency_id': firstCurrencyID.toString(),
      'second_currency_id': secondCurrencyID.toString(),
      'rounded_amount': roundedAmount,
      'cent_amount': centAmount,
      'rate': rate,
    };
    String result = await NetworkHelper.makePostRequest(
        userType == UserTypes.Individual
            ? APIEndPoints.kApiIndividualCreateExchangeEndPoint
            : APIEndPoints.kApiCorporateCreateExchangeEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Exchange details
  Future<MainApiModel> exchangeDetails(int exchangeID) async {
    String result = await NetworkHelper.makeGetRequest(
        '${userType == UserTypes.Individual ? APIEndPoints.kApiIndividualExchangeDetailsEndPoint : APIEndPoints.kApiCorporateExchangeDetailsEndPoint}/$exchangeID',
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Exchange form
  Future<MainApiModel> exchangeForm(
      int firstCurrencyID, int secondCurrencyID, bool initial) async {
    Map<String, String> values = {
      'first_currency_id': initial ? '' : firstCurrencyID.toString(),
      'second_currency_id': initial ? '' : secondCurrencyID.toString(),
    };
    final newUri = Uri.parse(userType == UserTypes.Individual
            ? APIEndPoints.kApiIndividualCreateExchangeEndPoint
            : APIEndPoints.kApiCorporateCreateExchangeEndPoint)
        .replace(queryParameters: values);
    String result = await NetworkHelper.makeGetRequest(newUri, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Exchange list
  Future<MainApiModel> individualExchangeList(String currency, String minAmount,
      String maxAmount, String dateRange) async {
    Map<String, String> values = {
      'currency': currency,
      'minamount': minAmount,
      'maxamount': maxAmount,
      'daterange': dateRange,
    };
    String result = await NetworkHelper.makePostRequest(
        userType == UserTypes.Individual
            ? APIEndPoints.kApiIndividualExchangeListEndPoint
            : APIEndPoints.kApiCorporateExchangeListEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Profile Settings
  Future<MainApiModel> getUserProfile() async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiIndividualUserProfileEndPoint, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Profile update
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

  //Profile upload base 64 image
  Future<MainApiModel> uploadBase64Image(File base64Image) async {
    String result = await NetworkHelper.uploadBase64Image(
        APIEndPoints.kApiIndividualUserProfileUploadImageEndPoint,
        base64Image,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual transactions list activity
  Future<MainApiModel> individualTransactionsListActivity(
      String currency, String dateRange) async {
    Map<String, String> values;
    if (userType == UserTypes.Individual) {
      values = {
        'currency': currency,
        'daterange': dateRange,
      };
    } else {
      values = {
        'transactionState': '',
        'currency': '',
        'search_key': '',
        'transid': '',
        'invoiceid': '',
        'amount': '',
        'paymentmethodid': '',
        'transactiontype': '',
        'allTransaction': '',
        'page_limit': '',
        'from_date': '',
        'to_date': '',
        'daterange': ''
      };
    }
    final newUri = Uri.parse(userType == UserTypes.Individual
            ? APIEndPoints.kApiIndividualTransactionsListActivityEndPoint
            : APIEndPoints.kApiCorporateTransactionListEndPoint)
        .replace(queryParameters: values);
    String result = await NetworkHelper.makeGetRequest(newUri, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual money details
  Future<MainApiModel> moneyTransferDetails(
      var transferID, String transactionType) async {
    Map<String, String> values = {'transactiontype': transactionType ?? 'send'};
    final newUri = Uri.parse(
            '${APIEndPoints.kApiIndividualMoneyTransferDetailsEndPoint}/${transferID.toString()}')
        .replace(queryParameters: values);
    String result = await NetworkHelper.makeGetRequest(newUri, bearerToken);
    debugPrint('money transfer details is $result', wrapWidth: 1024);
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
    //debugPrint('incoming is $result', wrapWidth: 1024);
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
    debugPrint('create money request is $result', wrapWidth: 1024);
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
    return MainApiModel.mapJsonToModel(result);
  }

  Future<MainApiModel> moneyTransferReceiverInfo(
      String merchantID, String phone) async {
    print('merchant id is $merchantID');
    Map<String, String> values = {
      'merchant_id': merchantID ?? '',
      'phone': phone ?? '',
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualGetMerchantReceiverInfoEndPoint,
        values,
        bearerToken);
    debugPrint('receiver info is $result');
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
      'receiver_email': receiverEmail ?? ''
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualSendMoneyToUserOrMerchantCreateEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual transactions list
  Future<MainApiModel> searchIndividualTransactionsList(
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
    final newUri = Uri.parse(userType == UserTypes.Individual
            ? APIEndPoints.kApiIndividualTransactionListEndPoint
            : APIEndPoints.kApiCorporateTransactionListEndPoint)
        .replace(queryParameters: values);
    String result = await NetworkHelper.makeGetRequest(newUri, bearerToken);
    debugPrint('search transactions list is $result', wrapWidth: 1024);
    return MainApiModel.mapJsonToModel(result);
  }
}
