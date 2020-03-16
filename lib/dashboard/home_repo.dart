import 'package:fluttersipay/utils/api_endpoints.dart';
import 'package:fluttersipay/utils/network_utils.dart';

import '../main_api_data_model.dart';

class DashboardRepository {
  //Individual Profile
  Future<MainApiModel> getUserProfile(String bearerToken) async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiIndividualUserProfileEndPoint, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual profile update
  Future<MainApiModel> userProfileUpdate(
      String country, String city, String address, String bearerToken) async {
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
  Future<MainApiModel> uploadBase64Image(
      String base64Image, String bearerToken) async {
    Map<String, String> values = {
      'image': base64Image,
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualUserProfileUploadImageEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual deposit methods
  Future<MainApiModel> depositCreate(
      String amount,
      int currencyID,
      int methodID,
      String pnrCode,
      int bankID,
      String ibanNumber,
      String bearerToken) async {
    Map<String, String> values = {
      'amount': amount,
      'currency_id': currencyID.toString(),
      'method_id': methodID.toString(), //method id should be 7...
      'pnr_code': pnrCode,
      'bank_id': bankID.toString(),
      'iban_no': ibanNumber
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualDepositIndividualEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual deposit form
  Future<MainApiModel> depositForm(String bearerToken) async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiIndividualDepositIndividualEndPoint, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual deposit details
  Future<MainApiModel> depositDetails(String bearerToken, int depositID) async {
    String result = await NetworkHelper.makeGetRequest(
        '${APIEndPoints.kApiIndividualDepositDetailsEndPoint}/$depositID',
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual deposit delete
  Future<MainApiModel> depositDelete(String bearerToken, int depositID) async {
    String result = await NetworkHelper.makeGetRequest(
        '${APIEndPoints.kApiIndividualDepositDeleteEndPoint}/$depositID',
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual deposit list
  Future<MainApiModel> depositList(
      String searchKey,
      String transactionState,
      String depositType,
      String currency,
      String dateRange,
      String bearerToken) async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiIndividualDepositListEndPoint, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //POST individual deposit update
  Future<MainApiModel> depositUpdate(
      int depositID, String newAmount, String bearerToken) async {
    Map<String, String> values = {
      'deposit_id': depositID.toString(),
      'new_amount': newAmount,
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualDepositUpdateEndPoint, values, bearerToken);
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
      int userType,
      String bearerToken) async {
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
      String bearerToken) async {
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
  Future<MainApiModel> withdrawalsTransactionsList(String search, String status,
      String dateRange, String bearerToken) async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiIndividualWithdrawTransactionsListEndPoint,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual create exchange
  Future<MainApiModel> createExchange(
      int exchangeID,
      int firstCurrencyID,
      int secondCurrencyID,
      String roundedAmount,
      String centAmount,
      String rate,
      String bearerToken) async {
    Map<String, String> values = {
      'exchange_id': exchangeID.toString(),
      'first_currency_id': firstCurrencyID.toString(),
      'second_currency_id': secondCurrencyID.toString(),
      'rounded_amount': roundedAmount,
      'cent_amount': centAmount,
      'rate': rate,
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualCreateExchangeEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual exchange details
  Future<MainApiModel> exchangeDetails(
      int exchangeID, String bearerToken) async {
    String result = await NetworkHelper.makeGetRequest(
        '${APIEndPoints.kApiIndividualExchangeDetailsEndPoint}/$exchangeID',
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual exchange form
  Future<MainApiModel> exchangeForm(int exchangeID, int firstCurrencyID,
      int secondCurrencyID, String bearerToken) async {
    Map<String, String> values = {
      'first_currency_id': firstCurrencyID.toString(),
      'second_currency_id': secondCurrencyID.toString(),
    };
    String result = await NetworkHelper.makePostRequest(
        '${APIEndPoints.kApiIndividualCreateExchangeEndPoint}/$exchangeID',
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual exchange list
  Future<MainApiModel> individualExchangeList(String currency, String minAmount,
      String maxAmount, String dateRange, String bearerToken) async {
    Map<String, String> values = {
      'currency': currency,
      'minamount': minAmount,
      'maxamount': maxAmount,
      'daterange': dateRange,
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualExchangeListEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual money details
  Future<MainApiModel> moneyTransferDetails(
      int transferID, String transactionType, String bearerToken) async {
    Map<String, String> values = {'transactiontype': transactionType ?? 'send'};
    String result = await NetworkHelper.makePostRequest(
        '${APIEndPoints.kApiIndividualMoneyTransferDetailsEndPoint}/$transferID',
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual money transfer form
  Future<MainApiModel> moneyTransferForm(String bearerToken) async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiIndividualMoneyTransferBaseFormEndPoint, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual money transfer request money list
  Future<MainApiModel> moneyTransferListRequestMoney(String currency,
      String dateRange, String searchKey, String bearerToken) async {
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
}
