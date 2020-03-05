import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttersipay/Login/login_models.dart';
import 'package:fluttersipay/Login/login_repo.dart';

class LoginProvider with ChangeNotifier {
  LoginRepository _loginRepo;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _telephoneController;
  bool _showLoad = false;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get telephoneController => _telephoneController;

  bool get showLoad => _showLoad;

  LoginProvider(this._loginRepo, this._emailController,
      this._passwordController, this._telephoneController);

  void login(bool isCustomer, Function onSuccess, Function onFailure) {
    isCustomer
        ? _loginIndividual(onSuccess, onFailure)
        : _loginCorporate(onSuccess, onFailure);
  }

  void _loginIndividual(Function onSuccess, Function onFailure) async {
    if (_telephoneController.text != null) {
      if (_telephoneController.text.isNotEmpty) {
        _setShowLoading(true);
        LoginModel individualLoginResult =
            await _loginRepo.individualLogin(_telephoneController.text.trim());
        _setShowLoading(false);
        String name = individualLoginResult.data['user']['name'];
        individualLoginResult.statusCode == 100
            ? onSuccess(name)
            : onFailure(individualLoginResult.description);
      }
    }
  }

  void _loginCorporate(Function(String name) onSuccess,
      Function(String errorMsg) onFailure) async {
    if (_emailController.text != null && _passwordController.text != null) {
      if (_emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        _setShowLoading(true);
        LoginModel corporateLoginResult = await _loginRepo.corporateLogin(
            _emailController.text.trim(), _passwordController.text.trim());
        _setShowLoading(false);
        String name = corporateLoginResult.data['user']['name'];
        corporateLoginResult.statusCode == 100
            ? onSuccess(name)
            : onFailure(corporateLoginResult.description);
      }
    }
  }

  void _setShowLoading(bool load) {
    _showLoad = load;
    notifyListeners();
  }
}
