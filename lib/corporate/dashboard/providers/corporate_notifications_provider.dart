import 'package:flutter/foundation.dart';
import 'package:fluttersipay/corporate/dashboard/merchant_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';

class CorporateNotificationsMainProvider with ChangeNotifier {
  MerchantMainRepository _merchantRepo;
  List _notificationsList;
  CorporateNotificationsMainProvider(this._merchantRepo) {
    _getNotificationsForm();
  }

  get notificationsList =>
      _notificationsList != null ? _notificationsList : List();

  void _getNotificationsForm() async {
    MainApiModel notificationsModel =
        await _merchantRepo.corporateNotificationsForm();
    if (notificationsModel.statusCode == 100) {
      _notificationsList = notificationsModel.data['notifications'];
      notifyListeners();
    }
  }
}
