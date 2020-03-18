import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttersipay/login_screens/login_repo.dart';
import 'package:fluttersipay/utils/constants.dart';

import '../../main_api_data_model.dart';

class LoginProvider with ChangeNotifier {
  LoginRepository _loginRepo;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _telephoneController;
  bool _showLoad = false;
  bool _showIndividualLoginErrorMessage = false;
  bool _showCorporateLoginErrorMessage = false;
  bool _rememberPassword = false;
  bool _customerOrCorporate = true;
  String _phoneNumberErrorText;
  String _emailAddressErrorText;
  String _passwordErrorText;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get telephoneController => _telephoneController;

  String get phoneNumberErrorText => _phoneNumberErrorText;

  String get emailAddressErrorText => _emailAddressErrorText;

  String get passwordErrorText => _passwordErrorText;

  bool get showLoad => _showLoad;

  bool get showIndividualLoginErrorMessage => _showIndividualLoginErrorMessage;

  bool get showCorporateLoginErrorMessage => _showCorporateLoginErrorMessage;

  bool get rememberPassword => _rememberPassword;

  UserTypes get userType =>
      _customerOrCorporate ? UserTypes.Individual : UserTypes.Corporate;

  bool get customerOrCorporate => _customerOrCorporate;

  LoginProvider(this._loginRepo, this._emailController,
      this._passwordController, this._telephoneController);

  void login(Function onSuccess, Function onNotVerified, Function onFailure) {
    _customerOrCorporate
        ? _loginIndividual(onSuccess, onNotVerified, onFailure)
        : _loginCorporate(onSuccess, onNotVerified, onFailure);
  }

  void _loginIndividual(
      Function onSuccess, Function onNotVerified, Function onFailure) async {
    if (_telephoneController.text != null) {
      if (_telephoneController.text.isNotEmpty) {
        _setIndividualLoginErrorText(false);
        _setShowLoading(true);
        MainApiModel individualLoginResult =
            await _loginRepo.individualLogin(_telephoneController.text.trim());
        _setShowLoading(false);
        if (individualLoginResult.statusCode == 100) {
          individualLoginResult.data['message'] ==
                  'Enter password to continue login'
              ? onSuccess(_telephoneController.text.trim())
              : onNotVerified(_telephoneController.text.trim());
        } else
          _setIndividualLoginErrorText(true);
      }
    }
  }

  void _loginCorporate(Function onSuccess, Function onNotVerified,
      Function(String errorMsg) onFailure) async {
    if (_emailController.text != null && _passwordController.text != null) {
      if (_emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        _setCorporateLoginErrorText(false);
        _setShowLoading(true);
        MainApiModel corporateLoginResult = await _loginRepo.corporateLogin(
            _emailController.text.trim(), _passwordController.text.trim());
        _setShowLoading(false);
        // int verified = corporateLoginResult.data['user']['verified'];
        if (corporateLoginResult.statusCode == 100)
          // verified == 1
          // ? onSuccess(corporateLoginResult)
          // :
          onNotVerified(corporateLoginResult);
        else {
          _setIndividualLoginErrorText(true);
          onFailure('');
        }
      }
    }
  }

  void _setShowLoading(bool load) {
    _showLoad = load;
    notifyListeners();
  }

  void setRememberPassword(bool remember) {
    _rememberPassword = remember;
    notifyListeners();
  }

  void toggleCustomerCorporate() {
    _customerOrCorporate = !_customerOrCorporate;
    notifyListeners();
  }

  void _setIndividualLoginErrorText(bool isError) {
    _showIndividualLoginErrorMessage = isError;
    notifyListeners();
  }

  void _setCorporateLoginErrorText(bool isError) {
    _showCorporateLoginErrorMessage = isError;
    notifyListeners();
  }

//  void _setPhoneNumberErrorText(bool isError) {
//    isError
//        ? _phoneNumberErrorText = 'User not found. Please Register.'
//        : _phoneNumberErrorText = null;
//    notifyListeners();
//  }
//
//  void _setEmailAddressErrorText(bool isError) {
//    isError
//        ? _emailAddressErrorText =
//            'Email address is not correct. Please try again.'
//        : _emailAddressErrorText = null;
//    notifyListeners();
//  }
//
//  void _setPasswordErrorText(bool isError) {}

}
