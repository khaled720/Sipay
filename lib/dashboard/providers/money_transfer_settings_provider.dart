import 'package:flutter/foundation.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';

class MoneyTransferSettingsProvider with ChangeNotifier {
  BaseMainRepository _baseMainRepository;
  bool _showLoad;
  bool _checkBoxValue;
  String _selectedDropDownValue;
  MoneyTransferSettingsProvider(this._baseMainRepository) {
    _checkBoxValue = true;
    getMoneyTransferSettings();
  }

  get checkBoxValue => _checkBoxValue;

  get showLoad => _showLoad;

  String get selectedDropDownValue => _selectedDropDownValue;

  setCheckBox(bool checkBoxValue) {
    this._checkBoxValue = checkBoxValue;
    notifyListeners();
  }

  _setShowLoad(bool showLoad) {
    this._showLoad = showLoad;
    notifyListeners();
  }

  setMoneyTransferSettingDropDownValue(String value) {
    _selectedDropDownValue = value;
    notifyListeners();
  }

  saveMoneyTransferSettings(Function onSuccess, Function onFailure) async {
    _setShowLoad(true);
    MainApiModel moneyTransferSettingsUpdateModel =
        await _baseMainRepository.moneyTransferSettingsUpdate(
            _checkBoxValue ? 1 : 0,
            _selectedDropDownValue == 'AVAILABLE BALANCE' ? 0 : 1);
    moneyTransferSettingsUpdateModel.statusCode == 100
        ? onSuccess()
        : onFailure(moneyTransferSettingsUpdateModel.description);
    _setShowLoad(false);
  }

  getMoneyTransferSettings() async {
    MainApiModel userSavedTransferSettings =
        await _baseMainRepository.moneyTransferSettings();
    var moneyTransferSettings = userSavedTransferSettings.data['moneytransfer'];
    _checkBoxValue =
        moneyTransferSettings['enable_money_transfer'] == 1 ? true : false;
    _selectedDropDownValue =
        moneyTransferSettings['money_transfer_from_total_balance'] == 0
            ? 'AVAILABLE BALANCE'
            : 'TOTAL BALANCE';
    notifyListeners();
  }
}
