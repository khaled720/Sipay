import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/utils/api_endpoints.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:fluttersipay/utils/network_utils.dart';

import '../../main_api_data_model.dart';

class MerchantMainRepository extends BaseMainRepository {
  String bearerToken;
  int merchantID;
  String merchantName;

  MerchantMainRepository(this.bearerToken)
      : super(bearerToken, UserTypes.Corporate);

  //Corporate logout
  Future<MainApiModel> logoutCorporate() async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kAPICorporateLogoutEndPoint, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Corporate Dashboard
  Future<MainApiModel> getCorporateDashboard() async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiCorporateDashboardEndPoint, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Corporate Wallet
  Future<MainApiModel> getUserWallet() async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiCorporateWalletEndPoint, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Corporate B2B Payment
  Future<MainApiModel> corporateB2BPayment(
      int receiverMerchantID,
      String receiverMerchantName,
      String roundedAmount,
      String centAmount,
      int currencyID,
      String description) async {
    Map<String, String> values = {
      'action': 'send-otp-for-b2b',
      'merchant_id': merchantID.toString(),
      'merchant_name': merchantName,
      'receiver_merchant_id': receiverMerchantID.toString(),
      'receiver_merchant_name': receiverMerchantName,
      'rounded_amount': roundedAmount,
      'cent_amount': centAmount,
      'currency_id': currencyID.toString(),
      'description': description
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kAPICorporateB2BPaymentEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Corporate B2B payment confirm OTP
  Future<MainApiModel> confirmCorporateOTPB2BPayment(
      int receiverMerchantID,
      String receiverMerchantName,
      String roundedAmount,
      String centAmount,
      int currencyID,
      String description,
      String b2bOTP) async {
    Map<String, String> values = {
      'action': 'confirm-otp',
      'merchant_id': merchantID.toString(),
      'merchant_name': merchantName,
      'receiver_merchant_id': receiverMerchantID.toString(),
      'receiver_merchant_name': receiverMerchantName,
      'rounded_amount': roundedAmount,
      'cent_amount': centAmount,
      'currency_id': currencyID.toString(),
      'description': description,
      'b2b_otp': b2bOTP
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kAPICorporateB2BPaymentEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Corporate get all merchants B2B payment
  Future<MainApiModel> getAllMerchantsB2BPayment() async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kAPICorporateGetAllMerchantsEndPoint, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Corporate cashout view/list/details
  Future<MainApiModel> corporateCashoutView() async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kAPICorporateCashoutViewEndPoint, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Corporate create cashout/ verify OTP And Confirm
  Future<MainApiModel> corporateCreateCashout(
      String userName,
      String idTckn,
      String phoneCode,
      String gsmNumber,
      String countryCode,
      String bankName,
      String roundAmount,
      String centAmount,
      String currency,
      String iban,
      String description) async {
    Map<String, String> values = {
      'cashout_type': '1', //1
      'action': 'CASHOUT_CREATE',
      'user_name': userName,
      'id_tckn': idTckn,
      'phonecode': phoneCode,
      'gsm_number': gsmNumber,
      'country_code': countryCode,
      'bank_name': bankName,
      'round_amount': roundAmount,
      'cent_amount': centAmount,
      'currency': currency, //TRY
      'iban': iban,
      'description': description,
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kAPICorporateCashoutCreateEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Corporate create cashout to wallet
  Future<MainApiModel> corporateCreateCashoutToWallet(
      String userName,
      String gsmNumber,
      String countryCode,
      String roundAmount,
      String centAmount,
      String currency,
      String description) async {
    Map<String, String> values = {
      'cashout_type': '2', //2
      'action': 'CASHOUT_CREATE',
      'gsm_number': gsmNumber,
      'nonuser': '0', //0
      'country_code': countryCode,
      'user_name': userName,
      'round_amount': roundAmount,
      'cent_amount': centAmount,
      'currency': currency, //TRY
      'description': description,
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kAPICorporateCashoutCreateEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Corporate Withdraw methods

  //Get merchant bank info/Get all data from merchant (POST)
  Future<MainApiModel> getMerchantBankInfo() async {
    Map<String, String> values = {
      'action': 'get-merchant-bank-info',
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiCorporateBaseWithdrawEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Corporate withdraw create/add/send otp
  Future<MainApiModel> corporateWithdrawAdd(
    int bankID,
    int bankStaticId,
    String accountHolderName,
    String ibanNo,
    String amount,
    int currencyID,
    String bankName,
    String amountRound,
    String amountCents,
    int platformID,
    String swiftCode,
    String withdrawOTPCode,
  ) async {
    Map<String, String> values = {
      'bank_id': bankID.toString(),
      'bank_name': bankName,
      'bank_static_id': bankStaticId.toString(),
      'account_holder_name': accountHolderName,
      'platform_id': platformID.toString(),
      'swift_code': swiftCode,
      'currency_id': currencyID.toString(),
      'amount_round': amountRound,
      'amount_cents': amountCents,
      'withdraw_otp': withdrawOTPCode,
    };
//    "key": "",
//    "value": "",
//    "type": "text",
//    "disabled": true
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiCorporateCreateWithdrawEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Corporate transactions list
  Future<MainApiModel> withdrawalsTransactionsList(String amount) async {
    Map<String, String> values = {
      'amount': amount, //''
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualWithdrawTransactionsListEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Create DPL (POST)
  Future<MainApiModel> createMerchantDPL() async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiCorporateCreateDPLEndPoint, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //DPL details
  Future<MainApiModel> getDPLDetails(int dplID) async {
    String result = await NetworkHelper.makeGetRequest(
        '${APIEndPoints.kApiCorporateDPLDetailsEndPoint}/$dplID', bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //DPL List
  Future<MainApiModel> getDPLList(String currency, String minAmount,
      String maxAmount, String merchantName, String dateRange) async {
    Map<String, String> values = {
      'currency': currency,
      'minamount': minAmount,
      'maxamount': maxAmount,
      'merchantname': merchantName,
      'daterange': dateRange
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiCorporateDPLListEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Store DPL
  Future<MainApiModel> storeDPL(
    String roundedAmount,
    String centAmount,
    int currency,
    String expireDate,
    String expireHour,
    int paymentLinkType,
    String gsm,
  ) async {
    Map<String, String> values = {
      'rounded_amount': roundedAmount,
      'cent_amount': centAmount,
      'currency': currency.toString(), //1
      'expire_date': expireDate,
      'expire_hour': expireHour,
      'payment_link_type': '2', //2
      'max_number_of_uses': 'null',
      'gsm': gsm,
      'email': 'null',
      'description': 'null'
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiCorporateStoreDPLEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //All merchant refund request transactions
  Future<MainApiModel> allMerchantRefundRequests(
      String currency,
      String transactionState,
      String searchKey,
      int transactionID,
      int invoiceID,
      int paymentMethodID,
      String amount,
      String transactionType,
      String allTransaction,
      int pageLimit,
      String fromDate,
      String toDate,
      String dateRange) async {
    Map<String, String> values = {
      'transactionState': transactionState, //''
      'currency': currency.toString(), //''
      'search_key': searchKey, //''
      'transid': transactionID.toString(), //''
      'invoiceid': invoiceID.toString(), //''
      'amount': amount, //''
      'paymentmethodid': paymentMethodID.toString(), //''
      'transactiontype': transactionType,
      'allTransaction': allTransaction,
      'page_limit': pageLimit.toString(),
      'from_date': fromDate,
      'to_date': toDate,
      'daterange': dateRange,
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiCorporateRefundRequestEndPoint, values, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Transaction details (Merchant refund requests)
  Future<MainApiModel> refundsTransactionDetails(int transactionID) async {
    String result = await NetworkHelper.makeGetRequest(
        '${APIEndPoints.kApiCorporateRefundsTransactionDetailsEndPoint}/$transactionID',
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Refund request edit
  Future<MainApiModel> refundRequestEdit(int transactionID) async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiCorporateRefundRequestEditEndPoint, bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }
}
