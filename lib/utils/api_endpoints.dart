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

  //Individual Wallet
  static final String kApiIndividualWalletEndPoint =
      '$kBaseIndividualAPIEndPoint/wallet/list';

  //Individual activity list
  static final String kApiIndividualActivityListEndPoint =
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
  static final String kApiIndividualBaseWithdrawEndPoint =
      '$kBaseIndividualAPIEndPoint/withdrawals';
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
  static final String kApiIndividualMoneyTransferListSendMoneyEndPoint =
      '$kBaseIndividualAPIEndPoint/moneytransfer/list';
  static final String kApiIndividualCreateMoneyRequestEndPoint =
      '$kBaseIndividualAPIEndPoint/requestmoney/create';
  static final String kApiIndividualSendMoneyToUserOrMerchantCreateEndPoint =
      '$kBaseIndividualAPIEndPoint/validatesendmoney';
  static final String kApiIndividualGetMerchantReceiverInfoEndPoint =
      '$kBaseIndividualAPIEndPoint/getreceiverinfo';
  static final String kApiIndividualRequestMoneyCreateEndPoint =
      '$kBaseIndividualAPIEndPoint/requestmoney/create';

  //Individual Transactions
  static final String kApiIndividualTransactionsListActivityEndPoint =
      '$kBaseIndividualAPIEndPoint/transaction/list/activities';
  static final String kApiIndividualTransactionDetailsEndPoint =
      '$kBaseIndividualAPIEndPoint/transaction/details';
  static final String kApiIndividualTransactionListEndPoint =
      '$kBaseIndividualAPIEndPoint/transaction/list';

  //Bank Account settings
  static final String kApiAddBankAccountEndPoint =
      '$kBaseIndividualAPIEndPoint/setting/bankadd';
  static final String kApiBankAccountFormEndPoint =
      '$kBaseIndividualAPIEndPoint/setting/bankform';
  static final String kApiBankAccountListEndPoint =
      '$kBaseIndividualAPIEndPoint/setting/banklist';
  static final String kApiBankDetailsEndPoint =
      '$kBaseIndividualAPIEndPoint/setting/bankdetails';
  static final String kApiBankDeleteEndPoint =
      '$kBaseIndividualAPIEndPoint/setting/bankdelete';
  static final String kApiBankUpdateEndPoint =
      '$kBaseIndividualAPIEndPoint/setting/bankupdate';

  //Money Transfer settings
  static final String kApiMoneyTransferSettingsEndPoint =
      '$kBaseIndividualAPIEndPoint/setting/moneytransfer';

  //Notification settings
  static final String kApiNotificationSettingsEndPoint =
      '$kBaseIndividualAPIEndPoint/setting/notification';

  //Individual Security settings
  static final String kApiEmailChangeSettingsEndPoint =
      '$kBaseIndividualAPIEndPoint/setting/changeemail';
  static final String kApiPasswordChangeSettingsEndPoint =
      '$kBaseIndividualAPIEndPoint/setting/changepassword';

  //Corporate

  //Corporate login
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

  //Corporate B2B
  static final String kAPICorporateB2BPaymentEndPoint =
      '$kBaseCorporateAPIEndPoint/b2bpayment/add';
  static final String kAPICorporateGetAllMerchantsEndPoint =
      '$kBaseCorporateAPIEndPoint/b2bpayment/getallmerchant';

  //Corporate Cashout
  static final String kAPICorporateCashoutCreateEndPoint =
      '$kBaseCorporateAPIEndPoint/cashouts/create';
  static final String kAPICorporateCashoutViewEndPoint =
      '$kBaseCorporateAPIEndPoint/cashout/view';

  //Corporate Deposit
  static final String kApiDepositCorporateEndPoint =
      '$kBaseCorporateAPIEndPoint/deposit/create';
  static final String kApiCorporateDepositDeleteEndPoint =
      '$kBaseCorporateAPIEndPoint/deposit/delete';
  static final String kApiCorporateDepositDetailsEndPoint =
      '$kBaseCorporateAPIEndPoint/deposit/details';
  static final String kApiCorporateDepositListEndPoint =
      '$kBaseCorporateAPIEndPoint/deposit/list';
  static final String kApiCorporateDepositUpdateEndPoint =
      '$kBaseCorporateAPIEndPoint/deposit/update';

  //Corporate Withdraw
  static final String kApiCorporateBaseWithdrawEndPoint =
      '$kBaseCorporateAPIEndPoint/withdraw';
  static final String kApiCorporateCreateWithdrawEndPoint =
      '$kBaseCorporateAPIEndPoint/withdraw/add';
  static final String kApiCorporateWithdrawTransactionsListEndPoint =
      '$kBaseCorporateAPIEndPoint/transaction/withdraws_transactions';

  //Corporate Exchange
  static final String kApiCorporateCreateExchangeEndPoint =
      '$kBaseCorporateAPIEndPoint/exchange/create';
  static final String kApiCorporateExchangeDetailsEndPoint =
      '$kBaseCorporateAPIEndPoint/exchange/details';
  static final String kApiCorporateExchangeListEndPoint =
      '$kBaseCorporateAPIEndPoint/exchange/list';

  //Corporate DPL
  static final String kApiCorporateCreateDPLEndPoint =
      '$kBaseCorporateAPIEndPoint/creatingdpl';
  static final String kApiCorporateDPLDetailsEndPoint =
      '$kBaseCorporateAPIEndPoint/detailsdpl';
  static final String kApiCorporateDPLListEndPoint =
      '$kBaseCorporateAPIEndPoint/activepassivedpl';
  static final String kApiCorporateStoreDPLEndPoint =
      '$kBaseCorporateAPIEndPoint/storedpl';

  //Corporate Refund Requests/Transaction
  static final String kApiCorporateRefundRequestEndPoint =
      '$kBaseCorporateAPIEndPoint/transaction';
  static final String kApiCorporateRefundsTransactionDetailsEndPoint =
      '$kBaseCorporateAPIEndPoint/transaction/details';
  static final String kApiCorporateRefundRequestEditEndPoint =
      '$kBaseCorporateAPIEndPoint/transaction/edit';

  //Corporate Wallet
  static final String kApiCorporateWalletEndPoint =
      '$kBaseCorporateAPIEndPoint/wallet/list';

  //Corporate dashboard
  static final String kApiCorporateDashboardEndPoint =
      '$kBaseCorporateAPIEndPoint/dashboard';

  //Corporate Transactions list
  static final String kApiCorporateTransactionListEndPoint =
      '$kBaseCorporateAPIEndPoint/transaction';

  //Corporate Profile Settings
  static final String kApiCorporateUploadImageEndPoint =
      '$kBaseCorporateAPIEndPoint/profile/image';
  static final String kApiCorporateChangePasswordEndPoint =
      '$kBaseCorporateAPIEndPoint/profile/password';
  static final String kApiProfileSettingsEndPoint =
      '$kBaseCorporateAPIEndPoint/profile/info';

  //Corporate Notifications
  static final String kApiCorporateNotificationsEndPoint =
      '$kBaseCorporateAPIEndPoint/notifications';
  static final String kApiCorporateReadNotificationsEndPoint =
      '$kBaseCorporateAPIEndPoint/notifications/read';
}
