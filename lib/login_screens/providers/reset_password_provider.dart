import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttersipay/login_screens/login_repo.dart';

import '../login_models.dart';

class ResetPasswordProvider with ChangeNotifier {
  LoginRepository _loginRepo;
  TextEditingController _emailController;
  bool _showLoad = false;
  String _phoneNumberErrorText;

  TextEditingController get emailController => _emailController;

  String get emailErrorText => _phoneNumberErrorText;

  bool get showLoad => _showLoad;

  ResetPasswordProvider(this._loginRepo, this._emailController);

  void _setShowLoading(bool load) {
    _showLoad = load;
    notifyListeners();
  }

  void _setEmailErrorText(bool isError, String errorMsg) {
    isError ? _phoneNumberErrorText = errorMsg : _phoneNumberErrorText = null;
    notifyListeners();
  }

  void resetPassword(Function onSuccess, Function onFailure) async {
    if (_emailController.text != null) {
      if (_emailController.text.isNotEmpty) {
        _setEmailErrorText(false, '');
        _setShowLoading(true);
        LoginModel resetPasswordResult = await _loginRepo
            .resetIndividualPassword(_emailController.text.trim());
        _setShowLoading(false);
        resetPasswordResult.statusCode == 100
            ? onSuccess(resetPasswordResult.description)
            : _setEmailErrorText(true, resetPasswordResult.description);
      }
    }
  }
}
