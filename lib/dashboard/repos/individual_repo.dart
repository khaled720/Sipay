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
      'swift_code': swiftCode ?? '',
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
    var bankStaticId,
    String accountHolderName,
    String ibanNo,
    String amount,
    var currencyID,
    String bankName,
    String logo,
    String bankSaveCheck,
    String savedBankAccount,
    var userType,
    String withdrawOTP,
  ) async {
    Map<String, String> values = {
      'action': 'VERIFYOTP',
      'swift_code': swiftCode ?? '',
      'bank_static_id': bankStaticId.toString(),
      'account_holder_name': accountHolderName,
      'iban_no': ibanNo,
      'amount': amount,
      'currency_id': currencyID.toString(), //method id should be 7...
      'bank_name': bankName,
      'logo': logo ?? '',
      'bankSaveCheck': bankSaveCheck,
      'savedBankAccount': savedBankAccount,
      'user_type': userType.toString(),
      'withdraw_otp': withdrawOTP
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualCreateWithdrawEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  Future<MainApiModel> resendWithdrawOTP(
    String swiftCode,
    var bankStaticId,
    String accountHolderName,
    String ibanNo,
    String amount,
    var currencyID,
    String bankName,
    String logo,
    String bankSaveCheck,
    String savedBankAccount,
    var userType,
  ) async {
    Map<String, String> values = {
      'action': 'RESENDOTP',
      'swift_code': swiftCode ?? '',
      'bank_static_id': bankStaticId.toString(),
      'account_holder_name': accountHolderName,
      'iban_no': ibanNo,
      'amount': amount,
      'currency_id': currencyID.toString(), //method id should be 7...
      'bank_name': bankName,
      'logo': logo ?? '',
      'bankSaveCheck': bankSaveCheck,
      'savedBankAccount': savedBankAccount,
      'user_type': userType.toString(),
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
}
