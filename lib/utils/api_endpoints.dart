class APIEndPoints {
  //Individual
  static final String kBaseIndividualAPIEndPoint =
      'https://provisioning.sipay.com.tr/api';
  static final String kAPIIndividualLoginEndPoint =
      '$kBaseIndividualAPIEndPoint/individualLogin';
  static final String kAPIIndividualLogoutEndPoint =
      '$kBaseIndividualAPIEndPoint/logout';
  static final String kApiIndividualResendOTPEndPoint =
      '$kBaseIndividualAPIEndPoint/resendotp';
  static final String kApiIndividualVerifySMSEndPoint =
      '$kBaseIndividualAPIEndPoint/verifysms';
  static final String kApiIndividualRegisterEndPoint =
      '$kBaseIndividualAPIEndPoint/individualRegister';
  static final String kApiIndividualResetPasswordEndPoint =
      '$kBaseIndividualAPIEndPoint/reset-password';
  static final String kApiIndividualUserVerificationEndPoint =
      '$kBaseIndividualAPIEndPoint/kyc/update';
  static final String kApiIndividualSMSVerifyRegisterEndPoint =
      '$kBaseIndividualAPIEndPoint/register/verifysms';
  static final String kApiIndividualResendSMSVerifyRegisterEndPoint =
      '$kBaseIndividualAPIEndPoint/register/resendotp';
  static final String kApiIndividualOTPTestEndPoint =
      '$kBaseIndividualAPIEndPoint/files/otp.txt';
  static final String kApiIndividualUserProfileEndPoint =
      '$kBaseIndividualAPIEndPoint/profile';
  static final String kApiIndividualUserProfileUpdateEndPoint =
      '$kBaseIndividualAPIEndPoint/profile/update';
  static final String kApiIndividualUserProfileUploadImageEndPoint =
      '$kBaseIndividualAPIEndPoint/profile/image/upload';

  //Individual Deposit
  static final String kApiIndividualDepositIndividualEndPoint =
      '$kBaseIndividualAPIEndPoint/deposit/create';
  static final String kApiIndividualDepositDetailsEndPoint =
      '$kBaseIndividualAPIEndPoint/deposit/details';
  static final String kApiIndividualDepositDeleteEndPoint =
      '$kBaseIndividualAPIEndPoint/deposit/delete';
  static final String kApiIndividualDepositListEndPoint =
      '$kBaseIndividualAPIEndPoint/deposit/list';
  static final String kApiIndividualDepositUpdateEndPoint =
      '$kBaseIndividualAPIEndPoint/deposit/update';

  //Individual Withdraw
  static final String kApiIndividualCreateWithdrawEndPoint =
      '$kBaseIndividualAPIEndPoint/withdrawals/create';
  static final String kApiIndividualWithdrawTransactionsListEndPoint =
      '$kBaseIndividualAPIEndPoint/withdrawals/transactions';

  //Individual Exchange
  static final String kApiIndividualCreateExchangeEndPoint =
      '$kBaseIndividualAPIEndPoint/exchange/create';
  static final String kApiIndividualExchangeDetailsEndPoint =
      '$kBaseIndividualAPIEndPoint/exchange/details';
  static final String kApiIndividualExchangeListEndPoint =
      '$kBaseIndividualAPIEndPoint/exchange/list';

  //Individual Money Transfer
  static final String kApiIndividualMoneyTransferBaseFormEndPoint =
      '$kBaseIndividualAPIEndPoint/moneytransfer';
  static final String kApiIndividualMoneyTransferDetailsEndPoint =
      '$kBaseIndividualAPIEndPoint/moneytransfer/details';
  static final String kApiIndividualMoneyTransferListRequestMoneyEndPoint =
      '$kBaseIndividualAPIEndPoint/moneytransfer/list/requestmoney';

  //Corporate
  static final String kBaseCorporateAPIEndPoint =
      'https://provisioning.sipay.com.tr/merchant/api';
  static final String kAPICorporateLoginEndPoint =
      '$kBaseCorporateAPIEndPoint/corporatelogin';
  static final String kAPICorporateLogoutEndPoint =
      '$kBaseCorporateAPIEndPoint/logout';
  static final String kApiCorporateResendOTPEndPoint =
      '$kBaseCorporateAPIEndPoint/resendotp';
  static final String kApiCorporateVerifySMSEndPoint =
      '$kBaseCorporateAPIEndPoint/verifysms';
  static final String kApiCorporateResetPasswordEndPoint =
      '$kBaseIndividualAPIEndPoint/changepassword';
}
