import 'package:flutter/foundation.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';

class NotificationSettingsProvider with ChangeNotifier {
  BaseMainRepository _baseMainRepository;
  bool _showLoad;
  bool _checkBoxValue;
  String _selectedDropDownValue;
  List _notificationSettingsUI;
  List _checkedSMSList;
  List _checkedEmailList;
  List _uncheckedSMSList;
  List _uncheckedEmailList;
  var _notificationListMap;

  NotificationSettingsProvider(this._baseMainRepository) {
    _notificationSettingsUI = List();
    _checkedSMSList = List();
    _checkedEmailList = List();
    _checkBoxValue = true;
    getNotificationSettings();
  }

  get checkBoxValue => _checkBoxValue;

  get showLoad => _showLoad;

  get notificationSettingsUI =>
      _notificationSettingsUI != null ? _notificationSettingsUI : List();

  get checkedSMSList => _checkedSMSList != null ? _checkedSMSList : List();

  get checkedEmailList =>
      _checkedEmailList != null ? _checkedEmailList : List();

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

  setSMSCheckBox(int index, bool value) {
    if (!_uncheckedSMSList.contains(index + 1)) {
      _checkedSMSList[index] = value;
      notifyListeners();
    }
  }

  setEmailCheckBox(int index, bool value) {
    if (!_uncheckedEmailList.contains(index + 1)) {
      _checkedEmailList[index] = value;
      notifyListeners();
    }
  }

  saveNotificationSettings(Function onSuccess, Function onFailure) async {
    Map<String, String> smsValues = Map();
    Map<String, String> emailValues = Map();
    for (int i = 0; i < _checkedSMSList.length; i++) {
      smsValues[i.toString()] = _checkedSMSList[i] == true ? '1' : '0';
      emailValues[i.toString()] = _checkedEmailList[i] == true ? '1' : '0';
    }
    _setShowLoad(true);
    MainApiModel notificationSettingsUpdateModel = await _baseMainRepository
        .notificationSettingsUpdate(smsValues, emailValues);
    notificationSettingsUpdateModel.statusCode == 100
        ? onSuccess()
        : onFailure(notificationSettingsUpdateModel.description);
    _setShowLoad(false);
  }

  getNotificationSettings() async {
    MainApiModel userSavedNotificationSettings =
        await _baseMainRepository.notificationSettings();


        print(">>>>- "+userSavedNotificationSettings.data.toString());

    _notificationListMap =
        userSavedNotificationSettings.data['notification_list'];
    List checkedSMSList =
        userSavedNotificationSettings.data['checked_sms_list'];
    List checkedEmail =
        userSavedNotificationSettings.data['checked_email_list'];

    _uncheckedSMSList = userSavedNotificationSettings.data['hidden_sms_list'];
    _uncheckedEmailList =
        userSavedNotificationSettings.data['hidden_email_list'];
    for (String key in _notificationListMap.keys) {
      _notificationSettingsUI.add(_notificationListMap[key]);
      _checkedSMSList.add(checkedSMSList.contains(int.parse(key)));
      _checkedEmailList.add(checkedEmail.contains(int.parse(key)));
      
    }
    notifyListeners();
  }
}
