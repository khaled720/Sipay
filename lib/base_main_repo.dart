import 'package:flutter/cupertino.dart';
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
    debugPrint('bank deposit result $result', wrapWidth: 1024);
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
    debugPrint('withdraw form is $result', wrapWidth: 1024);
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
      int firstCurrencyID, int secondCurrencyID) async {
    Map<String, String> values = {
      'first_currency_id': firstCurrencyID.toString(),
      'second_currency_id': secondCurrencyID.toString(),
    };
    String result = await NetworkHelper.makePostRequest(
        userType == UserTypes.Individual
            ? APIEndPoints.kApiIndividualCreateExchangeEndPoint
            : APIEndPoints.kApiCorporateCreateExchangeEndPoint,
        values,
        bearerToken);
    debugPrint('result is $result', wrapWidth: 1024);
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
}
