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
