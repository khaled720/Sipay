import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttersipay/login_screens/login_repo.dart';
import 'package:fluttersipay/utils/validator.dart';
import 'package:translator/translator.dart' as translator;
import '../../main_api_data_model.dart';

class ResetPasswordProvider with ChangeNotifier {
  LoginRepository _loginRepo;
  TextEditingController _emailController;
  bool _showLoad = false;
  String _emailErrorText;

  TextEditingController get emailController => _emailController;

  String get emailErrorText => _emailErrorText;

  bool get showLoad => _showLoad;

  ResetPasswordProvider(this._loginRepo, this._emailController) {
    _emailController.addListener(_emailValidator);
  }

  _emailValidator() {
    _setEmailErrorText(false, '');
    if (_emailController.text.isNotEmpty) {
      if (!Validator.checkIfEmailIsValid(_emailController.text.trim())) {
        _setEmailErrorText(true, 'Please enter a valid e-mail address.');
      } else {
        _setEmailErrorText(false, '');
      }
    }
  }

  void _setShowLoading(bool load) {
    _showLoad = load;
    notifyListeners();
  }

  void _setEmailErrorText(bool isError, String errorMsg) {
    isError ? _emailErrorText = errorMsg : _emailErrorText = null;
    notifyListeners();
  }

  void resetPassword(Function onSuccess, Function onFailure) async {
    if (_emailController.text != null) {
      if (_emailController.text.isNotEmpty && _emailErrorText == null) {
        _setEmailErrorText(false, '');
        _setShowLoading(true);
        MainApiModel resetPasswordResult = await _loginRepo
            .resetIndividualPassword(_emailController.text.trim());
             print(resetPasswordResult.description.toString());
        _setShowLoading(false);


       translator.GoogleTranslator().translate(
         resetPasswordResult.description.toString(), to: 'en',from: 'tr')
      .then((s){resetPasswordResult.description=s;
      resetPasswordResult.statusCode == 100
            ? onSuccess(resetPasswordResult.description)
            : _setEmailErrorText(true, resetPasswordResult.description);
      }
      ); 
        
 
      }
    }
  }
}
