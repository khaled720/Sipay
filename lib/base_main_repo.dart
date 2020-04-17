import 'dart:convert';
import 'dart:io';

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
    Map<String, String> values = {
      'merchant_id': merchantID ?? '',
      'phone': phone ?? '',
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualGetMerchantReceiverInfoEndPoint,
        values,
        bearerToken);
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
    return MainApiModel.mapJsonToModel(result);
  }

  //Bank Account Settings APIs

  //Add bank account
  Future<MainApiModel> addNewBankAccount(
      String bankName,
      String logo,
      String staticBankID,
      var currencyID,
      var iban,
      String accountHolderName,
      var accountNo,
      String swiftCode,
      var status) async {
    Map<String, String> values = {
      'bank_name': bankName,
      'logo': logo,
      'static_bank_id': staticBankID,
      'currency_id': currencyID.toString(),
      'account_holder_name': accountHolderName, //3
      'account_no': accountNo.toString(),
      'iban': iban.toString(),
      'swift_code': swiftCode ?? '', //1
      'status': status.toString(),
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiAddBankAccountEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Bank Account Form
  Future<MainApiModel> bankAccountSettingsForm() async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiBankAccountFormEndPoint, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Bank Accounts List
  Future<MainApiModel> bankAccountsList() async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiBankAccountListEndPoint, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Bank Accounts Details
  Future<MainApiModel> bankAccountDetails(int bankID) async {
    String result = await NetworkHelper.makeGetRequest(
        '${APIEndPoints.kApiBankDetailsEndPoint}/${bankID.toString()}',
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Bank Accounts Delete
  Future<MainApiModel> bankAccountDelete(int bankID) async {
    String result = await NetworkHelper.makeGetRequest(
        '${APIEndPoints.kApiBankDeleteEndPoint}/$bankID', bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Update bank account
  Future<MainApiModel> updateBankAccount(
      var bankID,
      String bankName,
      String staticBankID,
      String logo,
      var currencyID,
      var iban,
      String accountHolderName,
      var accountNo,
      String swiftCode,
      var status) async {
    Map<String, String> values = {
      'bank_id': bankID.toString(),
      'bank_name': bankName,
      'logo': logo,
      'static_bank_id': staticBankID.toString(),
      'currency_id': currencyID.toString(),
      'account_holder_name': accountHolderName, //3
      'account_no': accountNo.toString(),
      'iban': iban.toString(),
      'swift_code': swiftCode ?? '', //1
      'status': status.toString(),
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiBankUpdateEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Money Transfer settings
  Future<MainApiModel> moneyTransferSettings() async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiMoneyTransferSettingsEndPoint, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Money Transfer settings update
  Future<MainApiModel> moneyTransferSettingsUpdate(
      int enableMoneyTransfer, int moneyTransferFromTotalBalance) async {
    Map<String, String> values = {
      'enable_money_transfer': enableMoneyTransfer.toString(),
      'money_transfer_from_total_balance':
          moneyTransferFromTotalBalance.toString(),
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiMoneyTransferSettingsEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Notification settings
  Future<MainApiModel> notificationSettings() async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiNotificationSettingsEndPoint, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Notification settings update
  Future<MainApiModel> notificationSettingsUpdate(
      Map<String, String> smsValues, Map<String, String> emailValues) async {
    Map<String, String> secondsIDs = {
      '0': '1',
      '1': '2',
      '2': '3',
      '3': '4',
      '4': '5',
      '5': '6',
      '6': '7',
      '7': '8',
      '8': '9',
      '9': '10',
      '10': '11',
      '11': '12',
      '12': '13',
      '13': '14'
    };
    Map<String, dynamic> values = {
      'ids': secondsIDs,
      'is_sms_enable': smsValues,
      'is_email_enable': emailValues
    };
    String encode = jsonEncode(values);
    String result = await NetworkHelper.makePostRequestJsonHeaders(
        APIEndPoints.kApiNotificationSettingsEndPoint, encode, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Security APIs

  //Change Email
  Future<MainApiModel> changeEmail(String currentPassword, String email) async {
    Map<String, String> values = {
      'action': 'CHANGEMAIL',
      'current_password': currentPassword,
      'email': email.toString(),
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiEmailChangeSettingsEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Change Email Verify OTP
  Future<MainApiModel> changeEmailVerifyOTP(
      String currentPassword, String email, var otp, var userID) async {
    Map<String, String> values = {
      'action': 'VERIFYOTP',
      'current_password': currentPassword,
      'email': email.toString(),
      'user_id': userID.toString(),
      'otp_code': otp.toString()
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiEmailChangeSettingsEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Change Email Resend OTP
  Future<MainApiModel> changeEmailResendOTP(
      String currentPassword, String email, var userID) async {
    Map<String, String> values = {
      'action': 'RESENDOTP',
      'current_password': currentPassword,
      'email': email.toString(),
      'user_id': userID.toString(),
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiEmailChangeSettingsEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Change Password
  Future<MainApiModel> changePassword(
    String currentPassword,
    String password,
    String confirmPassword,
  ) async {
    Map<String, String> values = {
      'action': 'CHANGEPASS',
      'current_password': currentPassword,
      'password': password,
      'confirm_password': confirmPassword
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiPasswordChangeSettingsEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Change Password Verify OTP
  Future<MainApiModel> changePasswordVerifyOTP(String currentPassword,
      String password, String confirmPassword, var otp, var userID) async {
    Map<String, String> values = {
      'action': 'VERIFYOTP',
      'current_password': currentPassword,
      'password': password,
      'confirm_password': confirmPassword,
      'user_id': userID.toString(),
      'otp_code': otp.toString()
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiPasswordChangeSettingsEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Change Email Resend OTP
  Future<MainApiModel> changePasswordResendOTP(String currentPassword,
      String password, String confirmPassword, var userID) async {
    Map<String, String> values = {
      'action': 'RESENDOTP',
      'current_password': currentPassword,
      'passowrd': password,
      'confirm_password': confirmPassword,
      'user_id': userID.toString(),
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiPasswordChangeSettingsEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }
}
