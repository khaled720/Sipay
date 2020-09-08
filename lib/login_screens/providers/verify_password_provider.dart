import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttersipay/login_screens/login_repo.dart';
import 'package:translator/translator.dart' as translator;
import '../../main_api_data_model.dart';

class VerifyPasswordProvider with ChangeNotifier {
  LoginRepository _loginRepo;
  TextEditingController _passwordController;
  bool _showLoad = false;
  String _phone;
  String _passwordErrorText;

  TextEditingController get passwordController => _passwordController;

  String get passwordErrorText => _passwordErrorText;

  bool get showLoad => _showLoad;

  VerifyPasswordProvider(
      this._loginRepo, this._passwordController, this._phone);

  void _setShowLoading(bool load) {
    _showLoad = load;
    notifyListeners();
  }

  void _setPasswordErrorText(bool isError, String errorMsg) async{


/*  var x= await translator.GoogleTranslator().translate(errorMsg??"", from: 'tr', to: 'en');
 */
    isError ? _passwordErrorText = "Incorrect Password !"/*x*/ 
    
    : _passwordErrorText = null;



    notifyListeners();
  }

  void verifyPassword(Function onSuccess, Function onFailure) async {
    if (_passwordController.text != null) {
      if (_passwordController.text.isNotEmpty) {
        _setPasswordErrorText(false, '');
        _setShowLoading(true);
        MainApiModel verifyPasswordResult =
            await _loginRepo.loginVerifiedIndividualWithPassword(
                _phone, _passwordController.text.trim());
        _setShowLoading(false);
        verifyPasswordResult.statusCode == 100
            ? onSuccess(verifyPasswordResult)
            : _setPasswordErrorText(true, verifyPasswordResult.description);
      }
    }
  }
}
