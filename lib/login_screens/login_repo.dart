//this class handles all the calls to the login API whether it's an individual or corporate.
import 'dart:convert';
import 'package:fluttersipay/corporate/global_data.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/utils/api_endpoints.dart';
import 'package:fluttersipay/utils/network_utils.dart';

class LoginRepository {
  //Individual login API methods.

  //Individual login
  Future<MainApiModel> individualLogin(String phone) async {
   
    Map<String, String> values = {'phone': phone};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kAPIIndividualLoginEndPoint, values, null);
   
/*  print("xxxxxxx"+result.toString());
      var map=json.decode(result);

    userName=map["data"]["user"]["name"].toString(); */
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual verify SMS OTP
  Future<MainApiModel> verifyIndividualSMSOTP(String otp, String userID) async {
    Map<String, String> values = {'OTP': otp, 'user_id': userID};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualVerifySMSEndPoint, values, null);
     //   print("login repo .dart line 23 =>>>>>> "+result);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual resend SMS OTP
  Future<MainApiModel> resendIndividualSMSOTP(String userID) async {
    Map<String, String> values = {'user_id': userID};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualResendOTPEndPoint, values, null);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual Password login
  Future<MainApiModel> loginVerifiedIndividualWithPassword(
   
      String phone, String password) async {
    print("zzzzzzzzz");
    Map<String, String> values = {'phone': phone, 'password': password};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kAPIIndividualLoginEndPoint, values, null);

var map=json.decode(result);
 print("xxxxxxx"+result.toString());
;

    userName=map["data"]["user"]["name"].toString();
   // userName=map["data"]["user"]["name"].toString()??"not found"; 
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual register
  Future<MainApiModel> registerIndividual(String phoneNumber) async {
    Map<String, String> values = {'phone': phoneNumber};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualRegisterEndPoint, values, null);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual register user verification KYC OTP
  Future<MainApiModel> smsVerifyRegisterIndividual(
      String phoneNumber, String otp) async {
    Map<String, String> values = {'phone': phoneNumber, 'OTP': otp};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualSMSVerifyRegisterEndPoint, values, null);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual register user verification KYC OTP
  Future<String> testRegisterOTP() async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiIndividualOTPTestEndPoint, null);
    return result;
  }

  //Individual register user verification KYC resend OTP
  Future<MainApiModel> resendSMSVerifyRegisterIndividual(
      String phoneNumber) async {
    Map<String, String> values = {'phone': phoneNumber};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualResendSMSVerifyRegisterEndPoint,
        values,
        null);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual reset password
  Future<MainApiModel> resetIndividualPassword(String email) async {
    Map<String, String> values = {'email': email};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualResetPasswordEndPoint, values, null);
    return MainApiModel.mapJsonToModel(result);
  }

  //Individual user verification (KYC)
  Future<MainApiModel> userVerificationKYC(
      String name,
      String surName,
      String tckn,
      String email,
      String password,
      String confirmPassword,
      String yearOfBirth,
      var bearerToken) async {
//    Map<String, dynamic> values = {
//      'name': 'İpek',
//      'surname': 'Alan',
//      'tckn': '36067901608',
//      'date_of_birth': '1993',
//      'sector': '5',
//      'other_sector': 'null',
//      'email': 'test@email.com',
//      'password': 'Nop@ss1234',
//      'verify_password': 'Nop@ss1234'
//    };
    Map<String, dynamic> values = {
      'name': name,
      'surname': surName,
      'tckn': tckn,
      'date_of_birth': yearOfBirth,
      'sector': '5',
      'other_sector': 'null',
      'email': email,
      'password': password,
      'verify_password': confirmPassword
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualUserVerificationEndPoint,
        values,
        bearerToken);
    return MainApiModel.mapJsonToModel(result);
  }

  //Corporate login API methods.

  //Corporate login
  Future<MainApiModel> corporateLogin(String email, String password) async {
    Map<String, String> values = {'email': email, 'password': password};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kAPICorporateLoginEndPoint, values, null);
        print("COR login res=> "+result.toString());
   var map=json.decode(result);

    userName=map["data"]["user"]["name"].toString();
    return MainApiModel.mapJsonToModel(result);
  }

  //Corporate verify SMS OTP
  Future<MainApiModel> verifyCorporateSMSOTP(String otp, String userID) async {
    Map<String, String> values = {'OTP': otp, 'user_id': userID};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiCorporateVerifySMSEndPoint, values, null);
    return MainApiModel.mapJsonToModel(result);
  }

  //Corporate resend SMS OTP
  Future<MainApiModel> resendCorporateSMSOTP(String userID) async {
    Map<String, String> values = {'user_id': userID};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiCorporateResendOTPEndPoint, values, null);
    return MainApiModel.mapJsonToModel(result);
  }

  //Corporate reset password
  Future<MainApiModel> changeCorporatePassword(
    String currentPassword,
    String newPassword,
    String confirmNewPassword,
  ) async {
    Map<String, String> values = {
      'current_password': currentPassword,
      'new_password': newPassword,
      'confirm_new_password': confirmNewPassword
    };
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiCorporateResetPasswordEndPoint, values, null);
    return MainApiModel.mapJsonToModel(result);
  }
}
