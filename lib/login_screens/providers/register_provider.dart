import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttersipay/login_screens/login_repo.dart';

import '../../main_api_data_model.dart';

class RegisterProvider with ChangeNotifier {
  LoginRepository _loginRepo;
  TextEditingController _telephoneController;
  bool _showLoad = false;
  String _phoneNumberErrorText;

  TextEditingController get telephoneController => _telephoneController;

  String get phoneNumberErrorText => _phoneNumberErrorText;

  bool get showLoad => _showLoad;

  RegisterProvider(this._loginRepo, this._telephoneController);

  void _setShowLoading(bool load) {
    _showLoad = load;
    notifyListeners();
  }

  void _setPhoneNumberErrorText(bool isError, String errorMsg) {
    isError ? _phoneNumberErrorText = errorMsg : _phoneNumberErrorText = null;
    notifyListeners();
  }

  void registerIndividual(Function onSuccess, Function onFailure) async {
    if (_telephoneController.text != null) {
      if (_telephoneController.text.isNotEmpty) {
        _setPhoneNumberErrorText(false, '');
        _setShowLoading(true);
        MainApiModel individualRegisterResult = await _loginRepo
            .registerIndividual(_telephoneController.text.trim());
        _setShowLoading(false);
        //String errorMsg = individualRegisterResult.data['user']['name'];
        individualRegisterResult.statusCode == 100
            ? onSuccess(_telephoneController.text.trim())
            : _setPhoneNumberErrorText(
                true, individualRegisterResult.description);
      }
    }
  }
}
