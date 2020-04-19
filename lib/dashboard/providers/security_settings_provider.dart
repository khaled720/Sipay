import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';

class SecuritySettingsProvider with ChangeNotifier {
  BaseMainRepository _baseMainRepository;
  bool _showLoad;
  TextEditingController _currentPassword;
  TextEditingController _newPasswordController;
  TextEditingController _confirmPasswordController;
  TextEditingController _currentPasswordEmailController;
  TextEditingController _newEmailController;
  String _currentPasswordErrorMessage;
  String _newPasswordErrorMessage;
  String _confirmPasswordErrorMessage;
  String _currentPasswordEmailErrorMessage;
  String _newEmailErrorMessage;
  static final kEmptyFieldErrorMessage = 'This field can\'t be empty.';

  SecuritySettingsProvider(
      this._baseMainRepository,
      this._currentPassword,
      this._newPasswordController,
      this._confirmPasswordController,
      this._currentPasswordEmailController,
      this._newEmailController);

  String get newPasswordErrorMessage => _newPasswordErrorMessage;

  String get confirmPasswordErrorMessage => _confirmPasswordErrorMessage;

  String get currentPasswordEmailErrorMessage =>
      _currentPasswordEmailErrorMessage;

  String get newEmailErrorMessage => _newEmailErrorMessage;

  String get currentPasswordErrorMessage => _currentPasswordErrorMessage;

  TextEditingController get currentPassword => _currentPassword;

  TextEditingController get newPassword => _newPasswordController;

  TextEditingController get confirmPassword => _confirmPasswordController;

  TextEditingController get currentPasswordEmail =>
      _currentPasswordEmailController;

  TextEditingController get newEmail => _newEmailController;

  get showLoad => _showLoad;

  _setShowLoad(bool showLoad) {
    this._showLoad = showLoad;
    notifyListeners();
  }

  _resetPasswordErrorMessages() {
    _confirmPasswordErrorMessage = null;
    _currentPasswordErrorMessage = null;
    _newPasswordErrorMessage = null;
    notifyListeners();
  }

  _resetEmailErrorMessages() {
    _newEmailErrorMessage = null;
    _currentPasswordEmailErrorMessage = null;
    notifyListeners();
  }

  changeEmail(Function onSuccess, Function onFailure) async {
    _resetEmailErrorMessages();
    if (_currentPasswordEmailController.text.trim().isEmpty ||
        _newEmailController.text.trim().isEmpty) {
      if (_currentPasswordEmailController.text.trim().isEmpty)
        _currentPasswordEmailErrorMessage = kEmptyFieldErrorMessage;
      if (_newEmailController.text.trim().isEmpty)
        _newEmailErrorMessage = kEmptyFieldErrorMessage;
      return;
    }
    _setShowLoad(true);
    MainApiModel changeEmailModel = await _baseMainRepository.changeEmail(
      _currentPasswordEmailController.text.trim(),
      _newEmailController.text.trim(),
    );
    _setShowLoad(false);
    if (changeEmailModel != null) {
      changeEmailModel.statusCode == 100
          ? onSuccess(changeEmailModel)
          : onFailure(changeEmailModel.description);
    }
  }

  changePassword(Function onSuccess, Function onFailure) async {
    _resetPasswordErrorMessages();
    if (currentPassword.text.trim().isEmpty ||
        _newPasswordController.text.trim().isEmpty ||
        _confirmPasswordController.text.trim().isEmpty) {
      if (currentPassword.text.trim().isEmpty)
        _currentPasswordErrorMessage = kEmptyFieldErrorMessage;
      if (_newPasswordController.text.trim().isEmpty)
        _newPasswordErrorMessage = kEmptyFieldErrorMessage;
      if (_confirmPasswordController.text.trim().isEmpty)
        _confirmPasswordErrorMessage = kEmptyFieldErrorMessage;
      return;
    }
    _setShowLoad(true);
    MainApiModel changePasswordModel =
        await _baseMainRepository.changeCorporatePassword(
            _currentPassword.text.trim(),
            _newPasswordController.text.trim(),
            _confirmPasswordController.text.trim());
    _setShowLoad(false);
    if (changePasswordModel != null) {
      changePasswordModel.statusCode == 100
          ? onSuccess(changePasswordModel)
          : onFailure(changePasswordModel.description);
    }
  }
}
