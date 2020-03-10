//this class handles all the calls to the login API whether it's an individual or corporate.
import 'package:fluttersipay/login_screens/login_models.dart';
import 'package:fluttersipay/utils/api_endpoints.dart';
import 'package:fluttersipay/utils/network_utils.dart';

class LoginRepository {
  //Individual login API methods.

  //Individual login
  Future<LoginModel> individualLogin(String phone) async {
    Map<String, String> values = {'phone': phone};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kAPIIndividualLoginEndPoint, values);
    return LoginModel.mapJsonToModel(result);
  }

  //Individual verify SMS OTP
  Future<String> verifyIndividualSMSOTP(String otp, String userID) async {
    Map<String, String> values = {'OTP': otp, 'user_id': userID};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualVerifySMSEndPoint, values);
    return result;
  }

  //Individual resend SMS OTP
  Future<String> resendIndividualSMSOTP(String userID) async {
    Map<String, String> values = {'user_id': userID};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualResendOTPEndPoint, values);
    return result;
  }

  //Individual logout
  Future<String> logoutIndividual() async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kApiIndividualResendOTPEndPoint);
    return result;
  }

  //Individual register
  Future<LoginModel> registerIndividual(String phoneNumber) async {
    Map<String, String> values = {'phone': phoneNumber};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualRegisterEndPoint, values);
    print('register result $result');
    return LoginModel.mapJsonToModel(result);
  }

  //Individual reset password
  Future<LoginModel> resetIndividualPassword(String email) async {
    Map<String, String> values = {'email': email};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiIndividualResetPasswordEndPoint, values);
    print('reset password result $result');
    return LoginModel.mapJsonToModel(result);
  }

  //Corporate login API methods.

  //Corporate login
  Future<LoginModel> corporateLogin(String email, String password) async {
    Map<String, String> values = {'email': email, 'password': password};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kAPICorporateLoginEndPoint, values);
    return LoginModel.mapJsonToModel(result);
  }

  //Corporate verify SMS OTP
  Future<String> verifyCorporateSMSOTP(String otp, String userID) async {
    Map<String, String> values = {'OTP': otp, 'user_id': userID};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiCorporateVerifySMSEndPoint, values);
    return result;
  }

  //Corporate resend SMS OTP
  Future<String> resendCorporateSMSOTP(String userID) async {
    Map<String, String> values = {'user_id': userID};
    String result = await NetworkHelper.makePostRequest(
        APIEndPoints.kApiCorporateResendOTPEndPoint, values);
    return result;
  }

  //Corporate logout
  Future<String> logoutCorporate() async {
    String result = await NetworkHelper.makeGetRequest(
        APIEndPoints.kAPICorporateLogoutEndPoint);
    return result;
  }
}
